COMMIT;
DROP TABLE Administrator;
DROP TABLE Item;
DROP TABLE Vote;
DROP TABLE EDIT;
DROP TABLE MEMBER;
DROP TABLE SURVEY;
CREATE TABLE Member (
    user_id VARCHAR2(100) NOT NULL,
    user_name VARCHAR2(100) NOT NULL,
    user_email_address VARCHAR2(100) NOT NULL,
    user_birthday DATE DEFAULT sysdate NOT NULL,
    user_nickname VARCHAR2(100) NOT NULL,
    user_password VARCHAR2(100) NOT NULL
);

COMMENT ON COLUMN Member.user_id IS '투표자를식별할ID';
COMMENT ON COLUMN Member.user_name IS '회원의 이름';
COMMENT ON COLUMN Member.user_email_address IS '회원의 이메일 주소';
COMMENT ON COLUMN Member.user_birthday IS '회원의 생년월일';
COMMENT ON COLUMN Member.user_nickname IS '회원의 닉네임';
COMMENT ON COLUMN Member.user_password IS '회원의 비밀번호';

CREATE TABLE Vote (
    user_id VARCHAR2(100) NOT NULL,
    SURVEY_NUM NUMBER NOT NULL,
    COL_NUMBER NUMBER(1) NOT NULL,
    CHOICE_NUM NUMBER(1) DEFAULT 1 NOT NULL
);

CREATE TABLE Survey (
    SURVEY_NUM NUMBER NOT NULL,
    COL_NUMBER NUMBER(1) NOT NULL,
    TITLE VARCHAR2(50 CHAR) NOT NULL,
    START_DATE DATE DEFAULT SYSDATE NOT NULL,
    END_DATE DATE DEFAULT SYSDATE + 7 NOT NULL,
    WRITE_DATE DATE DEFAULT SYSDATE NOT NULL
);

CREATE TABLE Edit (
    SURVERY_NUM NUMBER NOT NULL,
    admin_id VARCHAR2(100) NOT NULL,
    COL_NUMBER NUMBER(1) NOT NULL
);

CREATE TABLE Administrator (
    admin_id VARCHAR2(100) NOT NULL,
    name VARCHAR2(100) NOT NULL,
    emailAddress VARCHAR2(100) NOT NULL,
    birthdate DATE DEFAULT sysdate NOT NULL,
    nickname VARCHAR2(80) NOT NULL,
    password VARCHAR2(100) NOT NULL
);

CREATE TABLE Item (
    CHO_NUM VARCHAR2(100) NOT NULL,
    SURVEY_NUM NUMBER NOT NULL,
    COL_NUMBER NUMBER(1) NOT NULL,
    CHOICE1 VARCHAR2(100) NOT NULL
);

ALTER TABLE Member ADD CONSTRAINT PK_MEMBER PRIMARY KEY (user_id);
ALTER TABLE Vote ADD CONSTRAINT PK_VOTE PRIMARY KEY (user_id, SURVEY_NUM, COL_NUMBER);
ALTER TABLE Survey ADD CONSTRAINT PK_SURVEY PRIMARY KEY (SURVEY_NUM, COL_NUMBER);
ALTER TABLE Edit ADD CONSTRAINT PK_EDIT PRIMARY KEY (SURVERY_NUM, admin_id, COL_NUMBER);
ALTER TABLE Administrator ADD CONSTRAINT PK_ADMINISTRATOR PRIMARY KEY (admin_id);
ALTER TABLE Item ADD CONSTRAINT PK_ITEM PRIMARY KEY (CHO_NUM, SURVEY_NUM, COL_NUMBER);

ALTER TABLE Vote ADD CONSTRAINT FK_Member_TO_Vote_1 FOREIGN KEY (user_id) REFERENCES Member (user_id);
ALTER TABLE Vote ADD CONSTRAINT FK_Survey_TO_Vote_1 FOREIGN KEY (SURVEY_NUM,COL_NUMBER) REFERENCES Survey (SURVEY_NUM,COL_NUMBER);
--ALTER TABLE Vote ADD CONSTRAINT FK_Survey_TO_Vote_2 FOREIGN KEY (COL_NUMBER) REFERENCES Survey (COL_NUMBER);
ALTER TABLE Edit ADD CONSTRAINT FK_Survey_TO_Edit_1 FOREIGN KEY (SURVERY_NUM,COL_NUMBER) REFERENCES Survey (SURVEY_NUM,COL_NUMBER);
--ALTER TABLE Edit ADD CONSTRAINT FK_Survey_TO_Edit_2 FOREIGN KEY (SURVEY_NUM,COL_NUMBER) REFERENCES Survey (SURVEY_NUM,COL_NUMBER);
ALTER TABLE Edit ADD CONSTRAINT FK_Administrator_TO_Edit_1 FOREIGN KEY (admin_id) REFERENCES Administrator (admin_id);
ALTER TABLE Item ADD CONSTRAINT FK_Survey_TO_Item_1 FOREIGN KEY (SURVEY_NUM,COL_NUMBER) REFERENCES Survey (SURVEY_NUM,COL_NUMBER);
--ALTER TABLE Item ADD CONSTRAINT FK_Survey_TO_Item_2 FOREIGN KEY (COL_NUMBER) REFERENCES Survey (COL_NUMBER);


