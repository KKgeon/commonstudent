-- SCOTT 
--------------------------------------------------------------------------------
--1. [ %TYPE형 변수 ]
--2. [ %LOWTYPE형 변수 ]
--3. [ RECORD형 변수 ]



SELECT d.deptno, dname, empno, ename, sal + NVL(comm,0) pay
FROM dept d JOIN emp e ON d.deptno = e.deptno
WHERE empno = 7369;
-- 1.




DECLARE
    vdeptno dept.deptno%TYPE;
    vdname dept.dname%TYPE;
    vempno emp.empno%TYPE;
    vename emp.ename%TYPE;
    vpay NUMBER;
BEGIN
    SELECT d.deptno, dname, empno, ename, sal + NVL(comm, 0) pay
    INTO vdeptno, vdname, vempno, vename, vpay
    FROM dept d JOIN emp e ON d.deptno = e.deptno
    WHERE empno = 7369;
    DBMS_OUTPUT.PUT_LINE(vdeptno || ', ' || vdname  || ', ' || vempno || ', ' || vename || ', ' || vpay);
-- EXCEPTION
END;



-- 2.
DECLARE
vdrow dept%ROWTYPE;
verow emp%ROWTYPE;
vpay NUMBER;
BEGIN
SELECT d.deptno, dname, empno, ename, sal + NVL(comm,0) pay
INTO vdrow.deptno, vdrow.dname, verow.empno, verow.ename, vpay
FROM dept d JOIN emp e ON d.deptno = e.deptno
WHERE empno = 7369;
DBMS_OUTPUT.PUT_LINE(vdrow.deptno|| ', ' || vdrow.dname ||', ' || verow.empno || ', ' || verow.ename || ', ' || vpay );
--EXCEPTION
END;

--3) 익며으로시저 작성+테스트 (RECORD형 변수)
DECLARE
--부서번호 부서명 사원번호 사원명 급여 새로운 하나의 자료형
-- 사용자 정의 구조체
TYPE EmpDeptType IS RECORD
(
vdeptno dept.deptno%TYPE,
vdname dept.dname%TYPE,
vempno emp.empno%TYPE,
vename emp.ename%TYPE,
vpay NUMBER

);
vderow EmpDeptType;
BEGIN
SELECT d.deptno, dname, empno, ename, sal + NVL(comm,0) pay
INTO vderow.vdeptno, vderow.vdname, vderow.vempno, vderow.vename, vderow.vpay
FROM dept d JOIN emp e ON d.deptno = e.deptno
WHERE empno = 7369;
DBMS_OUTPUT.PUT_LINE(vderow.vdeptno|| ', ' || vderow.vdname ||', ' || vderow.vempno || ', ' || vderow.vename || ', ' || vderow.vpay );
--EXCEPTION
END;




-- [5) zjtj(CURSOR)
1) 커서 ? PL/SQL의 실행블럿 안에서 실행되는 SELECT문 의미
2) 커서의 2가지 종류
ㄱ. 묵시적 커서 SELECT문의 실행 결과가 1개, FOR문 SELECT문
        (자동)
ㄴ. 명시적 커서 SELECT문의 실행 결과가 여러개
    (1) CURSOR 선언 - 실행한 SELECT문 작성
    (2) OPEN       - 작성된 SELECT 문이 실행되는 과정
    (3) FETCH      - 커서로부터 여러 개의 레코드 읽어와서 처리과정
        LOOP문(반복문) 사용 
        (커서 속성을 사용)
        %LOWCOUNT 속성
        %FOUND 속성
        %NOTFOUND 속성
        %ISOPEN 속성
    (4) CLOSE 

--예)

SELECT d.deptno, dname, empno, ename, sal + NVL(comm,0) pay
FROM dept d JOIN emp e ON d.deptno = e.deptno;
--커서 + 익명프로시저 작성, 테스트
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


-- ㄱ. [암시적 커서
DECLARE

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


--저장 프로시저를 실행하는 3가지 방법
--1) EXECUTE 문
--2) 익명프로시저에서 호출해서
--3) 또 다른 저장프로시저에서 호출해서 실행


