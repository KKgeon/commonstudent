-- SCOTT 
--(��) : MERGE(����) X /�������� X / ����(JOIN) X /������ ����/��(view)
--(ȭ) : DB �𵨸� + ����������Ʈ
--(��) : DB �𵨸� + ��ǥ
--(��) : PL/SQL

--[ ������ ����( hierarchical query ) ] --
-- ������ �����ͺ��̽��� 2����(��/��) ���̺� ������ ���� ��� �����͸� �����Ѵ�.
--     int [] m = new int[3]  ��
--     int [][] m = new int[3][4] ��/��
SELECT * 
FROM dept;
-- �ǹ������� ����� ������, ������ ����ó�� �������� ������ ������ ���� ����ϰ� �ִ�.
-- ���� ������� ������ ������ ���̺����� �������� �����͸� �����Ͽ� ��ȸ�� �� �ִ� ����� �ʿ��ϴ�
-- , ������ �����ͺ��̽������� �����Ͱ��� �θ�-�ڽ� ���踦 ǥ���� �� �ִ� [�÷�]�� �����Ͽ� �������� ���踦 ǥ���� �� �ִ�.
-- ��) ���θ� ����Ʈ ����  ��з�/�ߺз�/�Һз�  ���� ? 1�� ���̺�(��������), 3�� ���̺� ����.
-- �ϳ��� ���̺��� �������� ������ ǥ���ϴ� ���踦 ��ȯ����(recursive relationship)��� �Ѵ�.
-- ��) emp ��������...  
--      �� �θ�-�ڽ� ���踦 ǥ���� �� �ִ� [�÷�] : mgr �÷�
SELECT *
FROM emp;
-- ORA-01788: CONNECT BY clause required in this query block
SELECT LEVEL          -- ( �ϱ� )
FROM dual
CONNECT BY LEVEL <= 31;
-- 
�����ġ� 
	SELECT 	[LEVEL] {*,�÷��� [alias],...}
	FROM	���̺��
	WHERE	����
	START WITH ����
	CONNECT BY [PRIOR �÷�1��  �񱳿�����  �÷�2��]
		�Ǵ� 
		   [�÷�1�� �񱳿����� PRIOR �÷�2��]
-- 
SELECT mgr, empno
     , LPAD(' ', (LEVEL-1)*3) || ename
     , LEVEL
FROM emp
START WITH mgr IS NULL
CONNECT BY PRIOR empno = mgr;  -- PRIOP �ڽ� = �θ�;  top-down �������
--CONNECT BY PRIOR mgr = empno;  -- PRIOP �θ� = �ڽ�;  bottom-up �������

 ������ mgr=7698�� BLAKE�� �޴����� �� empno�� ������ ���̴�.
SELECT mgr,empno,ename,LEVEL
FROM emp
WHERE mgr = 7698
START WITH mgr IS NULL
CONNECT BY PRIOR empno=mgr;
-- ��) �а�/�к�/�ܰ�����
--   ���ϰ��� : ��/��/�Һз� ~~~
create table tbl_test(
 deptno number(3) not null primary key,
 dname varchar2(24) not null,
 college number(3),
 loc varchar2(10)
);

INSERT INTO tbl_test VALUES        (101,  '��ǻ�Ͱ��а�', 100,  '1ȣ��');
INSERT INTO tbl_test VALUES        (102,  '��Ƽ�̵���а�', 100,  '2ȣ��');
INSERT INTO tbl_test VALUES        (201,  '���ڰ��а� ',   200,  '3ȣ��');
INSERT INTO tbl_test VALUES        (202,  '�����а�',    200,  '4ȣ��');
INSERT INTO tbl_test VALUES        (100,  '�����̵���к�', 10 , null );
INSERT INTO tbl_test VALUES        (200,  '��īƮ�δн��к�',10 , null);
INSERT INTO tbl_test VALUES        (10,  '��������',null , null);
COMMIT; 
--
SELECT *
FROM tbl_test;
--
DROP TABLE tbl_test PURGE;
--
SELECT deptno, dname, college, LEVEL
FROM tbl_test
START WITH deptno = 10
CONNECT BY PRIOR deptno = college;
-- 
SELECT LPAD( '��', (LEVEL-1)*3 ) ||  dname
FROM tbl_test
START WITH dname = '��������'
CONNECT BY PRIOR deptno = college;

