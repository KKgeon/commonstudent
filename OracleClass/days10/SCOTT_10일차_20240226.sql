-- SCOTT

create table tbl_emp(
id number primary key, 
name varchar2(10) not null,
salary  number,
bonus number default 100);


insert into tbl_emp(id,name,salary) values(1001,'jijoe',150);
insert into tbl_emp(id,name,salary) values(1002,'cho',130);
insert into tbl_emp(id,name,salary) values(1003,'kim',140);
COMMIT;

select * 
from tbl_emp;

create table tbl_bonus
(id number
, bonus number default 100
);

--Table TBL_BONUS��(��) �����Ǿ����ϴ�.

insert into tbl_bonus(id)(select e.id from tbl_emp e);
--3�� �� ��(��) ���ԵǾ����ϴ�.
select * 
from tbl_bonus;
--
--1001	jijoe	150	100
--1002	cho	    130	100
--1003	kim	    140	100
INSERT INTO tbl_bonus VALUES (1004, 50);
COMMIT;



MERGE INTO tbl_bonus b
USING (SELECT id, salary FROM tbl_emp) e
ON (b.id = e.id) 
WHEN MATCHED THEN
    UPDATE SET b.bonus = b.bonus + e.salary * 0.01
WHEN NOT MATCHED THEN
    INSERT (b.id, b.bonus) VALUES (e.id, e.salary*0.01);
    
    --���� 2)
    
    
    
create table tbl_merge1(
id number primary key, 
name varchar2(10),
pay number,
sudang number);

create table tbl_merge2
(
id number primary key
, sudang number
);


INSERT INTO tbl_merge1 VALUES (1, 'a', 100, 10);
INSERT INTO tbl_merge1 VALUES (2, 'b', 150, 20);
INSERT INTO tbl_merge1 VALUES (3, 'c', 130, 0);

INSERT INTO tbl_merge2 VALUES (2, 5);
INSERT INTO tbl_merge2 VALUES (3, 10);
INSERT INTO tbl_merge2 VALUES (4, 20);


COMMIT;


SELECT *
FROM tbl_merge2;
FROM tbl_merge1;

--����: tbl_merge1(�ҽ�) -> tbl_merge2(Ÿ��) ����
--      1                            INSERT
--      2,3                          UPDATE


MERGE INTO tbl_merge2 t2
USING (SELECT id, sudang FROM tbl_merge1) t1
ON (t2.id = t1.id) 
WHEN MATCHED THEN
    UPDATE SET  t2.sudang = t2.sudang + t1.sudang 
WHEN NOT MATCHED THEN
    INSERT (t2.id, t2.sudang ) VALUES (t1.id, t1.sudang);
    
    SELECT *
    FROM tbl_merge2;


DROP TABLE tbl_merge1 purge;
DROP TABLE tbl_merge2 purge;

DROP TABLE tbl_emp purge;
DROP TABLE tbl_bonus purge;

--��������
SELECT *
FROM tbl_merge2;

--scott�� �����ϰ� �ִ� ���̺� ��ȸ
SELECT *
FROM user_tables;
--scott�� �����ϰ� �ִ� �������� ��ȸ
SELECT *
FROM user_constraints;
--scott�� �����ϰ� �ִ� emp ���̺� ������ �������Ǹ� ��ȸ
SELECT *
FROM user_constraints
WHERE table_name = UPPER('emp');

--���������� ���̺� INSERT/UPDATE/DELETE �ҋ��� ��Ģ���� ���
--              ������ ���Ἲ�� ����


UPDATE emp
SET empno = 90
WHERE empno = 7369;
--������ ���Ἲ

DESC emp;

INSERT INTO emp (empno) VALUES (9999);
INSERT INTO emp (empno) VALUES ('admin');
SELECT * FROM emp;
ROLLBACK;
--
---- ���������� �����ϴ� �ñ⿡ ����
--��. CREATE TABLE �� ���̺� ���� + �������� �߰�/����
--
--    1) IN-LINE �������� (==�÷� ����) �������� ���� ���
--        �� NOT NULL �������� ����
--    2) OUT-OF-LINE �������� (==���̺� ����) �������� ���� ���
--        �� �� �� �̻��� �÷��� �ϳ��� ���������� ������ ��..
--        
--        (��� �޿� ���� ���̺�)
--        �޿����޳�¥ ȸ��ID �޿��� ..
--        20240125    9369
--��. ALTER TABLE �� ���̺� ���� + �������� �߰�/����

DESC dept;


SELECT *
FROM emp;
WHERE ename = 'KING';

UPDATE emp
SET deptno = NULL
WHERE empno='7839';

COMMIT;

--�ǽ�) CREATE TABLE������ Į������ ������� �������� �����ϴ� ��
DROP TABLE tblconstraint1;
CREATE TABLE tblconstraint1
(   
    empno number(4) NOT NULL CONSTRAINT PK_tblconstraint1_empno PRIMARY KEY
    , ename VARCHAR2(20) NOT NULL
    , deptno NUMBER(2) CONSTRAINT FK_tblconstraint1_deptno REFERENCE dept(deptno)
    , email VARCHAR2(150) CONSTRAINT UK_tblconstraint1_email UNIQUE
    , kor NUMBER(3) CONSTRAINT CK_tblconstraint1_kor CHECK(kor BETWEEN 0 AND 100)
    , city VARCHAR2(20) CONSTRAINT CK_tblconstraint1_city CHECK(city IN ('����','�뱸','����'))
);

CREATE TABLE tblconstraint1
(   
    empno number(4) NOT NULL CONSTRAINT PK_tblconstraint1_empno PRIMARY KEY,
    ename VARCHAR2(20) NOT NULL,
    deptno NUMBER(2),
    CONSTRAINT FK_tblconstraint1_deptno FOREIGN KEY (deptno) REFERENCES dept(deptno),
    email VARCHAR2(150) CONSTRAINT UK_tblconstraint1_email UNIQUE,
    kor NUMBER(3) CONSTRAINT CK_tblconstraint1_kor CHECK(kor BETWEEN 0 AND 100),
    city VARCHAR2(20) CONSTRAINT CK_tblconstraint1_city CHECK(city IN ('����', '�뱸', '����'))
);

--TABLE TBL_CONSTRAINT��(��) �����Ǿ����ϴ�.
SELECT *
FROM user_constraints
WHERE table_name LIKE '%CONSTR%';

--�������� Ȱ��ȭ/��Ȱ��ȭ
--city ���� �뱸 ���� üũ��������


ALTER TABLE tblconstraint1
DISABLE CONSTRAINT CK_tblconstraint1_city (CASCADE);





--�ǽ� CREATE UABLE ������ ���̺� ������� �������� �����ϴ� ��
CREATE TABLE tblconstraint2
(   
    empno number(4) NOT NULL -- NOT NULL�� Į�������߰��ۿ�����
    ename VARCHAR2(20) NOT NULL
    , deptno NUMBER(2) CONSTRAINT FK_tblconstraint1_deptno REFERENCES dept(deptno)
    , email VARCHAR2(150) CONSTRAINT UK_tblconstraint1_email UNIQUE
    , kor NUMBER(3) CONSTRAINT CK_tblconstraint1_kor CHECK(kor BETWEEN 0 AND 100)
    , city VARCHAR2(20) CONSTRAINT CK_tblconstraint1_city CHECK(city IN ('����', '�뱸', '����'))
--  , CONSTRAINT PK_tblconstraint1_empno PRIMARY KEY(empno,ename) ����Ű
    , CONSTRAINT PK_tblconstraint1_empno PRIMARY KEY(empno)
    , CONSTRAINT PK_tblconstraint1_deptno FOREIGN KEY(empno) REFERENCES dept(deptno)
    , 
);

DROP TABLE tblconstraint1;
DROP TABLE tblconstraint2;

--�ǽ�3) ALTER TABLE ������ �������� �����ϴ� ��
CREATE TABLE tbl_constraint3
(
    empno NUMBER(4)
    , ename VARCHAR2(20)
    , deptno NUMBER(2)
);
--Table TBL_CONSTRAINT3��(��) �����Ǿ����ϴ�.
ALTER TABLE ���̺��
	ADD [CONSTRAINT �������Ǹ�] ��������Ÿ�� (�÷���);


