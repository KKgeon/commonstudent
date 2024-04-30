--SCOTT
--[SET 집합 연산자]
--1) 합집합(UNION, UNION ALL)
SELECT name, city, buseo
FROM insa 
WHERE buseo = '개발부' --14
--UNION--6명은 중복된다
UNION ALL --23명
SELECT name, city, buseo
FROM insa 
WHERE city= '인천'; --9명

--2) 차집합(MINUS)
SELECT name, city, buseo
FROM insa 
WHERE buseo = '개발부' --14
MINUS
SELECT name, city, buseo
FROM insa 
WHERE city= '인천'; --9명

--3) 교집합(INTERSECT)
--[2]
SELECT name, city, buseo
FROM insa 
WHERE buseo = '개발부' --14
INTERSECT
SELECT name, city, buseo
FROM insa 
WHERE city= '인천'; --9명

--[1]
SELECT name, city, buseo
FROM insa
WHERE buseo = '개발부' AND city = '인천';


--(SET (집합) 연산자를 사용할 때 주의할 점)

--ORA-01790: expression must have same datatype as corresponding expression
--ORA-01789: query block has incorrect number of result columns
SELECT name, city, buseo
FROM insa 
WHERE buseo = '개발부' --14
UNION ALL --23명
SELECT name, city  --, basicpay
FROM insa 
WHERE city= '인천'; --9명
-- insa 테이블의 사원 정보 + emp 테이블의 사원 정보를 모두 출력
SELECT buseo, num, name, ibsadate, basicpay, sudang
FROM insa
UNION ALL
SELECT TO_CHAR(deptno), empno, ename, hiredate, sal,comm
FROM emp;



--MULTIST
--MULTIST
--MULTIST

--[계층적 질의 연산자]
--PRIOR CONNECT_BY_ROOT

--[연결 연산자] ||

--[산술 연산자] + - / *
--              나머지 구하는 연산자는 없다
--              나머지 구하는 함수 MOD(5,3) = 5/3의 나머지 **** 5-3*FLOOR(5/3)
--              나머지 구하는 함수 REMINDER(5,3) = 5/3의 나머지 5-3*ROUND(5/3)
SELECT 
    --  10/0 --ORA-01476: divisor is equal to zero
    --  'A'/2--ORA-01722: invalid number
    MOD(10,0)
FROM dual;





--오라클 함수
-- 1. 복잡한 쿼리문을 간단하게 해주고 데이ㅓ의 값을 조작하는데 사용되는 것.
-- 2. 종류 : 단일행 함수, 복수행 함수

SELECT LOWER (ename)
FROM emp;

SELECT COUNT(*)
FROM emp;

--(숫자 함수)--
--1) ROUND(numver) 숫자값을 특정 위치에서 (반올림)하여 리턴한다
SELECT 3.141592
    , ROUND(3.141592) a    --소숫점 첫 번째 자리에서 반올림...
    , ROUND(3.141592, 0) b --n을 생략한 경우와 같다
    , ROUND(3.141592, 2) c --소숫점 세 번째 자리에서 반올림...
    , ROUND(1234.5678, 2) d
    , ROUND(1234.5678, -1) e
    , ROUND(1234.5678, -2) f
    , ROUND(1234.5678, -3) g
FROM dual;


-- [문제] emp 테이블에서 pay, 평균급여, 총급여의합, 사원수 출력
-- ORA-00937: not a single-group group function
SELECT emp.* 
    , sal+NVL(comm,0) pay
--    , COUNT(*)
    , (SELECT COUNT(*)
       FROM emp) total_cnt
    , (SELECT SUM (sal + NVL(comm,0))
       FROM emp ) total_pay
    , (SELECT ROUND(AVG (sal + NVL(comm,0)),2)
       FROM emp ) avg_pay   --평균급여 계산해서 소수점 2자리까지 출력
FROM emp;
--GROUP BY ;



--집계함수

SELECT COUNT(*)
      , COUNT(empno)
      , COUNT(deptno)
      , COUNT(sal)
      , COUNT(hiredate)      
      , COUNT(comm)
FROM emp;

-- 평균 커미션 ? 
SELECT AVG(comm)--550
FROM emp;

SELECT SUM(comm)/COUNT(*) --183.333333333333333333333333333333333333
    , SUM(comm)/COUNT(comm)
FROM emp;


-- TRUNC(날짜+숫자), FLOOR(숫자) 절삭하는 2가지 함수
-- 차이점 : 
--        TRUNC(날짜+숫자)는 특정 위치에서 절삭 가능
--        FLOOR(숫자)는 소수점 첫번째 자리에서 절삭만 가능
SELECT 3.141592
    ,TRUNC(3.141592)
    ,TRUNC(3.141592, 0)
    ,FLOOR(3.141592)
    ,TRUNC(3.141592, 3)
    ,FLOOR(3.141592*1000 ) /1000
    ,TRUNC(3.141592, -1)
FROM dual;



-- CELL () 숫자값을 소숫점 첫째자리에서 절삭하여 정수값을 리턴한다.
SELECT CEIL(3.14), CEIL(3.54)
FROM dual;

