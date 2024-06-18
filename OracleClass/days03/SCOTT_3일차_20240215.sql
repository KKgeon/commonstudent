--SCOTT
--[����] insa ���̺��� 70���� ���
SELECT name, ssn
FROM insa
where ssn LIKE '7%';
--[����] insa ���̺��� 12������ �Ʒ��� ���� ���
SELECT name, ssn
FROM insa
WHERE ssn LIKE '__12%';
WHERE ssn LIKE '7_12%';



SELECT name, ssn
    , SUBSTR(ssn,1,4) --7712
    , TO_DATE(SUBSTR(ssn,1,4), 'YYMM')
    , EXTRACT(MONTH FROM TO_DATE(SUBSTR(ssn,1,4), 'YYMM')) MONTH
FROM insa
WHERE EXTRACT(MONTH FROM TO_DATE(SUBSTR(ssn,1,4), 'YYMM')) = '12';

--[����] insa ���̺��� �达 ���� ���� ��� ��� ���
SELECT name,ssn
FROM insa
WHERE name LIKE '��%';

--[����] insa ���̺��� �达 ���� ������ ��� ��� ���
SELECT name,ssn
FROM insa
WHERE name NOT LIKE '��%';
WHERE name LIKE '_��_'; --�̸��� ��� ���ڰ� '��' �̸� ���
WHERE name LIKE '%��_'; --�̸��� ������ �� ��° ���ڰ� '��' �̸� ���
WHERE name LIKE '_��%'; --�̸��� �� ��° ���ڰ� '��' �̸� ���
WHERE name LIKE '%��%'; --�̸� �ӿ� '��' ���ڰ� ������ ���

--��ŵ��� ����, �λ�, �뱸 �̸鼭 ��ȭ��ȣ�� 5 �Ǵ� 7�� ���Ե� �ڷ� ����ϵ� �μ����� ������ �δ� ��µ��� �ʵ�����. (�̸�, ��ŵ�, �μ���, ��ȭ��ȣ)

SELECT name, city, buseo
    , length(buseo)
    , tel 
    ,SUBSTR(buseo,1,length(buseo)-1)
FROM insa
WHERE CITY IN ('����','�λ�','�뱸') AND TEL LIKE '%5%' OR TEL LIKE '%7%';