--서브쿼리를 사용해서 테이블 생성

CREATE TABLE tbl_emp
AS
(SELECT * FROM emp);

SELECT * 
FROM tbl_emp;

--저장(stored) 프로시저 : up_
DELETE FROM tbl_emp
WHERE empno = 9999;



CREATE OR REPLACE PROCEDURE up_deltblemp
(
-- pempno NUMBER 0
-- pempno IN tbl_emp.empno%TYPE
pempno tbl_emp.empno%TYPE
)
IS
BEGIN
DELETE FROM tbl_emp
WHERE empno = pempno;
COMMIT;
--EXCEPTION
--ROLLBACK;
END;


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


CREATE TABLE tbl_dept
AS
(
SELECT *
FROM dept
);


--문제) up_sletbldept, up_instbldept

CREATE OR REPLACE PROCEDURE up_updtbldept
(
pdeptno tbl_dept.deptno%TYPE
,pdname tbl_dept.dname%TYPE :=NULL
,ploc tbl_dept.loc%TYPE := NULL
)
IS
vname tbl_dept.dname%TYPE;
vloc tbl_dept.loc%TYPE;
BEGIN
SELECT dname, loc INTO vdname, vloc
FROM tbl_dept
WHERE deptno= pdeptno;
    IF pdname IS NULL AND ploc IS NULL THEN
    ELSIF THEN
    ELSE
    END IF
EXCEPTION
END;



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


--ㄷ.
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
       UPDATE tbl_dept
       SET dname = NVL(pdname, dname)
       ,loc = CASE
                WHEN ploc IS NULL THEN loc
                ELSE ploc
              END
       WHERE deptno = pdeptno;

    COMMIT;
-- EXCEPTION
END;


SELECT * FROM tbl_emp; --부서번호를 매개변수
-- 해당되는 부서원들만 조회하는 저장 프로시저 작성.

EXEC up_seltblemp;
EXEC up_seltblemp(30);
CREATE OR REPLACE PROCEDURE up_seltblemp
(
pdeptno tbl_emp.deptno%TYPE :=NUll
)
IS
BEGIN
FOR verow IN(
            SELECT *
            FROM tbl_emp
            WHERE deptno = NVL(pdeptno, 10)
                    )
LOOP
DBMS_OUTPUT.PUT_LINE(verow.deptno || ', ' || verow.ename || ', ' || verow.hiredate);
END LOOP;
--EXCEPTION
END;



EXEC up_deltbldept(50);
EXEC up_deltbldept(60);
EXEC up_deltbldept(70);
EXEC up_deltbldept(80);

SELECT * FROM tbl_dept;

CREATE OR REPLACE PROCEDURE up_deltbldept
(
    pdeptno IN tbl_dept.deptno%TYPE
)
IS
BEGIN
       DELETE FROM tbl_dept
       WHERE deptno = pdeptno;
       COMMIT;
-- EXCEPTION
END;

-- 저장 프로시저
-- 입력용 매개변수  IN
-- 출력용     "    OUT
-- 입,출력용  "    IN OUT


CREATE OR REPLACE PROCEDURE up_selinsa
(
     pnum IN insa.num%TYPE
    ,pname OUT insa.name%TYPE
    ,prrn OUT insa.ssn%TYPE
)
IS
vname insa.name%TYPE;
vssn insa.ssn%TYPE;
BEGIN
    SELECT name, ssn 
    INTO  vname, vssn
    FROM insa
    WHERE num = pnum;
    
    
    pname := vname;
    prrn  := SUBSTR(vssn, 1, 8) || '******' ;
--EXCEPTION
END;


DECLARE
vname insa.name%TYPE;
vrrn VARCHAR2(14);
BEGIN
UP_SELINSA(1001, vname, vrrn);
DBMS_OUTPUT.PUT_LINE(vname|| ', ' || vrrn);
--EXCEPTION
END;