DESC Member;

SELECT *
FROM Member;

INSERT INTO Member VALUES ('kang0821', '강명건', 'aaa123@aaa.com', TO_DATE('1993-08-21', 'YYYY-MM-DD'), '이상해씨', 'aaaa1234!');
INSERT INTO Member VALUES ('pokemonmaster1', '한지우', 'gonnabe@poke.com', TO_DATE('1988-01-29', 'YYYY-MM-DD'), '꼬부기', 'bbbb4567@');
INSERT INTO Member VALUES ('water02', '이슬이', 'swimisgood@poke.com', TO_DATE('1999-09-23', 'YYYY-MM-DD'), '파이리', 'CcAa7896%$');
INSERT INTO Member VALUES ('rock55', '웅이', 'ilovewomen@poke.com', TO_DATE('1994-07-09', 'YYYY-MM-DD'), '피카츄', 'Whdkdy19684$%@');
INSERT INTO Member VALUES ('purple66', '로이', 'qqq444@rocket.com', TO_DATE('1981-05-19', 'YYYY-MM-DD'), '버터플', 'eocndgo@@1234');



--다섯개 유저 데이터 입력
ALTER TABLE Member 
ADD CONSTRAINT chk_email_format 
CHECK (REGEXP_LIKE(user_email_address, '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'));
--이메일 형식 제약
ALTER TABLE Member 
ADD CONSTRAINT chk_id_format 
CHECK (REGEXP_LIKE(user_id, '^[a-zA-Z0-9_-]{1,20}$'));
--아이디 형식 제약

ALTER TABLE Administrator DROP CONSTRAINT idconstr;
--제약사항삭제
ALTER TABLE Administrator ADD CONSTRAINT idconstr CHECK(    
REGEXP_LIKE(admin_id, '^#[a-zA-Z0-9_-]+$') AND 
LENGTH(admin_id) <= 20);
--관리자 아이디 형식 제약
INSERT INTO ADMINISTRATOR VALUES ('#admin','이창익' ,'admin@poke.com ','1995-05-06','관리자 ','5555' );

ALTER TABLE Member 
ADD CONSTRAINT chk_password_format 
CHECK (REGEXP_LIKE(user_password, '^[a-zA-Z0-9!@#$%^&*()_+-=;:{}|`~<>,.?/]{8,20}$'));

--비밀번호 형식제약
--알파벳 대소문자/숫자/특수문자만 사용 가능한 제약 8~20자

ALTER TABLE Member DROP CONSTRAINT chk_password_format;
--
--ALTER TABLE Member 
--ADD CONSTRAINT unique_user_email_address 
--UNIQUE (user_email_address);
----이메일 중복불가 제약

INSERT INTO Survey VALUES ( 1,5,'좋아하는 동물', '2023-08-19','2023-08-22','2023-08-19');
INSERT INTO Item VALUES (1,1,5,'강아지');
INSERT INTO Item VALUES (2,1,5,'고양이');
INSERT INTO Item VALUES (3,1,5,'햄스터');
INSERT INTO Item VALUES (4,1,5,'쿼카');
INSERT INTO Item VALUES (5,1,5,'판다');

INSERT INTO Survey VALUES ( 2,5,'출생년도 고르기', '2023-10-10','2023-10-21','2023-10-9');
INSERT INTO Item VALUES (1,2,5,'1970년대');
INSERT INTO Item VALUES (2,2,5,'1980년대');
INSERT INTO Item VALUES (3,2,5,'1990년대');
INSERT INTO Item VALUES (4,2,5,'2000년대');
INSERT INTO Item VALUES (5,2,5,'2010년대');

INSERT INTO Survey VALUES ( 3,2,'성별고르기', '2023-10-11','2023-10-13','2023-10-11');
INSERT INTO Item VALUES (1,3,2,'여자');
INSERT INTO Item VALUES (2,3,2,'남자');

INSERT INTO Survey VALUES ( 4,4,'살고싶은 주거환경', '2024-01-31','2024-03-15','2024-01-31');
INSERT INTO Item VALUES (1,4,4,'단독주택');
INSERT INTO Item VALUES (2,4,4,'아파트');
INSERT INTO Item VALUES (3,4,4,'빌라');
INSERT INTO Item VALUES (4,4,4,'기숙사');


