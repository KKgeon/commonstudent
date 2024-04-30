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

--Table TBL_BONUS이(가) 생성되었습니다.

insert into tbl_bonus(id)(select e.id from tbl_emp e);
--3개 행 이(가) 삽입되었습니다.
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
    
    --병합 2)
    
    
    
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

--병합: tbl_merge1(소스) -> tbl_merge2(타겟) 병합
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

--제약조건
SELECT *
FROM tbl_merge2;

--scott이 소유하고 있는 테이블 조회
SELECT *
FROM user_tables;
--scott이 소유하고 있는 제약조건 조회
SELECT *
FROM user_constraints;
--scott이 소유하고 있는 emp 테이블에 설정된 제약조건만 조회
SELECT *
FROM user_constraints
WHERE table_name = UPPER('emp');

--제약조건은 테이블에 INSERT/UPDATE/DELETE 할떄의 규칙으로 사용
--              데이터 무결성을 위해


UPDATE emp
SET empno = 90
WHERE empno = 7369;
--도메인 무결성

DESC emp;

INSERT INTO emp (empno) VALUES (9999);
INSERT INTO emp (empno) VALUES ('admin');
SELECT * FROM emp;
ROLLBACK;
--
---- 제약조건을 생성하는 시기에 따라
--ㄱ. CREATE TABLE 문 테이블 생성 + 제약조건 추가/삭제
--
--    1) IN-LINE 제약조건 (==컬럼 레벨) 제약조건 설정 방법
--        ㄴ NOT NULL 제약조건 설정
--    2) OUT-OF-LINE 제약조건 (==테이블 레벨) 제약조건 설정 방법
--        ㄴ 두 개 이상의 컬럼에 하나의 제약조건을 설정할 때..
--        
--        (사원 급여 지급 테이블)
--        급여지급날짜 회원ID 급여액 ..
--        20240125    9369
--ㄴ. ALTER TABLE 문 테이블 수정 + 제약조건 추가/삭제

DESC dept;


SELECT *
FROM emp;
WHERE ename = 'KING';

UPDATE emp
SET deptno = NULL
WHERE empno='7839';

COMMIT;

--실습) CREATE TABLE문에서 칼럼레벨 방식으로 제약조건 설정하는 예
DROP TABLE tblconstraint1;
CREATE TABLE tblconstraint1
(   
    empno number(4) NOT NULL CONSTRAINT PK_tblconstraint1_empno PRIMARY KEY
    , ename VARCHAR2(20) NOT NULL
    , deptno NUMBER(2) CONSTRAINT FK_tblconstraint1_deptno REFERENCE dept(deptno)
    , email VARCHAR2(150) CONSTRAINT UK_tblconstraint1_email UNIQUE
    , kor NUMBER(3) CONSTRAINT CK_tblconstraint1_kor CHECK(kor BETWEEN 0 AND 100)
    , city VARCHAR2(20) CONSTRAINT CK_tblconstraint1_city CHECK(city IN ('서울','대구','대전'))
);

CREATE TABLE tblconstraint1
(   
    empno number(4) NOT NULL CONSTRAINT PK_tblconstraint1_empno PRIMARY KEY,
    ename VARCHAR2(20) NOT NULL,
    deptno NUMBER(2),
    CONSTRAINT FK_tblconstraint1_deptno FOREIGN KEY (deptno) REFERENCES dept(deptno),
    email VARCHAR2(150) CONSTRAINT UK_tblconstraint1_email UNIQUE,
    kor NUMBER(3) CONSTRAINT CK_tblconstraint1_kor CHECK(kor BETWEEN 0 AND 100),
    city VARCHAR2(20) CONSTRAINT CK_tblconstraint1_city CHECK(city IN ('서울', '대구', '대전'))
);

--TABLE TBL_CONSTRAINT이(가) 생성되었습니다.
SELECT *
FROM user_constraints
WHERE table_name LIKE '%CONSTR%';

--제약조건 활성화/비활성화
--city 서울 대구 대전 체크제약조건


ALTER TABLE tblconstraint1
DISABLE CONSTRAINT CK_tblconstraint1_city (CASCADE);