-- 10:01  ���� �������� ���� ���� ���..
SELECT LPAD( '��', (LEVEL-1)*3 ) ||  dname
FROM tbl_test
-- WHERE dname != '�����̵���к�'       �ڽĳ�� O
START WITH  college IS NULL
CONNECT BY PRIOR deptno = college AND dname != '�����̵���к�';

-- 1. START WITH ��
-- 2. CONNECT BY �� : ������ ������ � ������ ����Ǵ����� ����ϴ� ����
--    PRIOR ������   : 
-- 3. CONNECT_BY_ROOT :  ������ �������� �ֻ��� �ο�(��)�� ��ȯ�ϴ� ������
-- 4. CONNECT_BY_ISLEAF : CONNECT BY ���ǿ� ���ǵ� ���迡 ���� �ش� ���� ������ �ڽ���
--                       �̸� 1, �׷��� ������ 0 ��ȯ�ϴ� �ǻ� �÷�.
-- 5.  SYS_CONNECT_BY_PATH(column, char) :  ��Ʈ ��忡�� �����ؼ� �ڽ��� �����
--                       ���� ��θ� ��ȯ�ϴ� �Լ�
-- 6. CONNECT_BY_ISCYCLE : ����(�ݺ�) �˰���  �ǻ��÷�.   1/0 ���

-- CONNECT_BY_ROOT  ������ :
 SELECT e.empno
      ,LPAD(' ', 3*(LEVEL-1)) || e.ename
      , LEVEL      
      , e.deptno
      , CONNECT_BY_ROOT ename
      , CONNECT_BY_ISLEAF    -- �ǻ��÷�
      , SYS_CONNECT_BY_PATH( ename, '/')
FROM emp e  
START WITH e.mgr  IS NULL
CONNECT BY PRIOR e.empno = e.mgr  ; 

-- [ ������ ���� ���� ( ORDER  SIBLINGS BY ) ��  ]
-- SELECT e.empno, LPAD(' ', 3*(LEVEL-1)) || e.ename
--, LEVEL
--, d.dname, d.deptno
--FROM emp e, dept d
--WHERE e.deptno = d.deptno
--START WITH e.mgr  IS NULL
--CONNECT BY PRIOR e.empno = e.mgr    
--ORDER SIBLINGS BY e.deptno; 

-- [ ��(VIEW) ]
FROM user_tables;   --all_XXX, dba_XXX   â��
FROM   ���̺� �Ǵ� [��]

