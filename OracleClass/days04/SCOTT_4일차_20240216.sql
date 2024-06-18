--SCOTT
SELECT*
FROM emp;
FROM scott.emp;


WHERE dname LIKE '%\_%' ESCAPE '\';
WHERE dname LIKE '%\%%' ESCAPE '\';

SELECT name, ssn
FROM insa
WHERE (name LIKE '김%' OR name LIKE '이%')
AND SUBSTR(ssn,1,1)='7' AND SUBSTR(ssn,3,2)='12';


--ORA-01031: insufficient privileges
CREATE PUBLIC SYNONYM arirang
FOR scott.emp;


SELECT
     TO_DATE ('2024', 'YYYY')
    ,TO_DATE ('2024/03', 'YYYY/MM')
    ,TO_DATE ('2024/05/21')
FROM dual;



--REPLACE() 함수
SELECT name, ssn
    ,REPLACE(ssn, '-') SSN2
--    , SUBSTR (ssn, 1, 6)
--    , SUBSTR (ssn, 8)
--    , CONCAT(SUBSTR( ssn, 1, 6), SUBSTR(ssn, 8) )ssn
FROM insa;





--여기서 YY와 RR의 차이점:
-- RR과 YY는 둘다 년도의 마지막 두자리를 출력해 주지만, 현재 system상의 세기와 나타내고자 하는 년도의 세기를 비교할 했을 때 출력되는 값이 다르다.
--RR은 시스템상(1900년대)의 년도를 기준으로 하여 이전 50년도에서 이후 49년까지는 기준년도와 가까운 1850년도에서 1949년도까지의 값으로 표현하고, 
--이 범위를 벗아날 경우 다시 2100년을 기준으로 이전 50년도에서 이후 49년까지의 값을 출력한다.
--YY는 무조건 system상의 년도를 따른다.


SELECT TO_CHAR (SYSDATE, 'CC') --21세기 (2024년도)
FROM dual;


SELECT 
        '97/01/10'  --날짜,[문자열]
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
--p226질의 4-12
-- emp 테이블에서 평균급여보다 많이 받는 사원들의 정보를 조회
-- 1. emp 테이블의 평균 급여 ? avg() 집계함수, 그룹함수
SELECT AVG(sal + NVL(comm,0)) avg_pay
FROM emp;
--2260.416666666666666666666666666666666667
SELECT *
FROM emp
WHERE sal + NVL(comm,0) >=(SELECT AVG(sal + NVL(comm,0)) avg_pay 
                            FROM emp);

WHERE sal + NVL(comm,0) >=2260.416666666666666666666666666666666667;
--[문제] 각 부서별 평균 급여보다 많이 받는 사원들의 정보를 조회.
SELECT AVG(sal + NVL(comm,0)) avg_pay
FROM emp
WHERE deptno = 10; -- 10번 사원들의 평균 2916.666666666666666666666666666666666667

SELECT AVG(sal + NVL(comm,0)) avg_pay
FROM emp
WHERE deptno = 20; -- 20번 사원들의 평균 2258.333333333333333333333333333333333333

SELECT AVG(sal + NVL(comm,0)) avg_pay
FROM emp
WHERE deptno = 30; -- 30번 사원들의 평균 1933.333333333333333333333333333333333333

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


--상관서브쿼리
--[문제1] 사원 전체에서 최고급여를 받는 사원의 정보를 조회(출력) 사원명 사원번호 급여액 부서번호
SELECT deptno, empno, ename, sal+NVL(comm,0) pay
FROM emp p
WHERE sal+NVL(comm,0) =(SELECT MAX(sal + NVL(comm,0)) max_pay
                        FROM emp c
                        WHERE deptno=p.deptno);
--[문제2] 각 부서별 최고 급여를 받는 사원의 정보를 조회(출력)
--ORA-00937: not a single-group group function
select deptno,ename,sal
    ,( SELECT AVG(sal) FROM emp WHERE deptno = t1.deptno)
--    ,AVG(sal)
from emp t1
where sal > (select avg(sal)
            from emp t2
            where t2.deptno=t1.deptno)
ORDER BY deptno ASC;