--실습 CREATE UABLE 문에서 테이블 방식으로 제약조건 설정하는 예
CREATE TABLE tblconstraint2
(   
    empno number(4) NOT NULL -- NOT NULL은 칼럼레벨추가밖에못함
    ename VARCHAR2(20) NOT NULL
    , deptno NUMBER(2) CONSTRAINT FK_tblconstraint1_deptno REFERENCES dept(deptno)
    , email VARCHAR2(150) CONSTRAINT UK_tblconstraint1_email UNIQUE
    , kor NUMBER(3) CONSTRAINT CK_tblconstraint1_kor CHECK(kor BETWEEN 0 AND 100)
    , city VARCHAR2(20) CONSTRAINT CK_tblconstraint1_city CHECK(city IN ('서울', '대구', '대전'))
--  , CONSTRAINT PK_tblconstraint1_empno PRIMARY KEY(empno,ename) 복합키
    , CONSTRAINT PK_tblconstraint1_empno PRIMARY KEY(empno)
    , CONSTRAINT PK_tblconstraint1_deptno FOREIGN KEY(empno) REFERENCES dept(deptno)
    , 
);

DROP TABLE tblconstraint1;
DROP TABLE tblconstraint2;

--실습3) ALTER TABLE 문에서 제약조건 설정하는 예
CREATE TABLE tbl_constraint3
(
    empno NUMBER(4)
    , ename VARCHAR2(20)
    , deptno NUMBER(2)
);
--Table TBL_CONSTRAINT3이(가) 생성되었습니다.
ALTER TABLE 테이블명
	ADD [CONSTRAINT 제약조건명] 제약조건타입 (컬럼명);


--1) empno 칼럼에 PK 제약조건 추가...
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
--    deptno NUMBER(2) C 제약 (F K(deptno) R d(deptno) ON DELETE CASCADE
    deptno NUMBER(2) C 제약 (F K(deptno) R d(deptno) ON DELETE SET NULL
);

-- ON
--1) emp -> tbl_emp 생성
--empno에 PK 제약조건 추가
CREATE TABLE tbl_emp 
AS
(SELECT * FROM emp);

ALTER TABLE tbl_emp
ADD CONSTRAINT PK_emp_empno PRIMARY KEY(empno);
--2) dept -> tbl_dept 생성
--deptno에 PK 제약조건 추가

CREATE TABLE tbl_dept 
AS
(SELECT * FROM dept);

ALTER TABLE tbl_dept 
ADD CONSTRAINT PK_dept_deptno PRIMARY KEY(deptno);

--문제 tbl_emp 테이블에 deptno 컬럼에 FX 설정 + ON DELETE CASCADE 옵션을 추가.
ALTER TABLE tbl_emp
ADD CONSTRAINT PK_tbl_emp_deptno FOREIGN KEY(deptno)
                                 REFERENCES tbl_dept(deptno)
                                 ON DELETE CASCADE;
                                 
ALTER TABLE tbl_emp
ADD CONSTRAINT PK_tblemp_deptno FOREIGN KEY(deptno)
                                 REFERENCES tbl_dept(deptno)
                                 ON DELETE SET NULL;
--Table TBL_EMP이(가) 변경되었습니다.

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



-- JOIN(조인) --

CREATE TABLE book(
       b_id     VARCHAR2(10)    NOT NULL PRIMARY KEY   -- 책ID
      ,title      VARCHAR2(100) NOT NULL  -- 책 제목
      ,c_name  VARCHAR2(100)    NOT NULL     -- c 이름
     -- ,  price  NUMBER(7) NOT NULL
 );
-- Table BOOK이(가) 생성되었습니다.
INSERT INTO book (b_id, title, c_name) VALUES ('a-1', '데이터베이스', '서울');
INSERT INTO book (b_id, title, c_name) VALUES ('a-2', '데이터베이스', '경기');
INSERT INTO book (b_id, title, c_name) VALUES ('b-1', '운영체제', '부산');
INSERT INTO book (b_id, title, c_name) VALUES ('b-2', '운영체제', '인천');
INSERT INTO book (b_id, title, c_name) VALUES ('c-1', '워드', '경기');
INSERT INTO book (b_id, title, c_name) VALUES ('d-1', '엑셀', '대구');
INSERT INTO book (b_id, title, c_name) VALUES ('e-1', '파워포인트', '부산');
INSERT INTO book (b_id, title, c_name) VALUES ('f-1', '엑세스', '인천');
INSERT INTO book (b_id, title, c_name) VALUES ('f-2', '엑세스', '서울');

COMMIT;