--IN OUT 입출력용 파라미터(매개변수)
--예 주민번호 14자리를 입력용 매개변수로..
--  앞자리 6자리를 출력용 매개변수로 사용
CREATE OR REPLACE PROCEDURE up_rrn
(
    prrn IN OUT VARCHAR2 -- VARCHAR2(크기) X
)
IS
BEGIN
    prrn := SUBSTR(prrn, 1, 6);
--EXCEPTION
END;

--Procedure UP_RRN이(가) 컴파일되었습니다.
DECLARE
    vrrn VARCHAR(14) := '761230-1700001';
BEGIN
    UP_RRN(vrrn);
    DBMS_OUTPUT.PUT_LINE(vrrn);
END;



--저장 함수 (Stored function)
--



--- 예제1) 저장함수
SELECT num, name, ssn
    ,DECODE( MOD(SUBSTR(ssn, -7,1) ,2),1,'남자','여자') gender
FROM insa;

-- up 저장프로시저명
-- uf 저장함수명
CREATE OR REPLACE FUNCTION uf_gender
(
    prrn IN VARCHAR2
)
RETURN VARCHAR2
IS
    vgender VARCHAR2(6);
BEGIN
IF MOD(SUBSTR(prrn, -7,1) ,2) = 1 THEN
    vgender := '남자';
ELSE
    vgender := '여자';
END IF;

RETURN (vgender);
--EXCEPTION
END;


DECLARE
    v_result VARCHAR2(6);
BEGIN
    -- 예제 주민등록번호를 uf_gender 함수의 인자로 전달하여 성별을 얻습니다.
    v_result := uf_gender('주민등록번호');
    
    -- 결과를 출력하거나 다른 용도로 사용할 수 있습니다.
    DBMS_OUTPUT.PUT_LINE('성별: ' || v_result);
END;



CREATE OR REPLACE FUNCTION uf_age
(
prrn VARCHAR2
, ptype IN NUMBER--1(세는 나이) 0(만나이)
)
RETURN NUMBER
IS
ㄱ NUMBER(4); --올해년도
ㄴ NUMBER(4); --생일년도
ㄷ NUMBER(1); --생일지남여부
 vcounting_age NUMBER(3);
 vamerican_age NUMBER(3);
BEGIN
ㄱ := TO_CHAR(SYSDATE, 'YYYY' );
ㄴ := CASE
    WHEN SUBSTR(prrn,8,1) IN (1,2,5,6) THEN 1900
    WHEN SUBSTR(prrn,8,1) IN (3,4,7,8) THEN 2000
    ELSE 1800
    END + SUBSTR(prrn, 1, 2);
ㄷ := SIGN(TO_DATE(SUBSTR(prrn,3,4), 'MMDD') - TRUNC(SYSDATE));

vcounting_age := ㄱ-ㄴ+1;
--vamerican_age := vamerican_age -1 + DECODE( ㄷ, 1, -1, 0);
vamerican_age := vcounting_age -1 + CASE ㄷ 
                                    WHEN 1 THEN -1
                                    ELSE 0
                                    END;
IF ptype = 1 THEN
    RETURN vcounting_age;
    ELSE
    RETURN vamerican_age;
    END IF;
--EXCEPTION
END;


DECLARE
    v_age NUMBER;
BEGIN
    -- 주민등록번호와 계산 타입(0: 만나이)을 uf_age 함수에 전달하여 나이를 계산합니다.
    v_age := uf_age('9308211234567', 0);
    
    -- 계산된 나이를 출력합니다.
    DBMS_OUTPUT.PUT_LINE('나이(만나이): ' || v_age);
END;
SELECT name, uf_age(ssn,0), uf_age(ssn,1)
FROM insa;




CREATE OR REPLACE FUNCTION uf_pow(
    
    
)
RETURN NUMBER
IS
    v_result NUMBER;
BEGIN
    -- 절대값을 계산하는 로직을 작성하세요.
    -- 예: v_absolute_value := ABS(p_number);

    -- 절대값을 반환합니다.
    -- 예: RETURN v_absolute_value;
END;