���ġ�
	CREATE OR REPLACE [FORCE | NOFORCE] VIEW ���̸�
		[(alias[,alias]...]
	AS subquery
	[WITH CHECK OPTION]
	[WITH READ ONLY];

���⼭ ������ �ɼ��� �ǹ̴� ������ ����.
�ɼ� �� �� 
OR REPLACE ���� �̸��� �䰡 ���� ��� �����ϰ� �ٽ� ���� 
FORCE �⺻ ���̺��� ������ ������� �並 ���� 
NOFORCE �⺻ ���̺��� ���� ���� �並 ���� 
ALIAS �⺻ ���̺��� �÷��̸��� �ٸ��� ������ ���� �÷��� �ο� 
WITH CHECK OPTION �信 ���� access�� �� �ִ� ��(row)���� ����, ���� ���� 
WITH READ ONLY DML �۾��� ����(���� �д� �͸� ����) 

-- �ǽ� ~
-- ���� �Ʒ��� ���� ������ ���....
-- [ SQL ���� ���� ����]
SELECT  b.b_id, title, price, g.g_id, g_name, p_date, p_su
FROM book b JOIN danga d ON b.b_id = d.b_id
            JOIN panmai p ON p.b_id = b.b_id
            JOIN gogaek g ON g.g_id = p.g_id;
-- �����        ���ȼ�, ����, ����     
CREATE OR REPLACE VIEW panView 
AS
  SELECT  b.b_id, title, price, g.g_id, g_name, p_date, p_su
  FROM book b JOIN danga d ON b.b_id = d.b_id
            JOIN panmai p ON p.b_id = b.b_id
            JOIN gogaek g ON g.g_id = p.g_id
  -- ORDER BY p_date DESC            
  -- �並 �����ϴ� subquery���� ORDER BY���� ������ �� ���� 
  ORDER BY p_date DESC    
;
-- ORA-01031: insufficient privileges
-- View PANVIEW��(��) �����Ǿ����ϴ�.
-- SCOTT ������ ������� ������ ����. 
SELECT *
FROM user_sys_privs;
--
SELECT *
FROM panView
ORDER BY p_date DESC;

DESC panView;

SELECT SUM(p_su)
FROM panView;

-- �� �ҽ� Ȯ��
SELECT text
FROM user_views;

-- �� ����
DROP VIEW panview;

-- �� ��� ��ȸ
-- DROP TABLE tbl_test;
SELECT *
FROM tab
WHERE tabtype = 'VIEW';

-- �� ���-> DML �۾� (�ǽ�)  
--  �� �ܼ���
--  �� ���պ�  X

CREATE TABLE testa (
	aid     NUMBER                  PRIMARY KEY
    ,name   VARCHAR2(20) NOT NULL
    ,tel    VARCHAR2(20) NOT NULL
    ,memo   VARCHAR2(100)
);

CREATE TABLE testb (
	 bid NUMBER PRIMARY KEY
    ,aid NUMBER CONSTRAINT fk_testb_aid 
            REFERENCES testa(aid)
            ON DELETE CASCADE
    ,score NUMBER(3)
);

INSERT INTO testa (aid, NAME, tel) VALUES (1, 'a', '1');
INSERT INTO testa (aid, name, tel) VALUES (2, 'b', '2');
INSERT INTO testa (aid, name, tel) VALUES (3, 'c', '3');
INSERT INTO testa (aid, name, tel) VALUES (4, 'd', '4');

INSERT INTO testb (bid, aid, score) VALUES (1, 1, 80);
INSERT INTO testb (bid, aid, score) VALUES (2, 2, 70);
INSERT INTO testb (bid, aid, score) VALUES (3, 3, 90);
INSERT INTO testb (bid, aid, score) VALUES (4, 4, 100);

COMMIT;
--
SELECT * FROM testa;
SELECT * FROM testB;
-- 1. �� ����( �ܼ��� )
CREATE OR REPLACE VIEW aView
AS
  SELECT aid, name , tel  --, memo -- tel
  FROM testa;
--  View AVIEW��(��) �����Ǿ����ϴ�. 

-- 3. DML ���� ( INSERT )
-- ORA-01400: cannot insert NULL into ("SCOTT"."TESTA"."TEL")
INSERT INTO testa (aid, name, memo ) VALUES ( 5, 'f', '5');
INSERT INTO testa (aid, name, tel ) VALUES ( 5, 'f', '5');
COMMIT;

-- �� DELETE ����
DELETE FROM aView
WHERE aid = 5;
COMMIT;
--
UPDATE aView
SET tel = '44'
WHERE aid = 4;
COMMIT;

-- testa, testb ���պ���� DML �׽�Ʈ --
CREATE OR REPLACE VIEW abView
AS 
  SELECT 
        a.aid , name , tel   -- testa
        , bid, score         -- testb
   FROM testa a JOIN testb b ON a.aid = b.aid
; 
-- View ABVIEW��(��) �����Ǿ����ϴ�.
SELECT * 
FROM abView;
-- ���պ並 ����ؼ� INSERT  X
-- ORA-01779: cannot modify a column which maps to a non key-preserved table
INSERT INTO abView ( aid, name, tel, bid, score)
VALUES ( 10,'x',55, 20, 70);
-- ���ÿ� �� ���� ���̺� ������ �÷������� INSERT �� �� ����.
-- ���պ並 ����ؼ� UPDATE : �� ���̺��� ���븸 ���� O , �����̺��� ������ ������ ���� X
UPDATE abView
SET score = 99
WHERE bid= 1;
ROLLBACK;

-- ���պ並 ����ؼ� DELETE :
DELETE FROM abview
WHERE aid = 1;

SELECT * FROM testa;
SELECT * FROM testb;
-- WITH CHECK OPTION �信 ���� access�� �� �ִ� ��(row)���� ����, ���� ���� --
-- [������ 90 �� �̻��� �� ����]
CREATE OR REPLACE VIEW bView
AS
   SELECT bid,aid,score
   FROM testb
   WHERE score >=90
   WITH CHECK OPTION CONSTRAINT CK_bView_score
   ;
SELECT bid,aid,score   FROM testb;
SELECT bid,aid,score   FROM bView;
3	3	90
4	4	100

-- 3->70 ������ ����
UPDATE bView
-- SET score = 70
SET score = 98
WHERE bid = 3;
--ORA-01402: view WITH CHECK OPTION where-clause violation

DROP VIEW bView;
DROP VIEW abView;

DROP TABLE testb;
DROP TABLE testa;

-- �� : ������ ��( MATERIALIZED VIEW )-���� �����͸� ������ �ִ� ��

-- [����] �⵵, ��, ���ڵ�, ����, �Ǹűݾ���(�⵵�� ��).
--    (  �⵵, �� �������� ). ��� �ۼ�.
-- ORA-00937: not a single-group group function
-- ORA-00998: must name this expression with a column alias
CREATE OR REPLACE VIEW gogaekView
AS
  SELECT   TO_CHAR( p_date, 'YYYY') �⵵, TO_CHAR( p_date, 'MM') ��
          , g.g_id, g_name
          -- , p_su , price 
          , SUM( p_su * price ) �Ǹűݾ���
  FROM panmai p JOIN gogaek g ON p.g_id = g.g_id
                JOIN danga d ON p.b_id = d.b_id
  GROUP BY   TO_CHAR( p_date, 'YYYY'), TO_CHAR( p_date, 'MM')
          , g.g_id, g_name     
  ORDER BY       �⵵, �� ASC   
;
--       gogaekView
SELECT * FROM gogaekView;
DROP VIEW gogaekView;

-- Chapter 6, 7 å �б�. [ DB �𵨸� / PLSQL ]--
1. DB �𵨸� ���� 
  1) �����ͺ��̽�(DataBase) ? ���� ���õ� �������� ����(����)
  2) DB�𵨸� ? ���� ������ �������� ���μ����� ���������� DBȭ ��Ű�� ����.
     ��) ��Ÿ�������� ���� �ֹ�( ���� ������ ���� ���μ��� )
        ����(��ǰ) �˻� -> �ֹ� -> ���� -> ��� -> ��ǰ �Ⱦ�
           
