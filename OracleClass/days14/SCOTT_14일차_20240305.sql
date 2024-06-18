-- SCOTT 
--------------------------------------------------------------------------------
--1. [ %TYPE�� ���� ]
--2. [ %LOWTYPE�� ���� ]
--3. [ RECORD�� ���� ]



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

--3) �͸����ν��� �ۼ�+�׽�Ʈ (RECORD�� ����)
DECLARE
--�μ���ȣ �μ��� �����ȣ ����� �޿� ���ο� �ϳ��� �ڷ���
-- ����� ���� ����ü
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
1) Ŀ�� ? PL/SQL�� ����� �ȿ��� ����Ǵ� SELECT�� �ǹ�
2) Ŀ���� 2���� ����
��. ������ Ŀ�� SELECT���� ���� ����� 1��, FOR�� SELECT��
        (�ڵ�)
��. ����� Ŀ�� SELECT���� ���� ����� ������
    (1) CURSOR ���� - ������ SELECT�� �ۼ�
    (2) OPEN       - �ۼ��� SELECT ���� ����Ǵ� ����
    (3) FETCH      - Ŀ���κ��� ���� ���� ���ڵ� �о�ͼ� ó������
        LOOP��(�ݺ���) ��� 
        (Ŀ�� �Ӽ��� ���)
        %LOWCOUNT �Ӽ�
        %FOUND �Ӽ�
        %NOTFOUND �Ӽ�
        %ISOPEN �Ӽ�
    (4) CLOSE 

--��)

SELECT d.deptno, dname, empno, ename, sal + NVL(comm,0) pay
FROM dept d JOIN emp e ON d.deptno = e.deptno;
--Ŀ�� + �͸����ν��� �ۼ�, �׽�Ʈ
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


-- ��. [�Ͻ��� Ŀ��
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


--���� ���ν����� �����ϴ� 3���� ���
--1) EXECUTE ��
--2) �͸����ν������� ȣ���ؼ�
--3) �� �ٸ� �������ν������� ȣ���ؼ� ����


--���������� ����ؼ� ���̺� ����

CREATE TABLE tbl_emp
AS
(SELECT * FROM emp);

SELECT * 
FROM tbl_emp;

--����(stored) ���ν��� : up_
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


--����) up_sletbldept, up_instbldept

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


--��.
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


SELECT * FROM tbl_emp; --�μ���ȣ�� �Ű�����
-- �ش�Ǵ� �μ����鸸 ��ȸ�ϴ� ���� ���ν��� �ۼ�.

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

-- ���� ���ν���
-- �Է¿� �Ű�����  IN
-- ��¿�     "    OUT
-- ��,��¿�  "    IN OUT


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


--IN OUT ����¿� �Ķ����(�Ű�����)
--�� �ֹι�ȣ 14�ڸ��� �Է¿� �Ű�������..
--  ���ڸ� 6�ڸ��� ��¿� �Ű������� ���
CREATE OR REPLACE PROCEDURE up_rrn
(
    prrn IN OUT VARCHAR2 -- VARCHAR2(ũ��) X
)
IS
BEGIN
    prrn := SUBSTR(prrn, 1, 6);
--EXCEPTION
END;

--Procedure UP_RRN��(��) �����ϵǾ����ϴ�.
DECLARE
    vrrn VARCHAR(14) := '761230-1700001';
BEGIN
    UP_RRN(vrrn);
    DBMS_OUTPUT.PUT_LINE(vrrn);
END;



--���� �Լ� (Stored function)
--



--- ����1) �����Լ�
SELECT num, name, ssn
    ,DECODE( MOD(SUBSTR(ssn, -7,1) ,2),1,'����','����') gender
FROM insa;

-- up �������ν�����
-- uf �����Լ���
CREATE OR REPLACE FUNCTION uf_gender
(
    prrn IN VARCHAR2
)
RETURN VARCHAR2
IS
    vgender VARCHAR2(6);
BEGIN
IF MOD(SUBSTR(prrn, -7,1) ,2) = 1 THEN
    vgender := '����';
ELSE
    vgender := '����';
END IF;

RETURN (vgender);
--EXCEPTION
END;


DECLARE
    v_result VARCHAR2(6);
BEGIN
    -- ���� �ֹε�Ϲ�ȣ�� uf_gender �Լ��� ���ڷ� �����Ͽ� ������ ����ϴ�.
    v_result := uf_gender('�ֹε�Ϲ�ȣ');
    
    -- ����� ����ϰų� �ٸ� �뵵�� ����� �� �ֽ��ϴ�.
    DBMS_OUTPUT.PUT_LINE('����: ' || v_result);
END;



CREATE OR REPLACE FUNCTION uf_age
(
prrn VARCHAR2
, ptype IN NUMBER--1(���� ����) 0(������)
)
RETURN NUMBER
IS
�� NUMBER(4); --���س⵵
�� NUMBER(4); --���ϳ⵵
�� NUMBER(1); --������������
 vcounting_age NUMBER(3);
 vamerican_age NUMBER(3);
BEGIN
�� := TO_CHAR(SYSDATE, 'YYYY' );
�� := CASE
    WHEN SUBSTR(prrn,8,1) IN (1,2,5,6) THEN 1900
    WHEN SUBSTR(prrn,8,1) IN (3,4,7,8) THEN 2000
    ELSE 1800
    END + SUBSTR(prrn, 1, 2);
�� := SIGN(TO_DATE(SUBSTR(prrn,3,4), 'MMDD') - TRUNC(SYSDATE));

vcounting_age := ��-��+1;
--vamerican_age := vamerican_age -1 + DECODE( ��, 1, -1, 0);
vamerican_age := vcounting_age -1 + CASE �� 
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
    -- �ֹε�Ϲ�ȣ�� ��� Ÿ��(0: ������)�� uf_age �Լ��� �����Ͽ� ���̸� ����մϴ�.
    v_age := uf_age('9308211234567', 0);
    
    -- ���� ���̸� ����մϴ�.
    DBMS_OUTPUT.PUT_LINE('����(������): ' || v_age);
END;
SELECT name, uf_age(ssn,0), uf_age(ssn,1)
FROM insa;




CREATE OR REPLACE FUNCTION uf_pow(
    
    
)
RETURN NUMBER
IS
    v_result NUMBER;
BEGIN
    -- ���밪�� ����ϴ� ������ �ۼ��ϼ���.
    -- ��: v_absolute_value := ABS(p_number);

    -- ���밪�� ��ȯ�մϴ�.
    -- ��: RETURN v_absolute_value;
END;