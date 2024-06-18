-- SCOTT  
--(화) :  PL/SQL
--------------------------------------------------------------------------------
-- 1. [%TYPE형 변수]
-- 2. [%ROWTYPE형 변수]
-- 3. [RECORD형 변수] --
SELECT d.deptno, dname, empno, ename, sal + NVL(comm,0) pay
FROM dept d JOIN emp e ON d.deptno = e.deptno
WHERE empno = 7369;
-- 1) 익명프로시저 작성+테스트 ( %TYPE 형 변수 )
DECLARE
  vdeptno dept.deptno%TYPE;
  vdname dept.dname%TYPE;
  vempno emp.empno%TYPE;
  vename emp.ename%TYPE;
  vpay NUMBER;
BEGIN
  SELECT d.deptno, dname, empno, ename, sal + NVL(comm,0) pay
    INTO vdeptno, vdname, vempno, vename, vpay
  FROM dept d JOIN emp e ON d.deptno = e.deptno
  WHERE empno = 7369;
  
  DBMS_OUTPUT.PUT_LINE( vdeptno || ', ' || vdname  
    || ', ' ||  vempno  || ', ' || vename  || ', ' ||  vpay );
-- EXCEPTION
END;

-- 2) 익명프로시저 작성+테스트 ( %ROWTYPE 형 변수 )
DECLARE
  vdrow dept%ROWTYPE;
  verow  emp%ROWTYPE;
  vpay NUMBER;
BEGIN
  SELECT d.deptno, dname, empno, ename, sal + NVL(comm,0) pay
    INTO vdrow.deptno, vdrow.dname, verow.empno, verow.ename, vpay
  FROM dept d JOIN emp e ON d.deptno = e.deptno
  WHERE empno = 7369;
  
  DBMS_OUTPUT.PUT_LINE( vdrow.deptno || ', ' || vdrow.dname 
    || ', ' ||  verow.empno  || ', ' || verow.ename  || ', ' ||  vpay );
-- EXCEPTION
END;

-- 3) 익명프로시저 작성+테스트 ( RECORD 형 변수 )
DECLARE
  -- "부서번호,부서명,사원번호,사원명,급여" 새로운 하나의 자료형 선언
  --  ( 사용자 정의 구조체 타입 선언 )
  TYPE EmpDeptType  IS RECORD
  (
      deptno dept.deptno%TYPE,
      dname dept.dname%TYPE,
      empno emp.empno%TYPE,
      ename emp.ename%TYPE,
      pay NUMBER
  );
  -- 변수 선언
  vderow EmpDeptType;
BEGIN
  SELECT d.deptno, dname, empno, ename, sal + NVL(comm,0) pay
    INTO vderow.deptno, vderow.dname, vderow.empno, vderow.ename, vderow.pay
  FROM dept d JOIN emp e ON d.deptno = e.deptno
  WHERE empno = 7369;
  
  DBMS_OUTPUT.PUT_LINE( vderow.deptno || ', ' || vderow.dname 
    || ', ' ||  vderow.empno  || ', ' || vderow.ename  ||
    ', ' ||  vderow.pay );
-- EXCEPTION
END;

-- 4) 익명프로시저 작성+테스트 ( RECORD 형 변수 )
--01422. 00000 -  "exact fetch returns more than requested number of rows"
--*Cause:    The number specified in exact fetch is less than the rows returned.
--*Action:   Rewrite the query or change number of rows requested
--  커서(cursor)
DECLARE
  TYPE EmpDeptType  IS RECORD
  (
      deptno dept.deptno%TYPE,
      dname dept.dname%TYPE,
      empno emp.empno%TYPE,
      ename emp.ename%TYPE,
      pay NUMBER
  ); 
  vderow EmpDeptType;
BEGIN
  SELECT d.deptno, dname, empno, ename, sal + NVL(comm,0) pay
  --  INTO vderow.deptno, vderow.dname, vderow.empno, vderow.ename, vderow.pay
  FROM dept d JOIN emp e ON d.deptno = e.deptno;  
  -- WHERE empno = 7369; 
  DBMS_OUTPUT.PUT_LINE( vderow.deptno || ', ' || vderow.dname 
    || ', ' ||  vderow.empno  || ', ' || vderow.ename  ||
    ', ' ||  vderow.pay );    
-- EXCEPTION
END;