--3.141592를 소수점 세 번째 자리에서 올림하자
SELECT CEIL(3.141592*100)/100
FROM dual;



--총 페이지 수를 계산할 때 올림함수 사용
--총게시글(사원)수 : 
-- 한 페이지에 출력할 게시글(사원)수:
SELECT COUNT(*) FROM emp;
SELECT CEIL (( SELECT COUNT(*) FROM emp)/5) 총페이지수
FROM dual;


SELECT *
FROM emp
ORDER BY sal+NVL(comm,0) DESC;


-- ABS() 절댓값 구하는 함수
SELECT ABS(100), ABS(-100)
FROM dual;

-- SIGN() 숫자값의 부호에 따라 1,0,-1의 값으로 리턴한다.
SELECT SIGN(100), SIGN(0), SIGN(-100)
FROM dual;

--[문제] emp 테이블의 평균 급여를 구해서
-- 각 사원의 급여가 평균급여보다 많으면 "평균급여보다 많다"라고 출력하고
--                            적으면 "평균급여보다 적다" 라고 출력



--2260.416666666666666666666666666666666667
--[평균 급여]
SELECT AVG(sal+NVL(comm,0)) avg_pay
FROM emp;

--[2]
SELECT ename, sal+NVL(comm,0)pay
        ,(SELECT AVG(sal+NVL(comm,0)) avg_pay FROM emp) avg_pay
        , SIGN( sal+NVL(comm,0-(SELECT AVG(sal+NVL(comm,0)) avg_pay FROM emp) ))
FROM emp;


-- [1]
SELECT s.*, '많다'
FROM emp s
WHERE sal+NVL(comm,0) < (SELECT AVG(sal+NVL(comm,0)) avg_pay
                        FROM emp)
UNION
SELECT s.*, '적다'
FROM emp s
WHERE sal+NVL(comm,0) > (SELECT AVG(sal+NVL(comm,0)) avg_pay
                        FROM emp);
                        
                        
                        
--POWER(), SQRT()
SELECT power(2,3), power(2,-3)
    , SQRT(2)
FROM dual;


--

--[문자 함수]--
--INSTR() == JAVA indexOf(), lastIndexof()함수와 기능 같음
SELECT instr('corea','e')
FROM dual;




select instr('corporate floor','or',3,2) 
from dual;

SELECT
    INSTR('corporate floor', 'or')      --2
    , INSTR('corporate floor', 'or',3,2) --14
    , INSTR('corporate floor', 'or',-3,2) --2       뒤에서 3번째에서 2번째 오는 or 문자 (존나복잡하네..)
FROM dual;



SELECT '02-123-5678' tel 
    , INSTR('02-1234-5678', '-') "첫번째 - 위치"  -- 3
    , INSTR('02-1234-5678', '-', -1 ) "두번째 - 위치" -- 8
    , SUBSTR('02-1234-5678', 1, INSTR('02-1234-5678', '-')-1) a  -- 010
    , SUBSTR('02-1234-5678', INSTR('02-1234-5678', '-')+1
         , INSTR('02-1234-5678', '-', -1 )-1 - (INSTR('02-1234-5678', '-')+1)     ) b -- 1234
    , SUBSTR('02-1234-5678', INSTR('02-1234-5678', '-',-1)+1,4) c -- 5678
FROM dual;




DESC tbl_tel;


SELECT*
FROM tbl_tel;


INSERT INTO tbl_tel (tel, name) VALUES ('063)469-4567', '큰삼촌');
INSERT INTO tbl_tel (tel, name) VALUES ('052)1456-2367', '둘째삼촌');
COMMIT;
-- 지역번호 / 앞자리 전화번호/ 뒷자리 전화번호

SELECT name, tel
    , INSTR (tel, ')') ")위치"
    , INSTR (tel, '-') "-위치"
    , SUBSTR(tel, 1, INSTR (tel, ')')-1) "지역번호 )-1"
    , SUBSTR(tel, INSTR (tel, ')')+1, INSTR (tel, '-')-INSTR (tel, ')')-1 ) "앞자리"
    , SUBSTR(tel, INSTR (tel, '-')+1) "뒷자리"
FROM tbl_tel;


--

SELECT ename, pay
    , RPAD (pay,10,'*')
    , LPAD (pay,10)
    , LPAD (pay,10,'*')
FROM (
        SELECT ename, sal + NVL(comm,0)pay
        FROM emp
        ) t;



--ASCII()
SELECT ename
    , SUBSTR(ename,1,1)
    , ASCII( SUBSTR(ename,1,1) )
    , CHR ( ASCII( SUBSTR(ename,1,1) ) )
FROM emp;


--
SELECT ASCII('A'), ASCII('a'), ASCII('0')
FROM dual;

-- GREATEST(), LEAST() 나열된 숫자, 문자 줒ㅇ에 가장 큰, 작은 값을 리턴하는 함수

SELECT GREATEST(3, 5, 2, 4, 1)
     , GREATEST('R', 'A', 'Z', 'X' )
     , LEAST(3, 5, 2, 4, 1)
     , LEAST('R', 'A', 'Z', 'X' )
FROM dual;
--VSIZE()

