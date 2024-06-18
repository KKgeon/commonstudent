-- SCOTT
--[1] insa ���̺��� �� �μ��� ����� ��ȸ
--��. SET ���� ������ UNION, UNION ALL
--��. �����������
SELECT DISTINCT buseo
    , (
        SELECT COUNT(*) CNT
        FROM insa
        WHERE buseo = p.buseo) CNT
FROM insa p
ORDER BY buseo;
--��. WITH��
--��. GROUP BY
SELECT buseo, COUNT(*) CNT
FROM insa
GROUP BY buseo
ORDER BY buseo;


--[2] emp ���̺��� �޿��� ���(RANK) + (TOP3)
--��. TOP-N �м� ���
SELECT ROWNUM pay_rank
    ,e.*
FROM(
    SELECT *
    FROM emp
    ORDER BY sal+NVL(comm,0) DESC
) e
WHERE ROWNUM <=3 ;
--��. �ڹ� ���� ���
SELECT
    ( SELECT COUNT(*)+1 FROM emp c WHERE sal+NVL(comm,0) > ( p.sal + NVL(p.comm,0)) ) pay_rank
    , p.*
FROM emp p
ORDER BY pay_rank ASC;
--��. RANK() OVER() ���� �Լ�
SELECT e.*
FROM    (
                SELECT 
                    RANK() OVER (ORDER BY sal + NVL(comm, 0) DESC) AS pay_rank
                    ,emp.*
                FROM emp
        ) e
WHERE e.pay_rank BETWEEN 1 AND 3;
WHERE e.pay_rank <= 1;
WHERE e.pay_rank <= 3;


--[3] insa ���̺��� ���ڻ����, ���ڻ���� ��ȸ
--��. SET ���� ������
SELECT '���ڻ����' "����", COUNT(*) "�����"
FROM insa
WHERE MOD( SUBSTR(ssn, 8, 1 ), 2 ) = 1
UNION ALL
SELECT '���ڻ����' "����", COUNT(*) "�����"
FROM insa
WHERE MOD( SUBSTR(ssn, 8, 1 ), 2 ) = 0;
--��. GROUP BY
SELECT DECODE(MOD(SUBSTR(ssn,8,1),2),1,'���ڻ����','���ڻ����') GENDER
        , COUNT(*) CNT
FROM insa
GROUP BY MOD(SUBSTR(ssn,8,1),2)
UNION ALL
SELECT '��ü�����', COUNT(*)
FROM insa;
--[4] emp �� �μ��� ����� ��ȸ
SELECT deptno, COUNT(*) cnt
FROM emp
GROUP BY deptno
ORDER BY deptno ASC;

--[4-2] ���� ������� �μ���ȣ�� �ƴ϶� �μ����� ���.
��) �μ���, �����, �Ի����� ���
dept : dname
emp : ename, hiredate
SELECT deptno, dname, ename, hiredate
FROM dept d JOIN emp e ON d.deptno = e.deptno;




UPDATE insa
SET ssn = '800221-1544236'
WHERE num = 1002;
COMMIT;

SELECT *
FROM insa;







--[5-2] emp ���̺��� 10�� �μ��� sal 10% �λ�, 20�� �μ��� sal 15% �λ�, �� �� �μ��� 5%�λ�
SELECT deptno, ename, sal
    ,sal*(1+DECODE( deptno, 10, 0.1 , 20, 0.15, 30, 0.05 )) "dsal"
    ,sal* CASE deptno
           WHEN 10 THEN 1.1
           WHEN 20 THEN 1.15
           WHEN 30 THEN 1.05
           END "csal"
FROM emp;


--[����] insa ���̺��� �ѻ����, �����������, ���û��ϻ����, �����Ļ���� ���




--���� emp ���̺��� ��� apy���� ���ų� ���� ������� �޿����� ���

--�� DECODE, CASE




--[����] emp, dept ���̺��� ����ؼ�
--����� �������� �ʴ� �μ��� �μ���ȣ, �μ����� ���

SELECT deptno, dname
FROM dept
WHERE deptno NOT IN (SELECT deptno FROM emp);




SELECT d.deptno, d.dname, COUNT(empno) cnt
            FROM dept d LEFT OUTER JOIN emp e ON d.deptno = e.deptno
            -- WHERE cnt = 0  -- ORA-00904: "CNT": invalid identifier
            GROUP BY d.deptno, d.dname
            HAVING COUNT(empno) = 0
            ORDER BY d.deptno;
            
--HAVING �� : GROUP BY ���� ������
--[����] insa ���̺��� �� �μ��� ���ڻ������ �ľ��ؼ� 5�� �̻��� �μ� ���� ���
-- ������ 7
-- �ѹ��� 5


SELECT buseo, COUNT(*) cnt
FROM insa
WHERE MOD( SUBSTR(ssn, 8, 1 ), 2 ) = 0
GROUP BY buseo;


--[����] emp ���̺��� �μ���, jpb�� ����� �ѱ޿��� ��ȸ

SELECT deptno, job
    , COUNT(*) cnt
    , SUM( sal+NVL(comm,0) ) deptno_pay_sum
    , AVG( sal+NVL(comm,0) ) deptno_pay_avg
    , MAX( sal+NVL(comm,0) ) deptno_pay_max
    , MIN( sal+NVL(comm,0) ) deptno_pay_min