SELECT *
FROM book;




-- 단가테이블( 책의 가격 )
CREATE TABLE danga(
       b_id  VARCHAR2(10)  NOT NULL  -- PK , FK   (식별관계 ***)
      ,price  NUMBER(7) NOT NULL    -- 책 가격
      
      ,CONSTRAINT PK_dangga_id PRIMARY KEY(b_id)
      ,CONSTRAINT FK_dangga_id FOREIGN KEY (b_id)
              REFERENCES book(b_id)
              ON DELETE CASCADE
);
-- Table DANGA이(가) 생성되었습니다.
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



-- 책을 지은 저자테이블
 CREATE TABLE au_book(
       id   number(5)  NOT NULL PRIMARY KEY
      ,b_id VARCHAR2(10)  NOT NULL  CONSTRAINT FK_AUBOOK_BID
            REFERENCES book(b_id) ON DELETE CASCADE
      ,name VARCHAR2(20)  NOT NULL
);

INSERT INTO au_book (id, b_id, name) VALUES (1, 'a-1', '저팔개');
INSERT INTO au_book (id, b_id, name) VALUES (2, 'b-1', '손오공');
INSERT INTO au_book (id, b_id, name) VALUES (3, 'a-1', '사오정');
INSERT INTO au_book (id, b_id, name) VALUES (4, 'b-1', '김유신');
INSERT INTO au_book (id, b_id, name) VALUES (5, 'c-1', '유관순');
INSERT INTO au_book (id, b_id, name) VALUES (6, 'd-1', '김하늘');
INSERT INTO au_book (id, b_id, name) VALUES (7, 'a-1', '심심해');
INSERT INTO au_book (id, b_id, name) VALUES (8, 'd-1', '허첨');
INSERT INTO au_book (id, b_id, name) VALUES (9, 'e-1', '이한나');
INSERT INTO au_book (id, b_id, name) VALUES (10, 'f-1', '정말자');
INSERT INTO au_book (id, b_id, name) VALUES (11, 'f-2', '이영애');

COMMIT;

SELECT * 
FROM au_book;


-- 고객
-- 판매       

 CREATE TABLE gogaek(
      g_id       NUMBER(5) NOT NULL PRIMARY KEY 
      ,g_name   VARCHAR2(20) NOT NULL
      ,g_tel      VARCHAR2(20)
);

 INSERT INTO gogaek (g_id, g_name, g_tel) VALUES (1, '우리서점', '111-1111');
INSERT INTO gogaek (g_id, g_name, g_tel) VALUES (2, '도시서점', '111-1111');
INSERT INTO gogaek (g_id, g_name, g_tel) VALUES (3, '지구서점', '333-3333');
INSERT INTO gogaek (g_id, g_name, g_tel) VALUES (4, '서울서점', '444-4444');
INSERT INTO gogaek (g_id, g_name, g_tel) VALUES (5, '수도서점', '555-5555');
INSERT INTO gogaek (g_id, g_name, g_tel) VALUES (6, '강남서점', '666-6666');
INSERT INTO gogaek (g_id, g_name, g_tel) VALUES (7, '강북서점', '777-7777');

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
-- [문제] 책ID, 책제목, 출판사(c_name), 단가 칼럼 출력....

--프라이머리 키? 포린 키?
--book : b_id(PK), title, c_name
--danga : b_id(PK,FK) [price]
    
-- ㄱ.  오라클에선 natural join 이라고 부른다.
    SELECT book.b_id, title, c_name, price
    FROM book, danga
    WHERE book.b_id = danga.b_id; -- 조인조건 = ,
    
-- ㄴ.
    SELECT b.b_id, title, c_name, price
    FROM book b, danga d
    WHERE b.b_id = d.b_id;
-- ㄷ.
    SELECT b.b_id, title, c_name, price
    FROM book b JOIN danga d ON b.b_id = d.b_id;
-- ㄹ. USING 절 사용 : book.b_id(객체명.컬러명)X, b.b_id(별칭명.컬럼명)X
    SELECT b_id, title, c_name, price
    FROM book JOIN danga USING (b_id);
-- ㅁ    
    SELECT b_id, title, c_name, price
    FROM book NATURAL JOIN danga;
    
    