2. DB �𵨸� ����(�ܰ�, ����)
   1) ���� ���μ���(�䱸�м����ۼ�)   ��  2) ������ DB �𵨸�(ERD�ۼ�)
          �� ��ġ�� ����                                        ��
   4) ������ DB �𵨸�              ��  3) ���� DB �𵨸�(��Ű��,����ȭ)  
      ������ȭ,
      �ε���
      DBMS(����Ŭ) Ÿ��,ũ�� ���

3. DB �𵨸� ����(1�ܰ�) - ���� �м� ->   [ �䱸���׸���(�м���) ] �ۼ�.
   1) ���� �о߿� ���� �⺻ ���İ� ��� �ʿ�.
   2) ���Ի���� ���忡�� ���� ��ü�� ���μ��� �ľ�,�м� �ʿ�.
   3) �켱, ���� ����(����, ��ǥ, ���� ���)�� �����ϰ� �м�.  p316   (1)
   4) ����� ���ͺ� , �������� ��� �䱸����  ���� ����.
   5) ����� ���� ó���ϴ� DB �м�
   6) ��׶��� ���μ��� �ľ�.
   7) ����ڿ��� �䱸 �м� 
   ���...
   https://terms.naver.com/entry.naver?docId=3431222&ref=y&cid=58430&categoryId=58430
  ��)