--
FROM ��Ʈ�����̺�
WHERE �������÷� IN ('LG', '�Ｚ', '�����')
    AND
    CPU�÷� IN ('�ھ�i7-13����','������7(zen4)')
    ;
    --[LIKE �������� ESCAPE �ɼ� ����
    -- dept ���̺� ���� Ȯ��
    DESC dept;
    SELECT deptno, dname, loc
    FROM dept;
    
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON

-- SQL 5���� : DQL, DDL, DML (INSERT UPDATE DELETE) + �Ϸ�COMMIT, ���ROLLBACK
-- DCL, TCL

--DML�� INSERT ��� ����ؼ� ���ο� �μ� �߰�
DESC dept;
INSERT INTO ���̺�� [(Į����, Į����...)] VALUES (��,...);
COMMIT;

INSERT INTO dept (deptno, dname, loc) values ( 50,'CE100%T','SEOUL');
COMMIT;

SELECT*
FROM dept;
INSERT INTO dept values ( 50,'�ѱ�_����','COREA');
INSERT INTO dept values ( 60,'�ѱ�_����','COREA');
--[����] dept ���̺��� �μ��� �˻��� �ϴ� ��
--                    �μ��� _ �� �ִ� �μ������� ��ȸ
--                    �μ��� % �� �ִ� �μ������� ��ȸ

SELECT*
FROM dept
WHERE dname LIKE '%\_%' ESCAPE '\';
WHERE dname LIKE '%\%%' ESCAPE '\';

--DML(INSERT, [UPDATE], DELETE) + �Ϸ�COMMIT, ���ROLLBACK
UPDATE [��Ű��].���̺��
SET Į��=��, Į��=��...
[WHERE ������;] -- ��� ���ڵ� ����

UPDATE scott.dept
SET LOC = 'XXX';

ROLLBACK;

UPDATE scott.dept
SET LOC = 'KOREA'
WHERE deptno = 60;

UPDATE scott.dept
SET LOC = 'COREA', DNAME='�ѱ۳���'
WHERE deptno = 60;

--30�� �μ���, ������ -> 60�� �μ���, ���������� UPDATE ����
--SQL ����: ORA-00936: missing expression
UPDATE scott.dept
SET DNAME=(SELECT dname FROM dept WHERE deptno=30), LOC = (SELECT loc FROM dept WHERE deptno=30)
WHERE deptno = 60;

--SQL ����: ORA-00927: missing equal sign
UPDATE scott.dept
SET (DNAME, loc)=(SELECT dname, loc FROM dept WHERE deptno=30)
WHERE deptno = 60;
COMMIT;

----DML(INSERT, UPDATE, [DELETE]) + �Ϸ�COMMIT, ���ROLLBACK
DELETE FROM [��Ű��.]���̺��
[WHERE ������;] -- ��緹�ڵ� ����

--ORA-02292: integrity constraint (SCOTT.FK_DEPTNO) violated - child record found
DELETE FROM dept
WHERE deptno IN(50,60);

WHERE deptno = 50 OR deptno = 60

SELECT *
FROM dept;

SELECT*
FROM emp;


--[����] emp���̺��� sal�� 10%�� �λ��ؼ� ���ο� sal�� ����
SELECT*
FROM emp;

UPDATE emp
SET sal = sal*1.1;
SET sal = sal+(sal/10);
ROLLBACK;

--LIKE SQL ������ : % _ ���� ��ȣ
--REGEXP_LIKE �Լ� : ����ǥ����
-- [����] insa ���̺��� ���� �达, �̾�, �� ��� ��ȸ
SELECT *
FROM insa
WHERE REGEXP_LIKE (name, '[����]$');
WHERE REGEXP_LIKE (name, '^(��|��)');
WHERE REGEXP_LIKE (name, '^[����]');
WHERE REGEXP_LIKE (name, '^[^����]');

WHERE name LIKE '��%' OR name LIKE '��%';
WHERE SUBSTR(name,1,1) IN ('��', '��');
WHERE SUBSTR(name,1,1) = '��' OR SUBSTR(name,1,1) = '��';

--[����] insa ���̺��� 70��� ���� ����� ��ȸ
SELECT *
FROM insa
WHERE REGEXP_LIKE (SSN,'^[7]...1');

SELECT deptno, ename, sal, comm, sal+NVL(comm,0)pay
FROM emp
WHERE deptno = 30 AND comm IS NULL
ORDER BY pay DESC;


--[NOT] LIKE SQL ������

--�������� ��ġ �˻� ���� üũ�ϴ� ������
--���ϵ�ī��
--      0~�������� ����
--      �Ѱ��� ����
-- ���ϵ�ī�� ( % _ ) �� �Ϲ� ����ó�� ����Ϸ��� ESCAPE �ɼ��� ���











--[����] insa ���̺��� �����,�ֹε�Ϲ�ȣ ���
DESC insa;
SELECT name, ssn --771212-1022432
    ,SUBSTR(ssn,1,2) YEAR
    ,SUBSTR(ssn,3,2) MONTH
    ,SUBSTR(ssn,5,2) DAY
    ,SUBSTR(ssn,8,1) GENDER
FROM insa;

SELECT name, ssn
    ,SUBSTR(ssn, 1,8) || '******' AS rrn
    ,EXTRACT(YEAR FROM )
FROM insa
WHERE SUBSTR(ssn,1,1) = '7';





SELECT 'abcdefg'
    ,SUBSTR('abcdefg', 1,2)--ab 1 ù����
    ,SUBSTR('abcdefg', 0, 2)--ab 0 ù����
    ,SUBSTR('abcdefg', 3)
    
    ,SUBSTR('abcdefg', -5,3)--�������̸� �ڿ��������� ��ġ
    ,SUBSTR('abcdefg', -1,1)
FROM dual;










--[����] emp ���̺��� �Ի�����(hiredate)�� 81�⵵�� ��� ���� ��ȸ
--2��Ǯ�� DATE->�Ի�⵵�� ������

--���� ��¥�� �� �� �� ���   : DATE(��), TIMESTAMP(���뼼����,�ð���)
--�ڹ� : Date d = new Date(); Calendar c = Calendar.getInstance();
--             d.getYear()              c.getYear()
SELECT SYSDATE , CURRENT_TIMESTAMP 
    , EXTRACT( YEAR  FROM  SYSDATE ) -- 2024
    , TO_CHAR( SYSDATE, 'YYYY' )    -- '2024'
    , TO_CHAR( SYSDATE, 'YY' )    -- '2024'
    , TO_CHAR( SYSDATE, 'YEAR' )    -- 'TWENTY TWENTY-FOUR'
FROM dual;


SELECT ename, hiredate
FROM emp
WHERE EXTRACT( YEAR  FROM  hiredate ) = 1981;
WHERE TO_CHAR( hiredate, 'YYYY' ) = '1981'; 



SELECT ename, hiredate
FROM emp
WHERE TO_CHAR(hiredate,'YY')='81';

--1��Ǯ�� (�񱳿����ھ���)
SELECT ename, hiredate
FROM emp
WHERE hiredate BETWEEN '81/01/01' AND '81/12/31';