--book: b_id, title
--danga : price
--gogaek : g_name
--panmai : p_su



    
--[문제] 책ID, 책제목, 판매수량, 단가, 서점명, 판매금액출력 = 단가 * 판매수량
-- ㄱ. 위의 ㄱ,ㄴ 방법으로 풀기
SELECT b.b_id, title, price, g_name, p_su * price AS 판매금액
FROM book b, panmai p, gogaek g, danga d
WHERE b.b_id = p.b_id AND p.g_id = g.g_id AND b.b_id = d.b_id;
-- ㄴ. JOIN-ON 구문 풀기
SELECT b.b_id, title, price, g_name, p_su * price AS 판매금액
FROM book b JOIN panmai p ON b.b_id = p.b_id JOIN gogaek g ON p.g_id = g.g_id JOIN danga d ON b.b_id = d.b_id;
-- ㄷ. USING 절 사용해서 풀기
SELECT b_id, title, price, g_name, p_su * price AS 판매금액
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
--ㄱ. LEFT OUTER JOIN
SELECT d.deptno, ename, hiredate
FROM dept d LEFT OUTER JOIN emp e ON d.deptno = e.deptno;
--
SELECT d.deptno, ename, hiredate
FROM dept d, emp e 
WHERE d.deptno = e.deptno(+);

--ㄴ. RIGHT OUTER JOIN
SELECT d.deptno, ename, hiredate
FROM dept d RIGHT OUTER JOIN emp e ON d.deptno = e.deptno;

SELECT d.deptno, ename, hiredate
FROM dept d, emp e 
WHERE d.deptno(+) = e.deptno;
--ㄷ. FULL OUTER JOIN
SELECT d.deptno, ename, hiredate
FROM dept d FULL OUTER JOIN emp e ON d.deptno = e.deptno;





--SELF JOIN
--사원번호, 사원명, 입사일자, 직속상사사원번호, 직속상사의사원명

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






-- 문제) 책ID, 책제목, 판매수량, 단가, 서점명(고객), 판매금액(판매수량*단가) 출력 
SELECT p.b_id, title, p_su, price, g.g_name, p_su * price 판매수량
FROM danga d, panmai p, book b, gogaek g
WHERE d.b_id = p.b_id AND d.b_id = b.b_id AND g.g_id = p.g_id;




-- 문제) 출판된 책들이 각각 총 몇권이 판매되었는지 조회     
--      (    책ID, 책제목, 총판매권수, 단가 컬럼 출력   )

SELECT b.b_id, b.title,  SUM(p_su), d.price
FROM panmai p, book b, danga d
WHERE p.b_id = b.b_id AND b.b_id = d.b_id
GROUP BY b.b_id, b.title, d.price ;


SELECT b.b_id, title, price, SUM(p_su)
FROM book b JOIN panmai p ON b.b_id = p.b_id
            JOIN danga d ON b.b_id = d.b_id
GROUP BY b.b_id, title, price
ORDER BY b.b_id;

-- 문제) 판매권수가 가장 많은 책 정보 조회 

WITH t
AS 
  (
  SELECT b.b_id, title , price, SUM( p_su )  총판매권수
 FROM  book b JOIN  panmai p ON b.b_id = p.b_id
              JOIN danga d ON  b.b_id = d.b_id
 GROUP BY   b.b_id, title , price
 ORDER BY  b.b_id
 ), 
 s AS (
 SELECT t.*
   , RANK() OVER( ORDER BY  총판매권수 DESC ) 판매순위
 FROM t
 )
 SELECT s.*
 FROM s
 WHERE 판매순위 = 1;




-- 문제) 올해 판매권수가 가장 많은 책(수량을 기준으로)
--      (  책ID, 책제목, 수량 )


--
-- 문제) book 테이블에서 판매가 된 적이 없는 책의 정보 조회

-- 문제) book 테이블에서 판매가 된 적이 있는 책의 정보 조회
--      ( b_id, title, price  컬럼 출력 )


SELECT DISTINCT b.b_id, title
FROM book b, panmai p
WHERE b.b_id = p.b_id;
-- 문제) 고객별 판매 금액 출력 (고객코드, 고객명, 판매금액)

-- 문제) 년도, 월별 판매 현황 구하기

-- 문제) 서점별 년도별 판매현황 구하기

-- 문제) 책의 총판매금액이 15000원 이상 팔린 책의 정보를 조회
--      ( 책ID, 제목, 단가, 총판매권수, 총판매금액 )


FROM emp