�Ѻ� ��Ʈ�� �����ͺ��̽��� ���� [�䱸 ���� ����]
�� �Ѻ� ��Ʈ�� ȸ������ �����Ϸ��� ȸ�����̵�, ��й�ȣ, �̸�, ����, ������ �Է��ؾ� �Ѵ�.
�� ������ ȸ�����Դ� ��ް� �������� �ο��ȴ�.
�� ȸ���� ȸ�����̵�� �ĺ��Ѵ�.
�� ��ǰ�� ���� ��ǰ��ȣ, ��ǰ��, ���, �ܰ� ������ �����ؾ� �Ѵ�.
�� ��ǰ�� ��ǰ��ȣ�� �ĺ��Ѵ�.
�� ȸ���� ���� ��ǰ�� �ֹ��� �� �ְ�, �ϳ��� ��ǰ�� ���� ȸ���� �ֹ��� �� �ִ�.
�� ȸ���� ��ǰ�� �ֹ��ϸ� �ֹ��� ���� �ֹ���ȣ, �ֹ�����, �����, �ֹ����� ������ �����ؾ� �Ѵ�.
�� �� ��ǰ�� �� ������ü�� �����ϰ�, ������ü �ϳ��� ���� ��ǰ�� ������ �� �ִ�.
�� ������ü�� ��ǰ�� �����ϸ� �������ڿ� ���޷� ������ �����ؾ� �Ѵ�.
�� ������ü�� ���� ������ü��, ��ȭ��ȣ, ��ġ, ����� ������ �����ؾ� �Ѵ�.
�� ������ü�� ������ü������ �ĺ��Ѵ�.
�� ȸ���� �Խñ��� ���� �� �ۼ��� �� �ְ�, �Խñ� �ϳ��� �� ���� ȸ���� �ۼ��� �� �ִ�.
�� �Խñۿ� ���� �۹�ȣ, ������, �۳���, �ۼ����� ������ �����ؾ� �Ѵ�.
�� �Խñ��� �۹�ȣ�� �ĺ��Ѵ�.
[���̹� ���Ĺ��] �䱸 ���� �м� (�����ͺ��̽� ����, 2013. 6. 30., �迬��)


