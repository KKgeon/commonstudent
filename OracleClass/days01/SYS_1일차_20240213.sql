-- 주석처리             Ctrl + /
-- 모든 사용자 계정 조회
-- 절은 대개 줄을 나누어쓰도록 권한다. (권장)
-- keyword(예약어)는 대문자로 입력하도록 권한다.(권장)
-- 테이블명, 컬럼명은 소문자 사용(권장)
-- 가독성 (탭, 줄맞춤) 권장
--SELECT *
--FROM all_users; -- Ctrl + Enter, F5

--select * From ALL_USERS; -- Ctrl + Enter, F5
-- 대소문자 구분안해도 작동됨

-- 수업 중에 사용할 계정 생성, 수정, 삭제 --
-- 1) SCOTT 계정 생성, 수정, 삭제
--  (1) SCOTT 계정 유무 확인
SELECT *
FROM all_users;
CREATE USER SCOTT IDENTIFIED BY tiger;

ALTER USER HR IDENTIFIED BY lion;
ALTER USER HR ACCOUNT UNLOCK;
GRANT dba TO HR;
--  (2) SCOTT 계정 생성 p153
ALTER USER SCOTT IDENTIFIED BY 1234;
-- (3) SCOTT 계정 비밀번호 1234 수정
DROP USER SCOTT CASCADE;

-- SYS 최고관리자 계정이 CREATE SESSION  데이터베이스 접속(연결) 시스템 권한을 SCOTT 계정에 부여.
GRANT CREATE SESSION TO SCOTT;


GRANT CREATE SESSION TO student_role;
GRANT student_role TO SCOTT;

GRANT CONNECT, RESOURCE TO SCOTT;
--DDL(CREATE, DROP, ALTER)

--CREATE USER, DROP USER, ALTER USER
--CREATE TABLESPACE, DROP TABLESPACER, ALTER TABLESPACE
--CREATE ROLE, DROP ROLE, ALTER ROLE


-- (문제) 오라클 설치 시에 미리 정의된 롤(role) 확인하는 쿼리(sql)를 작성하세요
SELECT *
FROM dba_roles;

SELECT grantee,privilege 
FROM DBA_SYS_PRIVS 
WHERE grantee = 'CONNECT'; 


--SCOTT 계정+샘플 테이블 추가
C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\scott.sql

SELECT *
FROM dba_tables;

--COUNT() 오라클 함수 2551개 있다고 나옴

SELECT COUNT(*)
SELECT *
FROM dictionary;



--SYS--

CREATE USER madang IDENTIFIED BY madang DEFAULT TABLESPACE users TEMPORARY
TABLESPACE temp PROFILE DEFAULT;
GRANT CONNECT, RESOURCE TO madang;
GRANT CREATE VIEW, CREATE SYNONYM TO madang;
GRANT UNLIMITED TABLESPACE TO madang;

-- madang 계정 생성 확인
SELECT *
FROM dba_users;
FROM all_users;

--HR 계정 확인 --
1) HR 계정의 비밀번호를 lion으로 수정하고
2) + 새 접속 클릭
3) HR 계정이 소요하고 있는 테이블 목록을 조회...
