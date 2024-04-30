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

COMMENT ON COLUMN Member.user_id IS '��ǥ�ڸ��ĺ���ID';
COMMENT ON COLUMN Member.user_name IS 'ȸ���� �̸�';
COMMENT ON COLUMN Member.user_email_address IS 'ȸ���� �̸��� �ּ�';
COMMENT ON COLUMN Member.user_birthday IS 'ȸ���� �������';
COMMENT ON COLUMN Member.user_nickname IS 'ȸ���� �г���';
COMMENT ON COLUMN Member.user_password IS 'ȸ���� ��й�ȣ';

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

INSERT INTO Member VALUES ('kang0821', '�����', 'aaa123@aaa.com', TO_DATE('1993-08-21', 'YYYY-MM-DD'), '�̻��ؾ�', 'aaaa1234!');
INSERT INTO Member VALUES ('pokemonmaster1', '������', 'gonnabe@poke.com', TO_DATE('1988-01-29', 'YYYY-MM-DD'), '���α�', 'bbbb4567@');
INSERT INTO Member VALUES ('water02', '�̽���', 'swimisgood@poke.com', TO_DATE('1999-09-23', 'YYYY-MM-DD'), '���̸�', 'CcAa7896%$');
INSERT INTO Member VALUES ('rock55', '����', 'ilovewomen@poke.com', TO_DATE('1994-07-09', 'YYYY-MM-DD'), '��ī��', 'Whdkdy19684$%@');
INSERT INTO Member VALUES ('purple66', '����', 'qqq444@rocket.com', TO_DATE('1981-05-19', 'YYYY-MM-DD'), '������', 'eocndgo@@1234');



--�ټ��� ���� ������ �Է�
ALTER TABLE Member 
ADD CONSTRAINT chk_email_format 
CHECK (REGEXP_LIKE(user_email_address, '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'));
--�̸��� ���� ����
ALTER TABLE Member 
ADD CONSTRAINT chk_id_format 
CHECK (REGEXP_LIKE(user_id, '^[a-zA-Z0-9_-]{1,20}$'));
--���̵� ���� ����

ALTER TABLE Administrator DROP CONSTRAINT idconstr;
--������׻���
ALTER TABLE Administrator ADD CONSTRAINT idconstr CHECK(    
REGEXP_LIKE(admin_id, '^#[a-zA-Z0-9_-]+$') AND 
LENGTH(admin_id) <= 20);
--������ ���̵� ���� ����
INSERT INTO ADMINISTRATOR VALUES ('#admin','��â��' ,'admin@poke.com ','1995-05-06','������ ','5555' );

ALTER TABLE Member 
ADD CONSTRAINT chk_password_format 
CHECK (REGEXP_LIKE(user_password, '^[a-zA-Z0-9!@#$%^&*()_+-=;:{}|`~<>,.?/]{8,20}$'));

--��й�ȣ ��������
--���ĺ� ��ҹ���/����/Ư�����ڸ� ��� ������ ���� 8~20��

ALTER TABLE Member DROP CONSTRAINT chk_password_format;
--
--ALTER TABLE Member 
--ADD CONSTRAINT unique_user_email_address 
--UNIQUE (user_email_address);
----�̸��� �ߺ��Ұ� ����

INSERT INTO Survey VALUES ( 1,5,'�����ϴ� ����', '2023-08-19','2023-08-22','2023-08-19');
INSERT INTO Item VALUES (1,1,5,'������');
INSERT INTO Item VALUES (2,1,5,'�����');
INSERT INTO Item VALUES (3,1,5,'�ܽ���');
INSERT INTO Item VALUES (4,1,5,'��ī');
INSERT INTO Item VALUES (5,1,5,'�Ǵ�');

INSERT INTO Survey VALUES ( 2,5,'����⵵ ����', '2023-10-10','2023-10-21','2023-10-9');
INSERT INTO Item VALUES (1,2,5,'1970���');
INSERT INTO Item VALUES (2,2,5,'1980���');
INSERT INTO Item VALUES (3,2,5,'1990���');
INSERT INTO Item VALUES (4,2,5,'2000���');
INSERT INTO Item VALUES (5,2,5,'2010���');

INSERT INTO Survey VALUES ( 3,2,'��������', '2023-10-11','2023-10-13','2023-10-11');
INSERT INTO Item VALUES (1,3,2,'����');
INSERT INTO Item VALUES (2,3,2,'����');

INSERT INTO Survey VALUES ( 4,4,'������ �ְ�ȯ��', '2024-01-31','2024-03-15','2024-01-31');
INSERT INTO Item VALUES (1,4,4,'�ܵ�����');
INSERT INTO Item VALUES (2,4,4,'����Ʈ');
INSERT INTO Item VALUES (3,4,4,'����');
INSERT INTO Item VALUES (4,4,4,'�����');


INSERT INTO Survey VALUES ( 5,4,'��������', '2024-02-28','2024-03-07','2024-02-28');
INSERT INTO Item VALUES (1,5,4,'ȸ���');
INSERT INTO Item VALUES (2,5,4,'�����');
INSERT INTO Item VALUES (3,5,4,'������');
INSERT INTO Item VALUES (4,5,4,'�л�');

SELECT
    ����, �ۼ���, ������, ������, �׸��, ����
    , LISTAGG(CHOICE1, ', ') WITHIN GROUP (ORDER BY CHOICE1) AS �׸�   
FROM (
    SELECT
        s.TITLE AS ����
        , s.WRITE_DATE AS �ۼ���
        , s.START_DATE AS ������
        , s.END_DATE AS ������
        , s.COL_NUMBER AS �׸��
        , i.CHOICE1 AS CHOICE1
        , CASE
        WHEN SYSDATE BETWEEN s.START_DATE AND s.END_DATE THEN '���� ��'
        WHEN SYSDATE < s.START_DATE THEN '���� ��'
        ELSE '����'
    END AS ����
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
    ����, �ۼ���, ������, ������, �׸��, ����;



SELECT LPAD(' ', count(*)+1, '#')  
FROM VOTE
WHERE survey_num=1 
group by choice_num;




SELECT
    ����, �ۼ���, ������, ������, �׸��,
    LISTAGG(CHOICE1, ', ') WITHIN GROUP (ORDER BY CHOICE1) AS �׸�,
    (
        SELECT COUNT(*) FROM vote v WHERE v.survey_num = s.survey_num
    ) AS �����ڼ�,
    DECODE(SIGN(end_date - TRUNC(SYSDATE)), -1, '����', '������') AS ����
FROM (
    SELECT
        s.TITLE AS ����,
        s.WRITE_DATE AS �ۼ���,
        s.START_DATE AS ������,
        s.END_DATE AS ������,
        s.COL_NUMBER AS �׸��,
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
    ����, �ۼ���, ������, ������, �׸��, s.survey_num, s.END_DATE;








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



--���� �׸� ���� 


--���� ��� (%�� ǥ���� LPAD����)