3. DB �𵨸� ����(2�ܰ�) - ������ DB �𵨸�(ERD�ۼ�)
  1) ������ DB �𵨸� ? DB �𵨸��� �Կ� �־� ���� ���� �ؾߵ� ���� 
                      ����ڰ� �ʿ���ϴ� �����Ͱ� �������� �ľ�.
                      � �����͸� DB�� �����ؾߵǴ� �� ����� �м�
                      ->
                      ���� �м�, ����� �䱸 �м����� ���ؼ� -> 1�ܰ� �䱸���׸��� �ۼ�
                      ������ ���� ������ �������� ������� ������ �� �ִ� 
                      ��Ȯ�� ���·� ǥ���ϴ� �ܰ踦 "������ DB�𵨸�"�̶�� �Ѵ�. 
   2) ��Ȯ�� ���·� ǥ���ϴ� ��� ? 1976�� P.Chen ����
       ��. ��ü(Entity) - ���簢��,  ���� ���� �׷��� �������� �˾ƺ��� ���� ǥ��. -> ER-Diagram(ERD)
          �� ��ü(Entity)? ���� ������ ���� �����ͷ� �����Ǿ������� ���,�繰,���,��� ���� "��ü"�Ѵ�.
          �� �����ϰ��� �ϴ� ������ ����, ����, ������ ���� �����ͷ� �����Ǿ������� �׸��� �ľ��ϴ� ����
             �ſ� �߿��ϴ�. 
          �� ��ü�� �л�, ���� ��� ���� ���������� �����ϴ� ����
                   �а�, ���� ��� ���� ���������� �����ϴ� ����.
          �� ��ü�� ���̺�� ���ǵȴ�.
          �� ��ü�� �ν��Ͻ��� �Ҹ��� �������� ��ü���� �����̴�.
             ��) ����(��ü) : ����Ŭ����, �ڹٰ���, JSP���� ����� �ν��Ͻ��� ����.
                 �а�(��ü) : �İ���, ������ ��� �ν��Ͻ��� ����.
          �� ��ü�� �ľ��ϴ� ��� ( ���� �߿� )
             ��) �п������� �л����� �����¿� �������� ���񺰷� �����ϱ⸦ ���ϰ� �ִ�..
                (��� ���� �м��� ����)
                 - ��ü ? �п�, �л�, ������, ����, ����
                               �� �Ӽ� : �й�, �̸�, �ּ�, ����ó, �а� ���
                                     �� �Ӽ� : ��ᳯ¥, �⼮�ð�, ��ǽð�
       
       ��. �Ӽ�(Attribute) - Ÿ����
           �� �Ӽ� ? ������ �ʿ䰡 �ִ� ��ü�� ���� ����
              ��, �Ӽ��� ��ü�� ����, �з�, ����, ����, Ư¡, Ư�� ��� �����׸��� �ǹ��Ѵ�.
           �� �Ӽ� ���� �� ���� �߿��� �κ��� ������ ������ Ȱ�� ���⿡ �´� �Ӽ��� ����.
           �� �Ӽ��� ������  10�� ���ܰ� ����.
           �� �Ӽ���  �÷����� ���ǵȴ�. 
           �� �Ӽ��� ����
               1) ���� �Ӽ� - ���� ���� �ִ� �Ӽ�
                  ��) �����ü - �����ȣ �Ӽ�, ����� �Ӽ�, �ֹε�Ϲ�ȣ �Ӽ�, �Ի����� �Ӽ� ���
               2) ���� �Ӽ� - ���� �Ӽ����� ����ؼ� ����� �� �ִ� �Ӽ�
                  ��) ���� �Ӽ� �ֹε�Ϲ�ȣ����  ����,����,���� �Ӽ� ��� 
                      �Ǹűݾ� �Ӽ� = �ܰ� * �Ǹż���
               3) ���� �Ӽ� - �����δ� �������� ������ �ý����� ȿ������ ���ؼ� �����ڰ� ���Ƿ�
                          �ο��ϴ� �Ӽ�
                 ��) �ֹ�����
                 3:02 ���� ����~ 
           �� �Ӽ� ������ ����     
               1) �Ӽ��� ���� �� �ִ� ������ ����(�������� ����, �������� �� Ư����) ������ ��.
                  ��) ����(E) - ����(A) �Ӽ��� ���� 0~100 ����
                               kor NUMBER(3) DEFAuLT 0 CHECK( kor between 0 and 100)
               2) ������ ������ ���� ���� �� ��ü�� DB�� ������ �� ���Ǵ� ���⹰�̴�.
               3) ������ ���� �ÿ��� �Ӽ��� �̸�, �ڷ���, ũ��, �������� ���. �ľ�
               4) ������ ���Ἲ
           �� �ĺ���(Identifier ): ��ǥ���� �Ӽ� , �������(����)
               1) �� ��ü ������ ������ �ν��Ͻ��� ������ �� �ִ� ������ ���� �Ӽ�, �Ӽ� �׷�
               2) �ĺ��ڰ� ������ �����͸� ����,������ �� ������ �߻��Ѵ�. 
               3) �ĺ����� ����
                   (1) �ĺ�Ű( Candiate Key )
                       ��ü�� ������ �ν��Ͻ��� ������ �� �ִ� �Ӽ�
                       ��) �л���ü(E)   ����, �ֹι�ȣ, [�й�], �̸���, ��ȭ��ȣ, ���
                           �ν��Ͻ� -  ȫ�浿 .........
                           �ν��Ͻ� -  ��浿 ........
                         
                   (2) �⺻Ű( Primary Key) - [�й�]
                       �ĺ�Ű �߿� ��ǥ���� ���� ������ �ĺ�Ű�� �⺻Ű ...
                       �������� ȿ����, Ȱ�뵵, ����(ũ��) ��� �ľ��ؼ� �ĺ�Ű �߿� �ϳ��� �⺻Ű�� �����Ѵ�. 
                       
                   (3) ��üŰ( Alternate Key)
                        �ĺ�Ű - �⺻Ű = ������ �ĺ�Ű
                        - INDEX(�ε���)�� Ȱ��ȴ�. 
                        
                   (4) ����Ű( Composite Key )
                   (5) �븮Ű( Surrogate Key )
                      - �й��� �⺻Ű�� ������ڰ� ������ ������
                      - �ĺ��ڰ� �ʹ� ��ų� ���� ���� ����Ű�� �����Ǿ� �ִ� ��� ���������� �߰��� �ĺ���(�ΰ�Ű)
                      - �������� 30��... (����:�Ϸù�ȣ 1~30 )  ����, ȿ������ ���̰ڴ�.
                        ������ȭ �۾�
           
       ��. ��ü ����( Relational)  - ������
          ������ �������� ���� ��ü�� ���� ���� ����..
          ��) �μ� ��ü(E)          <�ҼӰ���>        ��� ��ü(E)
             �μ���ȣ�Ӽ�(�ĺ���)                    �����ȣ(�ĺ���)
             �μ���Ӽ�                             �����
             ������Ӽ�                            �Ի�����
                                                    :
          ��) �л�(E)  <����ħ����>     ����(E)
          ��) ��ǰ(E) �Ǽ�<�ֹ�����>�Ǽ�  ��(E)
          
          �� ���� ǥ��
             1) �� ��ü���� �Ǽ����� �����ϰ� ���踦 �ο��Ѵ�. 
             2) ���� ���� ǥ�� (    �μ�E -01----0N-���E )
                                   1 :  1
                                   N : M ( �� �� �� )  ��ǰE N0  <�ֹ�>  0M ��E
             3) ���ü� ǥ��  0 , 1
       ��. ����(��ũ) - �Ǽ�
       https://terms.naver.com/entry.naver?docId=3431223&cid=58430&categoryId=58430&expCategoryId=58430
       