FROM emp
GROUP BY deptno, job
ORDER BY deptno, job;


--(�ϱ�) Oracle 10g PARTITION OUTER JOIN
WITH t AS (
        SELECT DISTINCT job
        FROM emp
           )
SELECT deptno, t.job, SUM(sal+NVL(comm,0)) d_j_pay
FROM t LEFT OUTER JOIN emp e ON t.job = e.job
GROUP BY deptno, t.job
ORDER BY deptno;


--[ GROUPING SETS ��]
SELECT deptno, COUNT(*)
FROM emp
GROUP BY deptno;


SELECT job, COUNT(*)
FROM emp
GROUP BY job;


SELECT deptno, job, COUNT(*)
FROM emp
GROUP BY GROUPING SETS(deptno, job);





-- ( �ϱ� )
SELECT d.deptno
        ,NVL(LISTAGG(ename, ',') WITHIN GROUP( ORDER BY ename),'����� �������� �ʽ��ϴ�') ������ --ename�� LIST ��� ����
FROM dept d LEFT JOIN emp e ON d.deptno = e.deptno
GROUP BY d.deptno;


SELECT *
FROM salgrade;



SELECT ename, sal
CASE
    WHEN sal BETWEEN 700 AND 1200 THEN 1
    WHEN sal BETWEEN 1201 AND 1400 THEN 2
    WHEN sal BETWEEN 1401 AND 2000 THEN 3
    WHEN sal BETWEEN 2001 AND 3000 THEN 4
    WHEN sal BETWEEN 3001 AND 9999 THEN 5
    END grade
FROM emp;




SELECT ename, sal, grade
FROM emp, salgrade
WHERE sal BETWEEN losal AND hisal;

--[���� ǥ���� ����Ŭ �Լ�]

SELECT *
FROM insa
WHERE REGEXP_LIKE (ssn, '7\d');
WHERE ssn LIKe '7%'; --���ϵ�ī��( % _ )




SELECT empno, ename, sal
    ,   RANK() OVER(ORDER BY sal DESC) r_rank 
    ,   DENSE_RANK() OVER(ORDER BY sal DESC) dr_rank
    ,   ROW_NUMBER() OVER(ORDER BY sal DESC) rn_rank
FROM emp;




SELECT deptno, empno, ename, sal
    ,   RANK() OVER(PARTITION BY deptno ORDER BY sal DESC) r_rank 
    ,   DENSE_RANK() OVER(PARTITION BY deptno ORDER BY sal DESC) dr_rank
    ,   ROW_NUMBER() OVER(PARTITION BY deptno ORDER BY sal DESC) rn_rank
FROM emp;

--[����] emp ���̺���
--      �� ����� �޿��� ��ü ����, �μ��� ������ ���

SELECT deptno, ename, sal
    ,RANK() OVER(ORDER BY sal DESC) ��ü����
    ,RANK() OVER(PARTITION BY deptno ORDER BY sal DESC) �μ�������
FROM emp
ORDER BY deptno;



--[ROLLU/CUBE ������]
--INSA ���̺���
-- ���� �����:31��
-- ���� �����:29��
-- ��ü �����:60��

SELECT DECODE(MOD(SUBSTR(ssn,8,1),2),1,'���ڻ����','���ڻ����') GENDER
        , COUNT(*) CNT
FROM insa
GROUP BY MOD(SUBSTR(ssn,8,1),2)
UNION ALL
SELECT '��ü�����', COUNT(*)
FROM insa;

SELECT DECODE(MOD(SUBSTR(ssn,-7,1),2),1,'����',0,'����','��ü') || '�����'GENDER
        , COUNT(*) CNT
FROM insa
GROUP BY CUBE( MOD(SUBSTR(ssn,-7,1),2))
ORDER BY gender;



SELECT buseo, jikwi
        , COUNT(*) CNT
--        , SUM(basicpay) ���޺��޿���
FROM insa
GROUP BY buseo, ROLLUP(jikwi)
--GROUP BY ROLLUP(buseo, jikwi)
--GROUP BY CUBE(buseo, jikwi)
ORDER BY buseo;




--[����] emp ���̺��� ���� ���� �Ի��� ����� ���� �ʰ�(�ֱ�)�� �Ի��� ����� ����
--          �հ�� ������ �Ի�������


SELECT 
    MAX(hiredate)
    ,MIN(hiredate)
    , MAX(hiredate)-MIN(hiredate) 
FROM emp;

-- ���� ���� !~~~~
-- [����] insa ���̺��� �� ������� �����̸� ����ؼ� ���...
--  1) ������ = ���س⵵ - ���ϳ⵵      (���������� ���� X   -1 )
--      ��. ���� ������ ����
--      ��. 981223-1XXXX
--                 12    1900   34  2000  89 1800
--  10�� Ǯ��ð�~~ 



SELECT name,ssn, TRUNC((TO_DATE(SUBSTR(ssn, 1, 6), 'YYMMDD')-SYSDATE)/365) ������
FROM insa;



SELECT *
FROM insa;