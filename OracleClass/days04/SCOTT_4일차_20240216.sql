--SCOTT
SELECT*
FROM emp;
FROM scott.emp;


WHERE dname LIKE '%\_%' ESCAPE '\';
WHERE dname LIKE '%\%%' ESCAPE '\';

SELECT name, ssn
FROM insa
WHERE (name LIKE '��%' OR name LIKE '��%')
AND SUBSTR(ssn,1,1)='7' AND SUBSTR(ssn,3,2)='12';


--ORA-01031: insufficient privileges
CREATE PUBLIC SYNONYM arirang
FOR scott.emp;


SELECT
     TO_DATE ('2024', 'YYYY')
    ,TO_DATE ('2024/03', 'YYYY/MM')
    ,TO_DATE ('2024/05/21')
FROM dual;



--REPLACE() �Լ�
SELECT name, ssn
    ,REPLACE(ssn, '-') SSN2
--    , SUBSTR (ssn, 1, 6)
--    , SUBSTR (ssn, 8)
--    , CONCAT(SUBSTR( ssn, 1, 6), SUBSTR(ssn, 8) )ssn
FROM insa;





--���⼭ YY�� RR�� ������:
-- RR�� YY�� �Ѵ� �⵵�� ������ ���ڸ��� ����� ������, ���� system���� ����� ��Ÿ������ �ϴ� �⵵�� ���⸦ ���� ���� �� ��µǴ� ���� �ٸ���.
--RR�� �ý��ۻ�(1900���)�� �⵵�� �������� �Ͽ� ���� 50�⵵���� ���� 49������� ���س⵵�� ����� 1850�⵵���� 1949�⵵������ ������ ǥ���ϰ�, 
--�� ������ ���Ƴ� ��� �ٽ� 2100���� �������� ���� 50�⵵���� ���� 49������� ���� ����Ѵ�.
--YY�� ������ system���� �⵵�� ������.


SELECT TO_CHAR (SYSDATE, 'CC') --21���� (2024�⵵)
FROM dual;


SELECT 
        '97/01/10'  --��¥,[���ڿ�]
        , TO_CHAR(TO_DATE('97/01/10','YY/MM/DD'),'YYYY')a_YY
        , TO_CHAR(TO_DATE('97/01/10','RR/MM/DD'),'YYYY')b_RR
FROM dual;
select*
FROM emp;


SELECT deptno, ename, sal+NVL(comm,0) pay
FROM emp
ORDER BY 1 ASC, 3 DESC;
ORDER BY dept ASC pay DESC;


ALL
--p226���� 4-12
-- emp ���̺��� ��ձ޿����� ���� �޴� ������� ������ ��ȸ
-- 1. emp ���̺��� ��� �޿� ? avg() �����Լ�, �׷��Լ�
SELECT AVG(sal + NVL(comm,0)) avg_pay
FROM emp;
--2260.416666666666666666666666666666666667
SELECT *
FROM emp
WHERE sal + NVL(comm,0) >=(SELECT AVG(sal + NVL(comm,0)) avg_pay 
                            FROM emp);

WHERE sal + NVL(comm,0) >=2260.416666666666666666666666666666666667;
--[����] �� �μ��� ��� �޿����� ���� �޴� ������� ������ ��ȸ.
SELECT AVG(sal + NVL(comm,0)) avg_pay
FROM emp
WHERE deptno = 10; -- 10�� ������� ��� 2916.666666666666666666666666666666666667

SELECT AVG(sal + NVL(comm,0)) avg_pay
FROM emp
WHERE deptno = 20; -- 20�� ������� ��� 2258.333333333333333333333333333333333333

SELECT AVG(sal + NVL(comm,0)) avg_pay
FROM emp
WHERE deptno = 30; -- 30�� ������� ��� 1933.333333333333333333333333333333333333

SELECT*
FROM emp
WHERE deptno = 10 AND sal + NVL(comm,0)>= 2916.666666666666666666666666666666666667
UNION
SELECT*
FROM emp
WHERE deptno = 20 AND sal + NVL(comm,0)>= 2258.333333333333333333333333333333333333
UNION
SELECT*
FROM emp
WHERE deptno = 30 AND sal + NVL(comm,0)>= 1933.333333333333333333333333333333333333;


SELECT MAX(sal + NVL(comm,0)) max_pay_30
FROM emp
WHERE deptno=30;

SELECT*
FROM emp
WHERE sal+NVL(comm,0) >2580;


SELECT *
FROM emp
WHERE sal+NVL(comm,0)>  ALL( SELECT sal + NVL(comm,0) pay_30
                        FROM emp
                        WHERE deptno=30);

WHERE sal+NVL(comm,0)>(SELECT MAX(sal + NVL(comm,0) max_pay_30
                        FROM emp
                        WHERE deptno=30)
                        
                        
select deptno, ename, empno,job
FROM emp
WHERE deptno=10 OR job ='CLERK';

select deptno, ename, empno
FROM emp
WHERE deptno NOT IN(10,30);



--p229

WITH temp AS (SELECT sal+NVL(comm,0) pay FROM emp)
SELECT MAX(pay),MIN(pay),AVG(pay),SUM(pay)
FROM temp;


--�����������
--[����1] ��� ��ü���� �ְ�޿��� �޴� ����� ������ ��ȸ(���) ����� �����ȣ �޿��� �μ���ȣ
SELECT deptno, empno, ename, sal+NVL(comm,0) pay
FROM emp p
WHERE sal+NVL(comm,0) =(SELECT MAX(sal + NVL(comm,0)) max_pay
                        FROM emp c
                        WHERE deptno=p.deptno);
--[����2] �� �μ��� �ְ� �޿��� �޴� ����� ������ ��ȸ(���)
--ORA-00937: not a single-group group function
select deptno,ename,sal
    ,( SELECT AVG(sal) FROM emp WHERE deptno = t1.deptno)
--    ,AVG(sal)
from emp t1
where sal > (select avg(sal)
            from emp t2
            where t2.deptno=t1.deptno)
ORDER BY deptno ASC;