--1) empno Į���� PK �������� �߰�...
ALTER TABLE tbl_constraint3
ADD CONSTRAINT PK_tblconstraint3_empno PRIMARY KEY(empno);

--2) 
ALTER TABLE tbl_constraint3
ADD CONSTRAINT FK_tblconstraint3_deptno FOREIGN KEY(deptno) REFERENCES dept(deptno);

DROP TABLE tbl_constraint3;


DELETE FROM dept
WHERE deptno = 10;

CREATE TABLE emp
(
--    deptno NUMBER(2) C ���� (F K(deptno) R d(deptno) ON DELETE CASCADE
    deptno NUMBER(2) C ���� (F K(deptno) R d(deptno) ON DELETE SET NULL
);

-- ON
--1) emp -> tbl_emp ����
--empno�� PK �������� �߰�
CREATE TABLE tbl_emp 
AS
(SELECT * FROM emp);

ALTER TABLE tbl_emp
ADD CONSTRAINT PK_emp_empno PRIMARY KEY(empno);
--2) dept -> tbl_dept ����
--deptno�� PK �������� �߰�

CREATE TABLE tbl_dept 
AS
(SELECT * FROM dept);

ALTER TABLE tbl_dept 
ADD CONSTRAINT PK_dept_deptno PRIMARY KEY(deptno);

--���� tbl_emp ���̺� deptno �÷��� FX ���� + ON DELETE CASCADE �ɼ��� �߰�.
ALTER TABLE tbl_emp
ADD CONSTRAINT PK_tbl_emp_deptno FOREIGN KEY(deptno)
                                 REFERENCES tbl_dept(deptno)
                                 ON DELETE CASCADE;
                                 
ALTER TABLE tbl_emp
ADD CONSTRAINT PK_tblemp_deptno FOREIGN KEY(deptno)
                                 REFERENCES tbl_dept(deptno)
                                 ON DELETE SET NULL;
--Table TBL_EMP��(��) ����Ǿ����ϴ�.

SELECT *
FROM dept;

SELECT *
FROM emp;


DROP TABLE tbl_emp;
DROP TABLE tbl_dept;


DELETE FROM dept
WHERE deptno = 30;
--
DELETE FROM tbl_dept
WHERE deptno = 30;



-- JOIN(����) --

CREATE TABLE book(
       b_id     VARCHAR2(10)    NOT NULL PRIMARY KEY   -- åID
      ,title      VARCHAR2(100) NOT NULL  -- å ����
      ,c_name  VARCHAR2(100)    NOT NULL     -- c �̸�
     -- ,  price  NUMBER(7) NOT NULL
 );
-- Table BOOK��(��) �����Ǿ����ϴ�.
INSERT INTO book (b_id, title, c_name) VALUES ('a-1', '�����ͺ��̽�', '����');
INSERT INTO book (b_id, title, c_name) VALUES ('a-2', '�����ͺ��̽�', '���');
INSERT INTO book (b_id, title, c_name) VALUES ('b-1', '�ü��', '�λ�');
INSERT INTO book (b_id, title, c_name) VALUES ('b-2', '�ü��', '��õ');
INSERT INTO book (b_id, title, c_name) VALUES ('c-1', '����', '���');
INSERT INTO book (b_id, title, c_name) VALUES ('d-1', '����', '�뱸');
INSERT INTO book (b_id, title, c_name) VALUES ('e-1', '�Ŀ�����Ʈ', '�λ�');
INSERT INTO book (b_id, title, c_name) VALUES ('f-1', '������', '��õ');
INSERT INTO book (b_id, title, c_name) VALUES ('f-2', '������', '����');

COMMIT;

SELECT *
FROM book;




-- �ܰ����̺�( å�� ���� )
CREATE TABLE danga(
       b_id  VARCHAR2(10)  NOT NULL  -- PK , FK   (�ĺ����� ***)
      ,price  NUMBER(7) NOT NULL    -- å ����
      
      ,CONSTRAINT PK_dangga_id PRIMARY KEY(b_id)
      ,CONSTRAINT FK_dangga_id FOREIGN KEY (b_id)
              REFERENCES book(b_id)
              ON DELETE CASCADE
);
-- Table DANGA��(��) �����Ǿ����ϴ�.
-- book  - b_id(PK), title, c_name
-- danga - b_id(PK,FK), price 
 