3. DB �𵨸� ����(3�ܰ�) - ���� DB �𵨸�( ��Ű��, ����ȭ )
https://terms.naver.com/entry.naver?docId=3431227&cid=58430&categoryId=58430&expCategoryId=58430
   �� ������ �𵨸��� �����(ERD) -> ��. �����̼�(���̺�) ��Ű�� ����(��ȯ) + ����ȭ �۾�
                                      ���轺Ű��            ����
      4:02 ���� ����~
   ��  �θ����̺�� �ڽ����̺� ����
      - ������ ������ ��
      - ��)  �μ�(dept)    <�ҼӰ���>       ���(emp)              ���� ����
             �θ�                          �ڽ�
      - ��)   ��         <�ֹ�����>       ��ǰ                   ���� ���� X, ���� ��ü
             �θ�                          �ڽ�
   �� �⺻Ű(PK)�� �ܷ�Ű(FK)
     dept(deptno PK )
     emp( deptno FK )
   �� (�ϱ�)
      �ĺ�����   (�Ǽ�): �θ����̺���  PK �� �ڽ����̺��� PK�� ���� �Ǵ� ��.
      ��ĺ����� (����): �θ����̺���  PK �� �ڽ����̺��� FK�� ���� �Ǵ� ��.
     
   (1) ERD ->  5���� ��Ģ(���η�) -> �����̼� ��Ű�� ����(��ȯ) +  �̻����� �߻�
                                                           -> ����ȭ ����.
       ��. ��Ģ1: ��� ��ü(E)�� �����̼�(Table)���� ��ȯ�Ѵ�
            ��ü -> ���̺�
            �Ӽ� -> �÷�
            �ĺ��� -> �⺻Ű 
            
       ��. ��Ģ2: �ٴ��(n:m) ����� �����̼����� ��ȯ�Ѵ�
           �� N   <�ֹ�>   M ��ǰ
       ��. ��Ģ3: �ϴ��(1:n) ����� �ܷ�Ű�� ǥ���Ѵ�
       ��. ��Ģ4: �ϴ���(1:1) ���踦 �ܷ�Ű�� ǥ���Ѵ�
       ��. ��Ģ5: ���� �� �Ӽ��� �����̼����� ��ȯ�Ѵ�






