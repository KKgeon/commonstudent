-- SCOTT
--[1] insa 테이블에서 각 부서별 사원수 조회
--ㄱ. SET 집합 연산자 UNION, UNION ALL
--ㄴ. 상관서브쿼리
SELECT DISTINCT buseo
    , (
        SELECT COUNT(*) CNT
        FROM insa
        WHERE buseo = p.buseo) CNT
FROM insa p
ORDER BY buseo;
--ㄷ. WITH절
--ㄹ. GROUP BY
SELECT buseo, COUNT(*) CNT
FROM insa
GROUP BY buseo
ORDER BY buseo;


--[2] emp 테이블에서 급여의 등수(RANK) + (TOP3)
--ㄷ. TOP-N 분석 방식
SELECT ROWNUM pay_rank
    ,e.*
FROM(
    SELECT *
    FROM emp
    ORDER BY sal+NVL(comm,0) DESC
) e
WHERE ROWNUM <=3 ;
--ㄴ. 자바 로직 사용
SELECT
    ( SELECT COUNT(*)+1 FROM emp c WHERE sal+NVL(comm,0) > ( p.sal + NVL(p.comm,0)) ) pay_rank
    , p.*
FROM emp p
ORDER BY pay_rank ASC;
--ㄱ. RANK() OVER() 순위 함수
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


--[3] insa 테이블에서 남자사원수, 여자사원수 조회
--ㄱ. SET 집합 연산자
SELECT '남자사원수' "성별", COUNT(*) "사원수"
FROM insa
WHERE MOD( SUBSTR(ssn, 8, 1 ), 2 ) = 1
UNION ALL
SELECT '여자사원수' "성별", COUNT(*) "사원수"
FROM insa
WHERE MOD( SUBSTR(ssn, 8, 1 ), 2 ) = 0;
--ㄴ. GROUP BY
SELECT DECODE(MOD(SUBSTR(ssn,8,1),2),1,'남자사원수','여자사원수') GENDER
        , COUNT(*) CNT
FROM insa
GROUP BY MOD(SUBSTR(ssn,8,1),2)
UNION ALL
SELECT '전체사원수', COUNT(*)
FROM insa;
--[4] emp 각 부서별 사원수 조회
SELECT deptno, COUNT(*) cnt
FROM emp
GROUP BY deptno
ORDER BY deptno ASC;

--[4-2] 위의 결과물에 부서번호가 아니라 부서명이 출력.
예) 부서명, 사원명, 입사일자 출력
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







--[5-2] emp 테이블에서 10번 부서원 sal 10% 인상, 20번 부서원 sal 15% 인상, 그 외 부서는 5%인상
SELECT deptno, ename, sal
    ,sal*(1+DECODE( deptno, 10, 0.1 , 20, 0.15, 30, 0.05 )) "dsal"
    ,sal* CASE deptno
           WHEN 10 THEN 1.1
           WHEN 20 THEN 1.15
           WHEN 30 THEN 1.05
           END "csal"
FROM emp;


--[문제] insa 테이블에서 총사원수, 생일전사원수, 오늘생일사원수, 생일후사원수 출력




--문제 emp 테이블에서 평균 apy보다 같거나 많은 사원들의 급여합을 출력

--ㄷ DECODE, CASE




--[문제] emp, dept 테이블을 사용해서
--사원이 존재하지 않는 부서의 부서번호, 부서명을 출력

SELECT deptno, dname
FROM dept
WHERE deptno NOT IN (SELECT deptno FROM emp);




SELECT d.deptno, d.dname, COUNT(empno) cnt
            FROM dept d LEFT OUTER JOIN emp e ON d.deptno = e.deptno
            -- WHERE cnt = 0  -- ORA-00904: "CNT": invalid identifier
            GROUP BY d.deptno, d.dname
            HAVING COUNT(empno) = 0
            ORDER BY d.deptno;
            
--HAVING 절 : GROUP BY 절의 조건절
--[문제] insa 테이블에서 각 부서별 여자사원수를 파악해서 5명 이상인 부서 정보 출력
-- 영업부 7
-- 총무부 5


SELECT buseo, COUNT(*) cnt
FROM insa
WHERE MOD( SUBSTR(ssn, 8, 1 ), 2 ) = 0
GROUP BY buseo;


--[문제] emp 테이블에서 부서별, jpb별 사원의 총급여합 조회

SELECT deptno, job
    , COUNT(*) cnt
    , SUM( sal+NVL(comm,0) ) deptno_pay_sum
    , AVG( sal+NVL(comm,0) ) deptno_pay_avg
    , MAX( sal+NVL(comm,0) ) deptno_pay_max
    , MIN( sal+NVL(comm,0) ) deptno_pay_min
FROM emp
GROUP BY deptno, job
ORDER BY deptno, job;


--(암기) Oracle 10g PARTITION OUTER JOIN
WITH t AS (
        SELECT DISTINCT job
        FROM emp
           )
SELECT deptno, t.job, SUM(sal+NVL(comm,0)) d_j_pay
FROM t LEFT OUTER JOIN emp e ON t.job = e.job
GROUP BY deptno, t.job
ORDER BY deptno;


--[ GROUPING SETS 절]
SELECT deptno, COUNT(*)
FROM emp
GROUP BY deptno;


SELECT job, COUNT(*)
FROM emp
GROUP BY job;


SELECT deptno, job, COUNT(*)
FROM emp
GROUP BY GROUPING SETS(deptno, job);





-- ( 암기 )
SELECT d.deptno
        ,NVL(LISTAGG(ename, ',') WITHIN GROUP( ORDER BY ename),'사원이 존재하지 않습니다') 사원목록 --ename의 LIST 목록 집합
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

--[정규 표현식 오라클 함수]

SELECT *
FROM insa
WHERE REGEXP_LIKE (ssn, '7\d');
WHERE ssn LIKe '7%'; --와일드카드( % _ )




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

--[문제] emp 테이블에서
--      각 사원을 급여별 전체 순위, 부서내 순위를 출력

SELECT deptno, ename, sal
    ,RANK() OVER(ORDER BY sal DESC) 전체순위
    ,RANK() OVER(PARTITION BY deptno ORDER BY sal DESC) 부서내순위
FROM emp
ORDER BY deptno;



--[ROLLU/CUBE 연산자]
--INSA 테이블에서
-- 남자 사원수:31명
-- 여자 사원수:29명
-- 전체 사원수:60명

SELECT DECODE(MOD(SUBSTR(ssn,8,1),2),1,'남자사원수','여자사원수') GENDER
        , COUNT(*) CNT
FROM insa
GROUP BY MOD(SUBSTR(ssn,8,1),2)
UNION ALL
SELECT '전체사원수', COUNT(*)
FROM insa;

SELECT DECODE(MOD(SUBSTR(ssn,-7,1),2),1,'남자',0,'여자','전체') || '사원수'GENDER
        , COUNT(*) CNT
FROM insa
GROUP BY CUBE( MOD(SUBSTR(ssn,-7,1),2))
ORDER BY gender;



SELECT buseo, jikwi
        , COUNT(*) CNT
--        , SUM(basicpay) 직급별급여합
FROM insa
GROUP BY buseo, ROLLUP(jikwi)
--GROUP BY ROLLUP(buseo, jikwi)
--GROUP BY CUBE(buseo, jikwi)
ORDER BY buseo;




--[문제] emp 테이블에서 가장 빨리 입사한 사원과 가장 늦게(최근)에 입사한 사원의 정보
--          왕고와 막내의 입사일차이


SELECT 
    MAX(hiredate)
    ,MIN(hiredate)
    , MAX(hiredate)-MIN(hiredate) 
FROM emp;

-- 내일 수업 !~~~~
-- [문제] insa 테이블에서 각 사원들의 만나이를 계산해서 출력...
--  1) 만나이 = 올해년도 - 생일년도      (생일지났지 여부 X   -1 )
--      ㄱ. 생일 지났는 여부
--      ㄴ. 981223-1XXXX
--                 12    1900   34  2000  89 1800
--  10분 풀어보시고~~ 



SELECT name,ssn, TRUNC((TO_DATE(SUBSTR(ssn, 1, 6), 'YYMMDD')-SYSDATE)/365) 만나이
FROM insa;



SELECT *
FROM insa;