SELECT ename
    , VSIZE(ename)
    , VSIZE('홍길동') --9 byte
    , VSIZE('a')
    , VSIZE('한')
FROM emp;


--숫자 함수
--문자 함수
--날짜 함수

SELECT SYSDATE -- '24/02/19'        초
    , ROUND(SYSDATE) a -- 일 반올림 / 정오를 기준으로 날짜 반올림이 된다.
    , ROUND(SYSDATE, 'DD') b -- 일 반올림 / 정오를 기준으로 날짜 반올림이 된다.
    , ROUND(SYSDATE, 'MONTH') c -- 월 반올림 / 그 달의 15일 기준으로 이상
    , ROUND(SYSDATE, 'YEAR') d -- 년 반올림
FROM dual;

-- 날짜의 절삭함수 : TRUNC()
SELECT SYSDATE
    , TO_CHAR(SYSDATE, 'YYYY.MM.DD HH.MI.SS') a --2024.02.19 03.38.43
    , TRUNC( SYSDATE )
    , TO_CHAR(TRUNC( SYSDATE ), 'YYYY.MM.DD HH.MI.SS') b
FROM dual;


SELECT ename
    ,hiredate
    ,SYSDATE
    ,TRUNC(SYSDATE+1) - TRUNC(hiredate)
FROM emp;


SELECT SYSDATE
    , TO_CHAR(SYSDATE, 'YYYY.MM.DD HH24.MI.SS')
    , SYSDATE + 2/24 -- 2시간
    , TO_CHAR(SYSDATE + 2/24, 'YYYY.MM.DD HH24.MI.SS')
FROM dual;

--[문제] 24년 2월 마직말 날짜 몇 일 까지 ?

SELECT SYSDATE -- 24/02/19
    --,  TRUNC ( SYSDATE, 'DD' ) 시간, 분, 초 절삭
    , TRUNC (SYSDATE, 'MONTH' ) b
    ,TO_CHAR(ADD_MONTHS(TRUNC (SYSDATE, 'MONTH' ),1)-1,'DD')
FROM dual;
--[문제] 24년 2월 마지막 날짜 몇 일까지 ? 
-- [2] LAST_DAY() 함수
SELECT SYSDATE
    -- 매개변수 날짜의 마지막 날짜를 반환하는 함수
    ,LAST_DAY(SYSDATE) -- 24/02/29
    ,TO_CHAR(LAST_DAY(SYSDATE),'DD')
FROM dual;



--[문제] 개강일로부터 오늘날짜까지 일수?
-- 2023.12.29

--[문제] 수료일까지 오늘날짜부터 남은 일수?
-- 2024.06.14
SELECT SYSDATE
        , TO_DATE('2023-12-29', 'YYYY-MM-DD')
        , CEIL(SYSDATE - TO_DATE('2023-12-29', 'YYYY-MM-DD'))
        , ABS( CEIL(SYSDATE-TO_DATE('2024-06-14', 'YYYY-MM-DD')))
FROM dual;

--NEXT_DAY() 함수
SELECT SYSDATE
    , TO_CHAR(SYSDATE, 'YYYY/MM/DD (DY)') a
    , TO_CHAR(SYSDATE, 'YYYY/MM/DD (DAY)') b
    -- 가장 가까운 금요일날 약속하자
    , NEXT_DAY(SYSDATE, '금')
    , NEXT_DAY(SYSDATE, '월')
FROM dual;

--[문제] 4월 첫 번째 화요일 만나자 (약속)
SELECT TO_DATE('2024.04.01') ㄱ
   -- ,NEXT_DAY(TO_DATE('2024.04.01'),'화')
    , NEXT_DAY(TO_DATE('2024.04.01')-1,'월') ㄴ
FROM dual;

-- MONTH_BETWEEN() 두 날짜사이의 개월수 반환하는 함수
SELECT ename
    , hiredate
    , SYSDATE
    , CEIL(ABS(hiredate - SYSDATE)) 근무일수
    , MONTHS_BETWEEN(SYSDATE, hiredate) 근무개월수 --절대 변수를 따옴표없이 띄어쓰면않되!!!!!!!!!!!!
FROM emp;


-- [변환함수]
-- 1) TO_NUMBER() : 문자->숫자로 변환
SELECT '12'
        , TO_NUMBER('12')
        , 100-'12'
        , '100' - '12'
FROM dual;

-- 2) TO_CHAR (날짜, 숫자)
-- [문제] insa 테이블에서 pay를 세자리마다 콤마를 출력하고 앞에 통화기호를 붙이자
SELECT num, name
    , basicpay, sudang
    , basicpay + sudang pay
    , TO_CHAR(basicpay+ sudang, 'L9,999,999')
FROM insa;

SELECT 12345
    , TO_CHAR(12345) -- '12345'
    , TO_CHAR(12345, '9,999') -- #####
    , TO_CHAR(12345, '99,999') -- '12345'
    , TO_CHAR(12345, '99,999.00') -- '12345'
    , TO_CHAR(12345, '99,999.99') -- '12345'
    , TO_CHAR(12345.123, '99,999.00') -- '12345'
FROM dual;

