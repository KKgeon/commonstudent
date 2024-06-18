-- SCOTT  
--(ȭ) :  PL/SQL
--------------------------------------------------------------------------------
-- 1. [%TYPE�� ����]
-- 2. [%ROWTYPE�� ����]
-- 3. [RECORD�� ����] --
SELECT d.deptno, dname, empno, ename, sal + NVL(comm,0) pay
FROM dept d JOIN emp e ON d.deptno = e.deptno
WHERE empno = 7369;
-- 1) �͸����ν��� �ۼ�+�׽�Ʈ ( %TYPE �� ���� )
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

-- 2) �͸����ν��� �ۼ�+�׽�Ʈ ( %ROWTYPE �� ���� )
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

-- 3) �͸����ν��� �ۼ�+�׽�Ʈ ( RECORD �� ���� )
DECLARE
  -- "�μ���ȣ,�μ���,�����ȣ,�����,�޿�" ���ο� �ϳ��� �ڷ��� ����
  --  ( ����� ���� ����ü Ÿ�� ���� )
  TYPE EmpDeptType  IS RECORD
  (
      deptno dept.deptno%TYPE,
      dname dept.dname%TYPE,
      empno emp.empno%TYPE,
      ename emp.ename%TYPE,
      pay NUMBER
  );
  -- ���� ����
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

-- 4) �͸����ν��� �ۼ�+�׽�Ʈ ( RECORD �� ���� )
--01422. 00000 -  "exact fetch returns more than requested number of rows"
--*Cause:    The number specified in exact fetch is less than the rows returned.
--*Action:   Rewrite the query or change number of rows requested
--  Ŀ��(cursor)
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


-- [ 5) Ŀ��(CURSOR) ]
1) Ŀ�� ? PL/SQL�� ����� �ȿ��� ����Ǵ� SELECT�� �ǹ�
2) Ŀ���� 2���� ���� 
  ��. ������ Ŀ�� : SELECT���� ���� ����� 1�� , FOR �� SELECT��
     ( �ڵ� )
  ��. ����� Ŀ�� : SELECT���� ���� ����� ���� ��
    (1) CURSOR ���� - ������ SELECT�� �ۼ� 
    (2) OPEN       -  �ۼ��� SELECT���� ����Ǵ� ����
    (3) FETCH      -  Ŀ���� ���� ���� ���� ���ڵ� �о�ͼ� ó������
         - LOOP��(�ݺ���) ���
            [ Ŀ�� �Ӽ��� ���]
            %ROWCOUNT  �Ӽ�
            %FOUND �Ӽ�
            %NOTFOUND �Ӽ�
            %ISOPEN �Ӽ�
    (4) CLOSE   
  
 -- ��) 
SELECT d.deptno, dname, empno, ename, sal + NVL(comm,0) pay
FROM dept d JOIN emp e ON d.deptno = e.deptno;  
-- [����� Ŀ�� + �͸����ν��� �ۼ�.�׽�Ʈ]
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
   -- 1) Ŀ�� ����
   CURSOR edcursor IS (
     SELECT d.deptno, dname, empno, ename, sal + NVL(comm,0) pay
     FROM dept d JOIN emp e ON d.deptno = e.deptno
   );
BEGIN
   -- 2) Ŀ�� OPEN
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
   -- 4) Ŀ�� CLOSE
   CLOSE edcursor;
--EXCEPTION
END;

-- 10:01 ��������~~
-- ��. [�Ͻ��� Ŀ�� + �͸����ν��� �ۼ�]  FOR�� ���
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
   -- 1) Ŀ�� ����
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

-- ��. [�Ͻ��� Ŀ�� + �͸����ν��� �ۼ�]  FOR�� ���
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

-- [���� ���ν���(STORED PROCEDURE)]
CREATE OR REPLACE PROCEDURE  ���ν�����
(
    �Ű�����( argument, paramter ),
    �Ű�����( argument, paramter ),
    p
)
IS
    v ;
    v ;
BEGIN
EXCEPTION
END;

-- ���� ���ν����� �����ϴ� 3���� ���
--1) EXECUTE ������ ����. 
--2) �͸����ν������� ȣ���ؼ� ����
--3) �� �ٸ� �������ν������� ȣ���ؼ� ����
 
-- ���������� ����ؼ� ���̺� ����
CREATE TABLE tbl_emp
AS
(SELECT * FROM emp);
-- 
SELECT *
FROM tbl_emp; 
-- ����(stored) ���ν��� :    up_  
DELETE FROM tbl_emp
WHERE empno = 9999;

-- 
CREATE OR REPLACE PROCEDURE up_deltblemp
(
   -- pempno NUMBER(4) X (���)
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

-- Procedure UP_DELTBLEMP��(��) �����ϵǾ����ϴ�.
-- [ UP_DELTBLEMP ����]
--1) EXECUTE ������ ����. 
-- PLS-00306: wrong number or types of arguments in call to 'UP_DELTBLEMP'
EXECUTE UP_DELTBLEMP;  X
EXECUTE UP_DELTBLEMP(7369);   
EXECUTE UP_DELTBLEMP(pempno=>7499); 
SELECT *
FROM tbl_emp;