-- [ 5) 커서(CURSOR) ]
1) 커서 ? PL/SQL의 실행블럭 안에서 실행되는 SELECT문 의미
2) 커서의 2가지 종류 
  ㄱ. 묵시적 커서 : SELECT문의 실행 결과가 1개 , FOR 문 SELECT문
     ( 자동 )
  ㄴ. 명시적 커서 : SELECT문의 실행 결과가 여러 개
    (1) CURSOR 선언 - 실행한 SELECT문 작성 
    (2) OPEN       -  작성된 SELECT문이 실행되는 과정
    (3) FETCH      -  커서로 부터 여러 개의 레코드 읽어와서 처리과정
         - LOOP문(반복문) 사용
            [ 커서 속성을 사용]
            %ROWCOUNT  속성
            %FOUND 속성
            %NOTFOUND 속성
            %ISOPEN 속성
    (4) CLOSE   
  
 -- 예) 
SELECT d.deptno, dname, empno, ename, sal + NVL(comm,0) pay
FROM dept d JOIN emp e ON d.deptno = e.deptno;  
-- [명시적 커서 + 익명프로시저 작성.테스트]
DECLARE
   TYPE EmpDeptType  IS RECORD
  (
      deptno dept.deptno%TYPE,
      dname dept.dname%TYPE,
      empno emp.empno%TYPE,
      ename emp.ename%TYPE,
      pay NUMBER
  ); 
  vderow EmpDeptType;
   -- 1) 커서 선언
   CURSOR edcursor IS (
     SELECT d.deptno, dname, empno, ename, sal + NVL(comm,0) pay
     FROM dept d JOIN emp e ON d.deptno = e.deptno
   );
BEGIN
   -- 2) 커서 OPEN
   OPEN edcursor;
   -- 3) FETCH
   -- while(true){ if() break;  }
   LOOP
     FETCH edcursor INTO vderow; 
     EXIT WHEN edcursor%NOTFOUND;     
     DBMS_OUTPUT.PUT( edcursor%ROWCOUNT || ' : '  );
     DBMS_OUTPUT.PUT_LINE( vderow.deptno || ', ' || vderow.dname 
      || ', ' ||  vderow.empno  || ', ' || vderow.ename  ||
      ', ' ||  vderow.pay );  
   END LOOP;
   -- 4) 커서 CLOSE
   CLOSE edcursor;
--EXCEPTION
END;

-- 10:01 수업시작~~
-- ㄱ. [암시적 커서 + 익명프로시저 작성]  FOR문 사용
DECLARE
   TYPE EmpDeptType  IS RECORD
  (
      deptno dept.deptno%TYPE,
      dname dept.dname%TYPE,
      empno emp.empno%TYPE,
      ename emp.ename%TYPE,
      pay NUMBER
  ); 
  vderow EmpDeptType;
   -- 1) 커서 선언
   CURSOR edcursor IS (
     SELECT d.deptno, dname, empno, ename, sal + NVL(comm,0) pay
     FROM dept d JOIN emp e ON d.deptno = e.deptno
   );
BEGIN
   -- FOR i IN [REVERSE]1..10
   FOR vderow IN edcursor
   LOOP              
     DBMS_OUTPUT.PUT( edcursor%ROWCOUNT || ' : '  );
     DBMS_OUTPUT.PUT_LINE( vderow.deptno || ', ' || vderow.dname 
      || ', ' ||  vderow.empno  || ', ' || vderow.ename  ||
      ', ' ||  vderow.pay );  
   END LOOP; 
--EXCEPTION
END;

-- ㄴ. [암시적 커서 + 익명프로시저 작성]  FOR문 사용
--DECLARE     
BEGIN 
   FOR vderow IN (
                     SELECT d.deptno, dname, empno, ename, sal + NVL(comm,0) pay
                     FROM dept d JOIN emp e ON d.deptno = e.deptno
                   )
   LOOP                   
     DBMS_OUTPUT.PUT_LINE( vderow.deptno || ', ' || vderow.dname 
      || ', ' ||  vderow.empno  || ', ' || vderow.ename  ||
      ', ' ||  vderow.pay );  
   END LOOP; 
--EXCEPTION
END;

-- [저장 프로시저(STORED PROCEDURE)]
CREATE OR REPLACE PROCEDURE  프로시저명
(
    매개변수( argument, paramter ),
    매개변수( argument, paramter ),
    p
)
IS
    v ;
    v ;
BEGIN
EXCEPTION
END;

-- 저장 프로시저를 실행하는 3가지 방법
--1) EXECUTE 문으로 실행. 
--2) 익명프로시저에서 호출해서 실행
--3) 또 다른 저장프로시저에서 호출해서 실행
 
