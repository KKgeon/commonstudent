-- �ּ�ó��             Ctrl + /
-- ��� ����� ���� ��ȸ
-- ���� �밳 ���� ��������� ���Ѵ�. (����)
-- keyword(�����)�� �빮�ڷ� �Է��ϵ��� ���Ѵ�.(����)
-- ���̺��, �÷����� �ҹ��� ���(����)
-- ������ (��, �ٸ���) ����
--SELECT *
--FROM all_users; -- Ctrl + Enter, F5

--select * From ALL_USERS; -- Ctrl + Enter, F5
-- ��ҹ��� ���о��ص� �۵���

-- ���� �߿� ����� ���� ����, ����, ���� --
-- 1) SCOTT ���� ����, ����, ����
--  (1) SCOTT ���� ���� Ȯ��
SELECT *
FROM all_users;
CREATE USER SCOTT IDENTIFIED BY tiger;

ALTER USER HR IDENTIFIED BY lion;
ALTER USER HR ACCOUNT UNLOCK;
GRANT dba TO HR;
--  (2) SCOTT ���� ���� p153
ALTER USER SCOTT IDENTIFIED BY 1234;
-- (3) SCOTT ���� ��й�ȣ 1234 ����
DROP USER SCOTT CASCADE;

-- SYS �ְ������ ������ CREATE SESSION  �����ͺ��̽� ����(����) �ý��� ������ SCOTT ������ �ο�.
GRANT CREATE SESSION TO SCOTT;


GRANT CREATE SESSION TO student_role;
GRANT student_role TO SCOTT;

GRANT CONNECT, RESOURCE TO SCOTT;
--DDL(CREATE, DROP, ALTER)

--CREATE USER, DROP USER, ALTER USER
--CREATE TABLESPACE, DROP TABLESPACER, ALTER TABLESPACE
--CREATE ROLE, DROP ROLE, ALTER ROLE


-- (����) ����Ŭ ��ġ �ÿ� �̸� ���ǵ� ��(role) Ȯ���ϴ� ����(sql)�� �ۼ��ϼ���
SELECT *
FROM dba_roles;

SELECT grantee,privilege 
FROM DBA_SYS_PRIVS 
WHERE grantee = 'CONNECT'; 


--SCOTT ����+���� ���̺� �߰�
C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\scott.sql

SELECT *
FROM dba_tables;

--COUNT() ����Ŭ �Լ� 2551�� �ִٰ� ����

SELECT COUNT(*)
SELECT *
FROM dictionary;



--SYS--

CREATE USER madang IDENTIFIED BY madang DEFAULT TABLESPACE users TEMPORARY
TABLESPACE temp PROFILE DEFAULT;
GRANT CONNECT, RESOURCE TO madang;
GRANT CREATE VIEW, CREATE SYNONYM TO madang;
GRANT UNLIMITED TABLESPACE TO madang;

-- madang ���� ���� Ȯ��
SELECT *
FROM dba_users;
FROM all_users;

--HR ���� Ȯ�� --
1) HR ������ ��й�ȣ�� lion���� �����ϰ�
2) + �� ���� Ŭ��
3) HR ������ �ҿ��ϰ� �ִ� ���̺� ����� ��ȸ...