--2) �͸����ν������� ȣ���ؼ� ����
--DECLARE
BEGIN
   UP_DELTBLEMP(7566);
END;

--3) �� �ٸ� �������ν������� ȣ���ؼ� ����
CREATE OR REPLACE PROCEDURE up_DELTBLEMP_test
AS
BEGIN
  UP_DELTBLEMP(7521);
END up_DELTBLEMP_test;
-- Procedure UP_DELTBLEMP_TEST��(��) �����ϵǾ����ϴ�.
EXEC UP_DELTBLEMP_TEST;

-- ����1) dept -> tbl_dept ���̺� ����
 CREATE TABLE tbl_dept
 AS
  ( SELECT * FROM dept );
-- ����2)  tbl_dept ���̺�  deptno �÷��� PK �������� ����.
ALTER TABLE tbl_dept
ADD CONSTRAINT  PK_TBLDEPT_DEPTNO PRIMARY KEY(deptno) ;
-- ����3) ����� Ŀ�� + tbl_dept ���̺��� SELECT ���� ���ν��� ����
--    ����
--   up_seltbldept  
--   �Ű����� X, ������ ����� Ŀ�� ����
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
-- ����4) ���ο� �μ��� �߰��ϴ� ���� ���ν���  UP_INSTBLDEPT
--      deptno      ������ 
--      dname, loc
SELECT * 
FROM user_sequences;
--      4-1)  seq_deptno ������ ����  50/10/NOCYCLE/NOĳ�� /90
   CREATE SEQUENCE seq_deptno
   INCREMENT BY 10
   START WITH 50
   MAXVALUE 90 
   NOCYCLE
   NOCACHE;
-- Sequence SEQ_DEPTNO��(��) �����Ǿ����ϴ�.
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
-- Procedure UP_INSTBLDEPT��(��) �����ϵǾ����ϴ�.

EXEC UP_SELTBLDEPT;
EXEC UP_INSTBLDEPT('QC', 'SEOUL');
EXEC UP_INSTBLDEPT(ploc=>'SEOUL' , pdname=>'QC');

EXEC UP_INSTBLDEPT(pdname=>'QC2');
EXEC UP_INSTBLDEPT(ploc=>'SEOUL');
EXEC UP_INSTBLDEPT;
--
SELECT * 
FROM tbl_dept;
 
-- ����) up_seltbldept,  up_instbldept
--      [ up_updtbldept ]
EXEC up_updtbldept( 50, 'X', 'Y' );  -- dname, loc
EXEC up_updtbldept( pdeptno=>50,  pdname=>'QC3' );  -- loc
EXEC up_updtbldept( pdeptno=>50,  ploc=>'SEOUL' );  -- 
--12:01 ��������~
-- ��.
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
    -- ���� ���� ���� dname, loc
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
 
-- ��.
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

-- ��.
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
--Procedure UP_UPDTBLDEPT��(��) �����ϵǾ����ϴ�.

-- Ǯ�� ��) UP_SELTBLDEPT ��� �μ� ��ȸ..+ ����� Ŀ��
SELECT * FROM tbl_emp;  �μ���ȣ�� �Ű�����
--   �ش�Ǵ� �μ����鸸 ��ȸ�ϴ� ���� ���ν��� �ۼ�.  
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
-- Procedure UP_SELTBLEMP��(��) �����ϵǾ����ϴ�.
EXEC UP_SELTBLEMP;
EXEC UP_SELTBLEMP(30);

-- Ǯ�� ��) UP_SELTBLDEPT ��� �μ� ��ȸ..+ ����� Ŀ�� 
--   �ش�Ǵ� �μ����鸸 ��ȸ�ϴ� ���� ���ν��� �ۼ�.  
--   [Ŀ�� �Ķ���͸� �̿��ϴ� ���]
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

-- Ǯ�� ��) UP_SELTBLDEPT ��� �μ� ��ȸ..+ ����� Ŀ�� 
--   �ش�Ǵ� �μ����鸸 ��ȸ�ϴ� ���� ���ν��� �ۼ�.  
--   [FOR �� �̿��ϴ� ����]
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
-- Procedure UP_SELTBLEMP��(��) �����ϵǾ����ϴ�.

-- ����) tbl_dept ���̺��� ���ڵ� �����ϴ� up_deltbldept ����
--      ���ν����� �ۼ�, 50, 60, 70,80 ����
--    ( ������ �μ���ȣ�� �Ű������� �޾ƾ� �ȴ�.)
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

-- [ ���� ���ν��� ]
-- �Է¿� �Ű�����    IN 
-- ��¿�    "       OUT
-- ��.��¿�    "    IN OUT
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
-- Procedure UP_SELINSA��(��) �����ϵǾ����ϴ�.
DECLARE
  vname insa.name%TYPE;
  vrrn  VARCHAR2(14);
BEGIN
  UP_SELINSA(1001, vname, vrrn );
  DBMS_OUTPUT.PUT_LINE( vname || ' , ' || vrrn );
--EXCEPTION
END;

-- 2:00 IN/OUT ����¿� �Ķ����(�Ű����� )
-- ���� �Լ� (Strored  Function )
-- (����)








 