-- 서브쿼리를 사용해서 테이블 생성
CREATE TABLE tbl_emp
AS
(SELECT * FROM emp);
-- 
SELECT *
FROM tbl_emp; 
-- 저장(stored) 프로시저 :    up_  
DELETE FROM tbl_emp
WHERE empno = 9999;

-- 
CREATE OR REPLACE PROCEDURE up_deltblemp
(
   -- pempno NUMBER(4) X (기억)
   -- pempno NUMBER  O
   -- pempno IN tbl_emp.empno%TYPE
   pempno tbl_emp.empno%TYPE
)
IS
BEGIN
  DELETE FROM tbl_emp
  WHERE empno = pempno;
  COMMIT;
--EXCEPTION
  -- ROLLBACK;
END;

-- Procedure UP_DELTBLEMP이(가) 컴파일되었습니다.
-- [ UP_DELTBLEMP 실행]
--1) EXECUTE 문으로 실행. 
-- PLS-00306: wrong number or types of arguments in call to 'UP_DELTBLEMP'
EXECUTE UP_DELTBLEMP;  X
EXECUTE UP_DELTBLEMP(7369);   
EXECUTE UP_DELTBLEMP(pempno=>7499); 
SELECT *
FROM tbl_emp;

--2) 익명프로시저에서 호출해서 실행
--DECLARE
BEGIN
   UP_DELTBLEMP(7566);
END;

--3) 또 다른 저장프로시저에서 호출해서 실행
CREATE OR REPLACE PROCEDURE up_DELTBLEMP_test
AS
BEGIN
  UP_DELTBLEMP(7521);
END up_DELTBLEMP_test;
-- Procedure UP_DELTBLEMP_TEST이(가) 컴파일되었습니다.
EXEC UP_DELTBLEMP_TEST;

-- 문제1) dept -> tbl_dept 테이블 생성
 CREATE TABLE tbl_dept
 AS
  ( SELECT * FROM dept );
-- 문제2)  tbl_dept 테이블에  deptno 컬럼에 PK 제약조건 설정.
ALTER TABLE tbl_dept
ADD CONSTRAINT  PK_TBLDEPT_DEPTNO PRIMARY KEY(deptno) ;
-- 문제3) 명시적 커서 + tbl_dept 테이블을 SELECT 저장 프로시저 생성
--    실행
--   up_seltbldept  
--   매개변수 X, 변수는 명시적 커서 선언
CREATE OR REPLACE PROCEDURE up_seltbldept
IS
   vdrow tbl_dept%ROWTYPE;
   CURSOR dcursor IS (
                         SELECT deptno, dname, loc
                         FROM tbl_dept
                       );
BEGIN 
   OPEN dcursor; 
   LOOP
     FETCH dcursor INTO vdrow; 
     EXIT WHEN dcursor%NOTFOUND;     
     DBMS_OUTPUT.PUT( dcursor%ROWCOUNT || ' : '  );
     DBMS_OUTPUT.PUT_LINE( vdrow.deptno || ', ' || vdrow.dname 
      || ', ' ||  vdrow.loc);  
   END LOOP; 
   CLOSE dcursor;
--EXCEPTION
END;

EXEC UP_SELTBLDEPT;
-- 문제4) 새로운 부서를 추가하는 저장 프로시저  UP_INSTBLDEPT
--      deptno      시퀀스 
--      dname, loc
SELECT * 
FROM user_sequences;
--      4-1)  seq_deptno 시퀀스 생성  50/10/NOCYCLE/NO캐시 /90
   CREATE SEQUENCE seq_deptno
   INCREMENT BY 10
   START WITH 50
   MAXVALUE 90 
   NOCYCLE
   NOCACHE;
-- Sequence SEQ_DEPTNO이(가) 생성되었습니다.
CREATE OR REPLACE PROCEDURE UP_INSTBLDEPT
(
     pdname IN tbl_dept.dname%TYPE  := NULL
   , ploc   IN tbl_dept.loc%TYPE DEFAULT NULL
)
IS
   -- vdeptno tbl_dept.deptno%TYPE;
BEGIN
--  SELECT MAX(deptno) INTO vdeptno
--  FROM tbl_dept;  
--  vdeptno := vdedptno + 10;
--  
--  INSERT INTO tbl_dept (deptno, dname, loc ) 
--  VALUES ( vdeptno, pdname, ploc );

   INSERT INTO tbl_dept (deptno, dname, loc ) 
   VALUES ( SEQ_DEPTNO.NEXTVAL  , pdname, ploc );
  COMMIT;