INSERT INTO Survey VALUES ( 5,4,'직업고르기', '2024-02-28','2024-03-07','2024-02-28');
INSERT INTO Item VALUES (1,5,4,'회사원');
INSERT INTO Item VALUES (2,5,4,'사업가');
INSERT INTO Item VALUES (3,5,4,'공무원');
INSERT INTO Item VALUES (4,5,4,'학생');

SELECT
    질문, 작성일, 시작일, 종료일, 항목수, 상태
    , LISTAGG(CHOICE1, ', ') WITHIN GROUP (ORDER BY CHOICE1) AS 항목   
FROM (
    SELECT
        s.TITLE AS 질문
        , s.WRITE_DATE AS 작성일
        , s.START_DATE AS 시작일
        , s.END_DATE AS 종료일
        , s.COL_NUMBER AS 항목수
        , i.CHOICE1 AS CHOICE1
        , CASE
        WHEN SYSDATE BETWEEN s.START_DATE AND s.END_DATE THEN '진행 중'
        WHEN SYSDATE < s.START_DATE THEN '진행 전'
        ELSE '종료'
    END AS 상태
    FROM 
        Survey s 
    JOIN 
        vote v ON s.SURVEY_NUM = v.SURVEY_NUM
    JOIN 
        MEMBER m ON m.USER_ID = v.USER_ID
    JOIN 
        Item i ON i.SURVEY_NUM = s.SURVEY_NUM
    GROUP BY 
        s.TITLE, s.WRITE_DATE, s.START_DATE, s.END_DATE, s.COL_NUMBER, i.CHOICE1
)
GROUP BY 
    질문, 작성일, 시작일, 종료일, 항목수, 상태;



SELECT LPAD(' ', count(*)+1, '#')  
FROM VOTE
WHERE survey_num=1 
group by choice_num;




SELECT
    질문, 작성일, 시작일, 종료일, 항목수,
    LISTAGG(CHOICE1, ', ') WITHIN GROUP (ORDER BY CHOICE1) AS 항목,
    (
        SELECT COUNT(*) FROM vote v WHERE v.survey_num = s.survey_num
    ) AS 참여자수,
    DECODE(SIGN(end_date - TRUNC(SYSDATE)), -1, '종료', '진행중') AS 상태
FROM (
    SELECT
        s.TITLE AS 질문,
        s.WRITE_DATE AS 작성일,
        s.START_DATE AS 시작일,
        s.END_DATE AS 종료일,
        s.COL_NUMBER AS 항목수,
        i.CHOICE1 AS CHOICE1
    FROM 
        Survey s 
    JOIN 
        vote v ON s.SURVEY_NUM = v.SURVEY_NUM
    JOIN 
        MEMBER m ON m.USER_ID = v.USER_ID
    JOIN 
        Item i ON i.SURVEY_NUM = s.SURVEY_NUM
    GROUP BY 
        s.TITLE, s.WRITE_DATE, s.START_DATE, s.END_DATE, s.COL_NUMBER, i.CHOICE1
) s
GROUP BY 
    질문, 작성일, 시작일, 종료일, 항목수, s.survey_num, s.END_DATE;








INSERT INTO VOTE VALUES ('kang0821', 1, 5,1);
INSERT INTO VOTE VALUES ('water02', 1,5, 1);
INSERT INTO VOTE VALUES ('rock55', 1, 5,2);
INSERT INTO VOTE VALUES ('purple66', 1,5, 1);
INSERT INTO VOTE VALUES ('pokemonmaster1', 1,5, 2);

INSERT INTO VOTE VALUES ('kang0821', 2, 5,3);
INSERT INTO VOTE VALUES ('water02', 2,5, 1);
INSERT INTO VOTE VALUES ('rock55', 2,5, 2);
INSERT INTO VOTE VALUES ('purple66', 2,5, 1);

INSERT INTO VOTE VALUES ('kang0821', 3,2,2);
INSERT INTO VOTE VALUES ('water02', 3, 2,1);
INSERT INTO VOTE VALUES ('rock55', 3,2, 2);
INSERT INTO VOTE VALUES ('purple66', 3,2, 2);
INSERT INTO VOTE VALUES ('pokemonmaster1', 3,2, 2);

INSERT INTO VOTE VALUES ('water02', 4, 4,4);
INSERT INTO VOTE VALUES ('rock55', 4,4, 4);
INSERT INTO VOTE VALUES ('purple66', 4,4, 3);
INSERT INTO VOTE VALUES ('pokemonmaster1', 4,4, 1);

INSERT INTO VOTE VALUES ('kang0821', 5,4, 1);
INSERT INTO VOTE VALUES ('rock55', 5,4, 4);
INSERT INTO VOTE VALUES ('purple66', 5,4, 1);



--설문 항목 보기 


--설문 결과 (%로 표현된 LPAD까지)


