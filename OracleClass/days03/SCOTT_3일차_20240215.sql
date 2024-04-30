--SCOTT
--[문제] insa 테이블에서 70년대생 출력
SELECT name, ssn
FROM insa
where ssn LIKE '7%';
--[문제] insa 테이블에서 12월생만 아래와 같이 출력
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

--[문제] insa 테이블에서 김씨 성을 가진 사원 모두 출력
SELECT name,ssn
FROM insa
WHERE name LIKE '김%';

--[문제] insa 테이블에서 김씨 성을 제외한 사원 모두 출력
SELECT name,ssn
FROM insa
WHERE name NOT LIKE '김%';
WHERE name LIKE '_김_'; --이름의 가운데 글자가 '김' 이면 출력
WHERE name LIKE '%김_'; --이름의 끝에서 두 번째 문자가 '김' 이면 출력
WHERE name LIKE '_김%'; --이름의 두 번째 문자가 '김' 이면 출력
WHERE name LIKE '%김%'; --이름 속에 '김' 문자가 있으면 출력

--출신도가 서울, 부산, 대구 이면서 전화번호에 5 또는 7이 포함된 자료 출력하되 부서명의 마지막 부는 출력되지 않도록함. (이름, 출신도, 부서명, 전화번호)

SELECT name, city, buseo
    , length(buseo)
    , tel 
    ,SUBSTR(buseo,1,length(buseo)-1)
FROM insa
WHERE CITY IN ('서울','부산','대구') AND TEL LIKE '%5%' OR TEL LIKE '%7%';

--
FROM 노트북테이블
WHERE 제조사컬럼 IN ('LG', '삼성', '레노버')
    AND
    CPU컬럼 IN ('코어i7-13세대','라이젠7(zen4)')
    ;
    --[LIKE 연산자의 ESCAPE 옵션 설명
    -- dept 테이블 구조 확인
    DESC dept;
    SELECT deptno, dname, loc
    FROM dept;
    
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON

-- SQL 5가지 : DQL, DDL, DML (INSERT UPDATE DELETE) + 완료COMMIT, 취소ROLLBACK
-- DCL, TCL

--DML의 INSERT 기능 사용해서 새로운 부서 추가
DESC dept;
INSERT INTO 테이블명 [(칼럼명, 칼럼명...)] VALUES (값,...);
COMMIT;

INSERT INTO dept (deptno, dname, loc) values ( 50,'CE100%T','SEOUL');
COMMIT;

SELECT*
FROM dept;
INSERT INTO dept values ( 50,'한글_나라','COREA');
INSERT INTO dept values ( 60,'한글_나라','COREA');
--[문제] dept 테이블에서 부서명 검색을 하는 데
--                    부서명에 _ 이 있는 부서정보를 조회
--                    부서명에 % 이 있는 부서정보를 조회

SELECT*
FROM dept
WHERE dname LIKE '%\_%' ESCAPE '\';
WHERE dname LIKE '%\%%' ESCAPE '\';

--DML(INSERT, [UPDATE], DELETE) + 완료COMMIT, 취소ROLLBACK
UPDATE [스키마].테이블명
SET 칼럼=값, 칼럼=값...
[WHERE 조건절;] -- 모든 레코드 수정

UPDATE scott.dept
SET LOC = 'XXX';

ROLLBACK;

UPDATE scott.dept
SET LOC = 'KOREA'
WHERE deptno = 60;

UPDATE scott.dept
SET LOC = 'COREA', DNAME='한글나라'
WHERE deptno = 60;

--30번 부서명, 지역멍 -> 60번 부서명, 지역명으로 UPDATE 하자
--SQL 오류: ORA-00936: missing expression
UPDATE scott.dept
SET DNAME=(SELECT dname FROM dept WHERE deptno=30), LOC = (SELECT loc FROM dept WHERE deptno=30)
WHERE deptno = 60;

--SQL 오류: ORA-00927: missing equal sign
UPDATE scott.dept
SET (DNAME, loc)=(SELECT dname, loc FROM dept WHERE deptno=30)
WHERE deptno = 60;
COMMIT;

----DML(INSERT, UPDATE, [DELETE]) + 완료COMMIT, 취소ROLLBACK
DELETE FROM [스키마.]테이블명
[WHERE 조건절;] -- 모든레코드 삭제

--ORA-02292: integrity constraint (SCOTT.FK_DEPTNO) violated - child record found
DELETE FROM dept
WHERE deptno IN(50,60);

WHERE deptno = 50 OR deptno = 60

SELECT *
FROM dept;

SELECT*
FROM emp;


--[문제] emp테이블에서 sal의 10%를 인상해서 새로운 sal로 수정
SELECT*
FROM emp;

UPDATE emp
SET sal = sal*1.1;
SET sal = sal+(sal/10);
ROLLBACK;

--LIKE SQL 연산자 : % _ 패턴 기호
--REGEXP_LIKE 함수 : 정규표현식
-- [문제] insa 테이블에서 성이 김씨, 이씨, 만 사원 조회
SELECT *
FROM insa
WHERE REGEXP_LIKE (name, '[경자]$');
WHERE REGEXP_LIKE (name, '^(김|이)');
WHERE REGEXP_LIKE (name, '^[김이]');
WHERE REGEXP_LIKE (name, '^[^김이]');

WHERE name LIKE '김%' OR name LIKE '이%';
WHERE SUBSTR(name,1,1) IN ('김', '이');
WHERE SUBSTR(name,1,1) = '김' OR SUBSTR(name,1,1) = '이';

--[문제] insa 테이블에서 70년대 남자 사원만 조회
SELECT *
FROM insa
WHERE REGEXP_LIKE (SSN,'^[7]...1');

SELECT deptno, ename, sal, comm, sal+NVL(comm,0)pay
FROM emp
WHERE deptno = 30 AND comm IS NULL
ORDER BY pay DESC;


--[NOT] LIKE SQL 연산자

--문자패턴 일치 검색 여부 체크하는 연산자
--와일드카드
--      0~여러개의 문자
--      한개의 문자
-- 와일드카드 ( % _ ) 를 일반 문자처럼 사용하려면 ESCAPE 옵션을 사용











--[문제] insa 테이블에서 사원명,주민등록번호 출력
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
    ,SUBSTR('abcdefg', 1,2)--ab 1 첫문자
    ,SUBSTR('abcdefg', 0, 2)--ab 0 첫문자
    ,SUBSTR('abcdefg', 3)
    
    ,SUBSTR('abcdefg', -5,3)--음수붙이면 뒤에서부터의 위치
    ,SUBSTR('abcdefg', -1,1)
FROM dual;










--[문제] emp 테이블에서 입사일자(hiredate)가 81년도인 사원 정보 조회
--2번풀이 DATE->입사년도만 얻어오기

--오늘 날짜의 연 월 일 출력   : DATE(초), TIMESTAMP(나노세컨드,시간대)
--자바 : Date d = new Date(); Calendar c = Calendar.getInstance();
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

--1번풀이 (비교연산자쓰기)
SELECT ename, hiredate
FROM emp
WHERE hiredate BETWEEN '81/01/01' AND '81/12/31';