INSERT INTO danga (b_id, price) VALUES ('a-1', 300);
INSERT INTO danga (b_id, price) VALUES ('a-2', 500);
INSERT INTO danga (b_id, price) VALUES ('b-1', 450);
INSERT INTO danga (b_id, price) VALUES ('b-2', 440);
INSERT INTO danga (b_id, price) VALUES ('c-1', 320);
INSERT INTO danga (b_id, price) VALUES ('d-1', 321);
INSERT INTO danga (b_id, price) VALUES ('e-1', 250);
INSERT INTO danga (b_id, price) VALUES ('f-1', 510);
INSERT INTO danga (b_id, price) VALUES ('f-2', 400);

COMMIT; 

SELECT *
FROM danga; 



-- å�� ���� �������̺�
 CREATE TABLE au_book(
       id   number(5)  NOT NULL PRIMARY KEY
      ,b_id VARCHAR2(10)  NOT NULL  CONSTRAINT FK_AUBOOK_BID
            REFERENCES book(b_id) ON DELETE CASCADE
      ,name VARCHAR2(20)  NOT NULL
);

INSERT INTO au_book (id, b_id, name) VALUES (1, 'a-1', '���Ȱ�');
INSERT INTO au_book (id, b_id, name) VALUES (2, 'b-1', '�տ���');
INSERT INTO au_book (id, b_id, name) VALUES (3, 'a-1', '�����');
INSERT INTO au_book (id, b_id, name) VALUES (4, 'b-1', '������');
INSERT INTO au_book (id, b_id, name) VALUES (5, 'c-1', '������');
INSERT INTO au_book (id, b_id, name) VALUES (6, 'd-1', '���ϴ�');
INSERT INTO au_book (id, b_id, name) VALUES (7, 'a-1', '�ɽ���');
INSERT INTO au_book (id, b_id, name) VALUES (8, 'd-1', '��÷');
INSERT INTO au_book (id, b_id, name) VALUES (9, 'e-1', '���ѳ�');
INSERT INTO au_book (id, b_id, name) VALUES (10, 'f-1', '������');
INSERT INTO au_book (id, b_id, name) VALUES (11, 'f-2', '�̿���');

COMMIT;

SELECT * 
FROM au_book;


-- ��
-- �Ǹ�       

 CREATE TABLE gogaek(
      g_id       NUMBER(5) NOT NULL PRIMARY KEY 
      ,g_name   VARCHAR2(20) NOT NULL
      ,g_tel      VARCHAR2(20)
);

 INSERT INTO gogaek (g_id, g_name, g_tel) VALUES (1, '�츮����', '111-1111');
INSERT INTO gogaek (g_id, g_name, g_tel) VALUES (2, '���ü���', '111-1111');
INSERT INTO gogaek (g_id, g_name, g_tel) VALUES (3, '��������', '333-3333');
INSERT INTO gogaek (g_id, g_name, g_tel) VALUES (4, '���Ｍ��', '444-4444');
INSERT INTO gogaek (g_id, g_name, g_tel) VALUES (5, '��������', '555-5555');
INSERT INTO gogaek (g_id, g_name, g_tel) VALUES (6, '��������', '666-6666');
INSERT INTO gogaek (g_id, g_name, g_tel) VALUES (7, '���ϼ���', '777-7777');

COMMIT;

SELECT *
FROM gogaek;

-- 
 CREATE TABLE panmai(
       id         NUMBER(5) NOT NULL PRIMARY KEY
      ,g_id       NUMBER(5) NOT NULL CONSTRAINT FK_PANMAI_GID
                     REFERENCES gogaek(g_id) ON DELETE CASCADE
      ,b_id       VARCHAR2(10)  NOT NULL CONSTRAINT FK_PANMAI_BID
                     REFERENCES book(b_id) ON DELETE CASCADE
      ,p_date     DATE DEFAULT SYSDATE
      ,p_su       NUMBER(5)  NOT NULL
);