--EXCEPTION
END;
-- Procedure UP_INSTBLDEPT이(가) 컴파일되었습니다.

EXEC UP_SELTBLDEPT;
EXEC UP_INSTBLDEPT('QC', 'SEOUL');
EXEC UP_INSTBLDEPT(ploc=>'SEOUL' , pdname=>'QC');

EXEC UP_INSTBLDEPT(pdname=>'QC2');
EXEC UP_INSTBLDEPT(ploc=>'SEOUL');
EXEC UP_INSTBLDEPT;
--
SELECT * 
FROM tbl_dept;
 
-- 문제) up_seltbldept,  up_instbldept
--      [ up_updtbldept ]
EXEC up_updtbldept( 50, 'X', 'Y' );  -- dname, loc
EXEC up_updtbldept( pdeptno=>50,  pdname=>'QC3' );  -- loc
EXEC up_updtbldept( pdeptno=>50,  ploc=>'SEOUL' );  -- 
--12:01 수업시작~
-- ㄱ.
CREATE OR REPLACE PROCEDURE up_updtbldept
(
    pdeptno  tbl_dept.deptno%TYPE
    , pdname tbl_dept.dname%TYPE  := NULL
    , ploc   tbl_dept.loc%TYPE    := NULL
)
IS
  vdname tbl_dept.dname%TYPE;
  vloc   tbl_dept.loc%TYPE;
BEGIN
    -- 수정 전의 원래 dname, loc
    SELECT dname, loc INTO vdname, vloc
    FROM tbl_dept
    WHERE deptno = pdeptno;
    
    IF pdname IS NULL AND ploc IS NULL THEN
       UPDATE tbl_dept
       SET dname = vdname, loc = vloc
       WHERE deptno = pdeptno;
    ELSIF pdname IS NULL THEN
       UPDATE tbl_dept
       SET dname = vdname, loc = ploc
       WHERE deptno = pdeptno;
    ELSIF ploc IS NULL THEN
       UPDATE tbl_dept
       SET dname = pdname, loc = vloc
       WHERE deptno = pdeptno;    
    ELSE
      UPDATE tbl_dept
       SET dname = pdname, loc = ploc
       WHERE deptno = pdeptno; 
    END IF;    
    COMMIT;
-- EXCEPTION
END;
 
-- ㄴ.
CREATE OR REPLACE PROCEDURE up_updtbldept
(
    pdeptno  tbl_dept.deptno%TYPE
    , pdname tbl_dept.dname%TYPE  := NULL
    , ploc   tbl_dept.loc%TYPE    := NULL
)
IS
BEGIN
    IF pdname IS NULL AND ploc IS NULL THEN
    ELSIF pdname IS NULL THEN
       UPDATE tbl_dept
       SET loc = ploc
       WHERE deptno = pdeptno;
    ELSIF ploc IS NULL THEN
       UPDATE tbl_dept
       SET dname = pdname
       WHERE deptno = pdeptno;    
    ELSE
      UPDATE tbl_dept
       SET dname = pdname, loc = ploc
       WHERE deptno = pdeptno; 
    END IF;    
    COMMIT;
-- EXCEPTION
END; 

-- ㄷ.
CREATE OR REPLACE PROCEDURE up_updtbldept
(
    pdeptno  tbl_dept.deptno%TYPE
    , pdname tbl_dept.dname%TYPE  := NULL
    , ploc   tbl_dept.loc%TYPE    := NULL
)
IS
BEGIN
    UPDATE tbl_dept
    SET dname  = NVL(pdname,dname) 
         , loc = CASE
                    WHEN ploc IS NULL THEN loc
                    ELSE ploc
                 END   
    WHERE deptno = pdeptno; 
    COMMIT;
-- EXCEPTION
END;  
--Procedure UP_UPDTBLDEPT이(가) 컴파일되었습니다.

-- 풀이 ㄱ) UP_SELTBLDEPT 모든 부서 조회..+ 명시적 커서
SELECT * FROM tbl_emp;  부서번호를 매개변수
--   해당되는 부서원들만 조회하는 저장 프로시저 작성.  
CREATE OR REPLACE PROCEDURE up_seltblemp
(
   pdeptno tbl_emp.deptno%TYPE := NULL
)
IS
   verow tbl_emp%ROWTYPE;
   CURSOR ecursor IS (
                         SELECT *
                         FROM tbl_emp
                         WHERE deptno = NVL( pdeptno, 10 )
                       );
BEGIN 
   OPEN ecursor; 
   LOOP
     FETCH ecursor INTO verow; 
     EXIT WHEN ecursor%NOTFOUND;     
     DBMS_OUTPUT.PUT( ecursor%ROWCOUNT || ' : '  );
     DBMS_OUTPUT.PUT_LINE( verow.deptno || ', ' || verow.ename
      || ', ' ||  verow.hiredate);  
   END LOOP; 
   CLOSE ecursor;
--EXCEPTION
END;
-- Procedure UP_SELTBLEMP이(가) 컴파일되었습니다.
EXEC UP_SELTBLEMP;
EXEC UP_SELTBLEMP(30);

-- 풀이 ㄴ) UP_SELTBLDEPT 모든 부서 조회..+ 명시적 커서 
--   해당되는 부서원들만 조회하는 저장 프로시저 작성.  
--   [커서 파라미터를 이용하는 방법]
CREATE OR REPLACE PROCEDURE up_seltblemp
(
   pdeptno tbl_emp.deptno%TYPE := NULL
)
IS
   verow tbl_emp%ROWTYPE;
   CURSOR ecursor(cdeptno tbl_emp.deptno%TYPE) IS (
                         SELECT *
                         FROM tbl_emp
                         WHERE deptno = NVL( cdeptno, 10 )
                       );
BEGIN 
   OPEN ecursor( pdeptno ); 
   LOOP
     FETCH ecursor INTO verow; 
     EXIT WHEN ecursor%NOTFOUND;     
     DBMS_OUTPUT.PUT( ecursor%ROWCOUNT || ' : '  );
     DBMS_OUTPUT.PUT_LINE( verow.deptno || ', ' || verow.ename
      || ', ' ||  verow.hiredate);  
   END LOOP; 
   CLOSE ecursor;
--EXCEPTION
END;

-- 풀이 ㄷ) UP_SELTBLDEPT 모든 부서 조회..+ 명시적 커서 
--   해당되는 부서원들만 조회하는 저장 프로시저 작성.  
--   [FOR 문 이용하는 수정]
CREATE OR REPLACE PROCEDURE up_seltblemp
(
   pdeptno tbl_emp.deptno%TYPE := NULL
)
IS
BEGIN 
   FOR verow IN (
                         SELECT *
                         FROM tbl_emp
                         WHERE deptno = NVL( pdeptno, 10 )
                       )
  LOOP
    DBMS_OUTPUT.PUT_LINE( verow.deptno || ', ' || verow.ename
      || ', ' ||  verow.hiredate); 
  END LOOP;
--EXCEPTION
END;
-- Procedure UP_SELTBLEMP이(가) 컴파일되었습니다.

-- 문제) tbl_dept 테이블의 레코드 삭제하는 up_deltbldept 저장
--      프로시저를 작성, 50, 60, 70,80 삭제
--    ( 삭제할 부서번호를 매개변수로 받아야 된다.)
EXEC up_deltbldept(50);
EXEC up_deltbldept(60);
EXEC up_deltbldept(70);
EXEC up_deltbldept(80);
SELECT * FROM tbl_dept;

CREATE OR REPLACE PROCEDURE up_deltbldept
(
   pdeptno NUMBER
)
IS
BEGIN
  DELETE FROM tbl_dept
  WHERE deptno = pdeptno;
  COMMIT;
--EXCEPTION
END;

-- [ 저장 프로시저 ]
-- 입력용 매개변수    IN 
-- 출력용    "       OUT
-- 입.출력용    "    IN OUT
SELECT num, name, ssn  -- 770221-1******
FROM insa
WHERE num = 1001;  -- IN
--
CREATE OR REPLACE PROCEDURE up_selinsa
(
     pnum  IN insa.num%TYPE
   , pname OUT insa.name%TYPE
   , prrn  OUT VARCHAR2
)
IS
   vname insa.name%TYPE;
   vssn insa.ssn%TYPE;
BEGIN
  SELECT name, ssn  INTO vname, vssn
  FROM insa
  WHERE num = pnum;
  
  pname := vname;
  prrn := SUBSTR(vssn, 1, 8) || '******' ;
  
--EXCEPTION
END;
-- Procedure UP_SELINSA이(가) 컴파일되었습니다.
DECLARE
  vname insa.name%TYPE;
  vrrn  VARCHAR2(14);
BEGIN
  UP_SELINSA(1001, vname, vrrn );
  DBMS_OUTPUT.PUT_LINE( vname || ' , ' || vrrn );
--EXCEPTION
END;

-- 2:00 IN/OUT 입출력용 파라미터(매개변수 )
-- 저장 함수 (Strored  Function )
-- (문제)








 