INSERT INTO panmai (id, g_id, b_id, p_date, p_su) VALUES (1, 1, 'a-1', '2000-10-10', 10);
INSERT INTO panmai (id, g_id, b_id, p_date, p_su) VALUES (2, 2, 'a-1', '2000-03-04', 20);
INSERT INTO panmai (id, g_id, b_id, p_date, p_su) VALUES (3, 1, 'b-1', DEFAULT, 13);
INSERT INTO panmai (id, g_id, b_id, p_date, p_su) VALUES (4, 4, 'c-1', '2000-07-07', 5);
INSERT INTO panmai (id, g_id, b_id, p_date, p_su) VALUES (5, 4, 'd-1', DEFAULT, 31);
INSERT INTO panmai (id, g_id, b_id, p_date, p_su) VALUES (6, 6, 'f-1', DEFAULT, 21);
INSERT INTO panmai (id, g_id, b_id, p_date, p_su) VALUES (7, 7, 'a-1', DEFAULT, 26);
INSERT INTO panmai (id, g_id, b_id, p_date, p_su) VALUES (8, 6, 'a-1', DEFAULT, 17);
INSERT INTO panmai (id, g_id, b_id, p_date, p_su) VALUES (9, 6, 'b-1', DEFAULT, 5);
INSERT INTO panmai (id, g_id, b_id, p_date, p_su) VALUES (10, 7, 'a-2', '2000-10-10', 15);

COMMIT;

SELECT *
FROM panmai;   



--1) EQUI JOIN
-- [����] åID, å����, ���ǻ�(c_name), �ܰ� Į�� ���....

--�����̸Ӹ� Ű? ���� Ű?
--book : b_id(PK), title, c_name
--danga : b_id(PK,FK) [price]
    
-- ��.  ����Ŭ���� natural join �̶�� �θ���.
    SELECT book.b_id, title, c_name, price
    FROM book, danga
    WHERE book.b_id = danga.b_id; -- �������� = ,
    
-- ��.
    SELECT b.b_id, title, c_name, price
    FROM book b, danga d
    WHERE b.b_id = d.b_id;
-- ��.
    SELECT b.b_id, title, c_name, price
    FROM book b JOIN danga d ON b.b_id = d.b_id;
-- ��. USING �� ��� : book.b_id(��ü��.�÷���)X, b.b_id(��Ī��.�÷���)X
    SELECT b_id, title, c_name, price
    FROM book JOIN danga USING (b_id);
-- ��    
    SELECT b_id, title, c_name, price
    FROM book NATURAL JOIN danga;
    
    
--book: b_id, title
--danga : price
--gogaek : g_name
--panmai : p_su



    
--[����] åID, å����, �Ǹż���, �ܰ�, ������, �Ǹűݾ���� = �ܰ� * �Ǹż���
-- ��. ���� ��,�� ������� Ǯ��
SELECT b.b_id, title, price, g_name, p_su * price AS �Ǹűݾ�
FROM book b, panmai p, gogaek g, danga d
WHERE b.b_id = p.b_id AND p.g_id = g.g_id AND b.b_id = d.b_id;
-- ��. JOIN-ON ���� Ǯ��
SELECT b.b_id, title, price, g_name, p_su * price AS �Ǹűݾ�
FROM book b JOIN panmai p ON b.b_id = p.b_id JOIN gogaek g ON p.g_id = g.g_id JOIN danga d ON b.b_id = d.b_id;
-- ��. USING �� ����ؼ� Ǯ��
SELECT b_id, title, price, g_name, p_su * price AS �Ǹűݾ�
FROM book
JOIN panmai USING (b_id)
JOIN gogaek USING (g_id)
JOIN danga USING (b_id);





SELECT *
FROM emp;

SELECT *
FROM dept;

SELECT *
FROM emp e, dept d
WHERE e.deptno = d.deptno;


SELECT *
FROM emp e INNER JOIN dept d ON e.deptno = d.deptno;

--OUTER JOIN
--��. LEFT OUTER JOIN
SELECT d.deptno, ename, hiredate
FROM dept d LEFT OUTER JOIN emp e ON d.deptno = e.deptno;
--
SELECT d.deptno, ename, hiredate
FROM dept d, emp e 
WHERE d.deptno = e.deptno(+);

--��. RIGHT OUTER JOIN
SELECT d.deptno, ename, hiredate
FROM dept d RIGHT OUTER JOIN emp e ON d.deptno = e.deptno;

SELECT d.deptno, ename, hiredate
FROM dept d, emp e 
WHERE d.deptno(+) = e.deptno;
--��. FULL OUTER JOIN
SELECT d.deptno, ename, hiredate
FROM dept d FULL OUTER JOIN emp e ON d.deptno = e.deptno;





--SELF JOIN
--�����ȣ, �����, �Ի�����, ���ӻ������ȣ, ���ӻ���ǻ����

SELECT a.empno, a.ename, a.hiredate, a.mgr, b.ename
FROM emp a, emp b
WHERE a.mgr = b. empno;

SELECT a.empno, a.ename, a.hiredate, a.mgr, b.ename
FROM emp a JOIN emp b ON a.mgr = b. empno;

--CROSS JOIN
SELECT e.*, d.*
FROM emp e, dept d;

SELECT e.*, d.*
FROM emp e CROSS JOIN dept d;

--






-- ����) åID, å����, �Ǹż���, �ܰ�, ������(��), �Ǹűݾ�(�Ǹż���*�ܰ�) ��� 
SELECT p.b_id, title, p_su, price, g.g_name, p_su * price �Ǹż���
FROM danga d, panmai p, book b, gogaek g
WHERE d.b_id = p.b_id AND d.b_id = b.b_id AND g.g_id = p.g_id;




-- ����) ���ǵ� å���� ���� �� ����� �ǸŵǾ����� ��ȸ     
--      (    åID, å����, ���ǸűǼ�, �ܰ� �÷� ���   )

SELECT b.b_id, b.title,  SUM(p_su), d.price
FROM panmai p, book b, danga d
WHERE p.b_id = b.b_id AND b.b_id = d.b_id
GROUP BY b.b_id, b.title, d.price ;


SELECT b.b_id, title, price, SUM(p_su)
FROM book b JOIN panmai p ON b.b_id = p.b_id
            JOIN danga d ON b.b_id = d.b_id
GROUP BY b.b_id, title, price
ORDER BY b.b_id;

-- ����) �ǸűǼ��� ���� ���� å ���� ��ȸ 

WITH t
AS 
  (
  SELECT b.b_id, title , price, SUM( p_su )  ���ǸűǼ�
 FROM  book b JOIN  panmai p ON b.b_id = p.b_id
              JOIN danga d ON  b.b_id = d.b_id
 GROUP BY   b.b_id, title , price
 ORDER BY  b.b_id
 ), 
 s AS (
 SELECT t.*
   , RANK() OVER( ORDER BY  ���ǸűǼ� DESC ) �Ǹż���
 FROM t
 )
 SELECT s.*
 FROM s
 WHERE �Ǹż��� = 1;




-- ����) ���� �ǸűǼ��� ���� ���� å(������ ��������)
--      (  åID, å����, ���� )


--
-- ����) book ���̺��� �ǸŰ� �� ���� ���� å�� ���� ��ȸ

-- ����) book ���̺��� �ǸŰ� �� ���� �ִ� å�� ���� ��ȸ
--      ( b_id, title, price  �÷� ��� )


SELECT DISTINCT b.b_id, title
FROM book b, panmai p
WHERE b.b_id = p.b_id;
-- ����) ���� �Ǹ� �ݾ� ��� (���ڵ�, ����, �Ǹűݾ�)

-- ����) �⵵, ���� �Ǹ� ��Ȳ ���ϱ�

-- ����) ������ �⵵�� �Ǹ���Ȳ ���ϱ�

-- ����) å�� ���Ǹűݾ��� 15000�� �̻� �ȸ� å�� ������ ��ȸ
--      ( åID, ����, �ܰ�, ���ǸűǼ�, ���Ǹűݾ� )


FROM emp

