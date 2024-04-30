-- 참조 관계가 있는 테이블 삭제
ALTER TABLE payrefund DROP CONSTRAINT FK_Scplane_TO_payrefund_1;
ALTER TABLE Scplane DROP CONSTRAINT FK_airplane_TO_Scplane_1;
ALTER TABLE SEAT_NUM DROP CONSTRAINT FK_airplane_TO_SEAT_NUM_1;
ALTER TABLE payrefund DROP CONSTRAINT FK_flightuser_TO_payrefund_1;
ALTER TABLE yesno DROP CONSTRAINT FK_Contract_TO_yesno_1;
ALTER TABLE Ifare DROP CONSTRAINT FK_Adminstrator_TO_Ifare_1;
ALTER TABLE Mtracking DROP CONSTRAINT FK_flightuser_TO_Mtracking_1;
ALTER TABLE dfare DROP CONSTRAINT FK_Adminstrator_TO_dfare_1;
ALTER TABLE L_rule DROP CONSTRAINT FK_R_section_TO_L_rule_1;
ALTER TABLE Notice DROP CONSTRAINT FK_Adminstrator_TO_Notice_1;
ALTER TABLE Rfamily DROP CONSTRAINT FK_flightuser_TO_Rfamily_1;
ALTER TABLE Cservice DROP CONSTRAINT FK_Adminstrator_TO_Cservice_1;

-- 참조 관계가 없는 테이블 삭제
drop table loginhis PURGE;
DROP TABLE CARD_USE PURGE;
DROP TABLE GIFTCARD PURGE;
DROP TABLE Contract PURGE;
DROP TABLE Event PURGE;
DROP TABLE Winner PURGE;
DROP TABLE Prize PURGE;
DROP TABLE Adminstrator PURGE;
DROP TABLE Userdetail PURGE;
DROP TABLE S_Grade PURGE;
DROP TABLE Movie PURGE;
DROP TABLE TV PURGE;
DROP TABLE Music PURGE;
DROP TABLE Bpass PURGE;
DROP TABLE flight_meal PURGE;
DROP TABLE Scplane PURGE;
DROP TABLE SEAT_NUM PURGE;
DROP TABLE payrefund PURGE;
DROP TABLE Ifare PURGE;
DROP TABLE yesno PURGE;
DROP TABLE Customerc PURGE;
DROP TABLE dfare PURGE;
DROP TABLE LOUNGE_INFO PURGE;
DROP TABLE L_rule PURGE;
DROP TABLE R_section PURGE;
DROP TABLE Notice PURGE;
DROP TABLE Rfamily PURGE;
DROP TABLE Cservice PURGE;
DROP TABLE airplane PURGE;
DROP TABLE Mtracking PURGE;
DROP TABLE flightuser PURGE;


----------------------------------------------------테이블 생성 문 ---------------------------------------------------------------
----------------------------------------------------테이블 생성 문 ---------------------------------------------------------------
----------------------------------------------------테이블 생성 문 ---------------------------------------------------------------
----------------------------------------------------테이블 생성 문 ---------------------------------------------------------------
----------------------------------------------------테이블 생성 문 ---------------------------------------------------------------
----------------------------------------------------테이블 생성 문 ---------------------------------------------------------------
----------------------------------------------------테이블 생성 문 ---------------------------------------------------------------
----------------------------------------------------테이블 생성 문 ---------------------------------------------------------------
----------------------------------------------------테이블 생성 문 ---------------------------------------------------------------
----------------------------------------------------테이블 생성 문 ---------------------------------------------------------------
CREATE TABLE flightuser (
    UserID varchar2(100) NOT NULL,
    Korlastname varchar2(20) NOT NULL,
    Korfirstname varchar2(100) NOT NULL,
    lastname varchar2(100) NOT NULL,
    firstname varchar2(100) NOT NULL,
    password varchar2(200) NOT NULL,
    birthdate date NOT NULL,
    gender varchar2(6) NOT NULL,
    emailaddress varchar2(200) NOT NULL,
    phoneNumber varchar2(200) NOT NULL,
    Anation varchar2(200) NOT NULL,
    Skypassnumber varchar2(200) NOT NULL
);

CREATE TABLE Loginhis (
	UserID	varchar2(100)		NOT NULL,
	logd	varchar2(100)		NULL
);

CREATE TABLE Cservice (
    CS_num VARCHAR2(4) NOT NULL,
    Area VARCHAR2(30) NOT NULL,
    Country_name VARCHAR2(30) NOT NULL,
    CS_call1 VARCHAR2(50) NOT NULL,
    CS_call2 VARCHAR2(50) NULL,
    lang_time clob NOT NULL,
    AdminID varchar2(100) NOT NULL
);

CREATE TABLE Rfamily (
    relation VARCHAR2(20) NOT NULL,
    status VARCHAR2(10) NULL,
    request_date DATE DEFAULT SYSDATE NULL,
    family_id VARCHAR2(100) NOT NULL,
    UserID varchar2(100) NOT NULL
);

CREATE TABLE Notice (
    Notice_num VARCHAR2(3) NOT NULL,
    Notice_title VARCHAR2(200) NOT NULL,
    Notice_contents clob NOT NULL,
    Notice_topic VARCHAR2(20) NOT NULL,
    AdminID varchar2(100) NOT NULL
);

CREATE TABLE R_section (
    ROUTE_SECTION VARCHAR2(50) NOT NULL,
    dairport VARCHAR2(1000) NOT NULL,
    aairport varchar2(1000) NOT NULL
);

CREATE TABLE L_rule (
    LUGREGULAR_NUM NUMBER(2) NOT NULL,
    SEAT_GRADE VARCHAR2(20) NOT NULL,
    numberofluggage NUMBER(2) NOT NULL,
    EXCESS_FEE NUMBER(8) NOT NULL, 
    ROUTE_SECTION VARCHAR2(50) NOT NULL
);

CREATE TABLE LOUNGE_INFO (
    LOUNGE_NUM VARCHAR2(10) NOT NULL,
    LOUNGE_NAME VARCHAR2(100) NULL,
    DESTINATION_AIRPORT VARCHAR2(50) NOT NULL,
    COUNTRY VARCHAR2(40) NOT NULL,
    LOCATION VARCHAR2(1000) NOT NULL,
    OPERATING_TIME clob NOT NULL,
    OPERATOR VARCHAR2(10) NOT NULL,
    ENTRY_PASSENGER clob NOT NULL,
    SERVICE VARCHAR2(500) NOT NULL,
    ETC VARCHAR2(300) NULL
);

CREATE TABLE dfare (
    Keynum number(4) NOT NULL,
    peak varchar2(100) NOT NULL,
    discount varchar2(100) NOT NULL,
    timezone varchar2(100) NOT NULL,
    sg varchar2(50) NOT NULL,
    route varchar2(200) NOT NULL,
    fare number NOT NULL,
    redis number NOT NULL,
    AdminID varchar2(100) NOT NULL,
    wknddy varchar2(100) null
);




CREATE TABLE airplane (
    asnum varchar2(100) NOT NULL,
    AIRLINE VARCHAR(30) NULL,
    totalseat NUMBER(4) NOT NULL,
    airmodel VARCHAR(30) NULL,
    M_DATE DATE NULL,
    FCLA_COUNT NUMBER(3) NULL,
    PreCLA_COUNT NUMBER(3) NULL,
    NCLA_COUNT NUMBER(3) NULL,
    PRECLA_Features VARCHAR2(300) NULL,
    NCLA_Features VARCHAR2(300) NULL,
    FCLA_Features varchar2(300) null
);

CREATE TABLE Mtracking (
    Tracking_num NUMBER NOT NULL,
    Consumtion_date DATE DEFAULT SYSDATE NULL,
    Amount_Mileage NUMBER NOT NULL,
    airline_type VARCHAR2(50) NOT NULL,
    spendorearned VARCHAR2(10) NOT NULL,
    UserID varchar2(100) NOT NULL
);

CREATE TABLE payrefund (
    SerialNumber number NOT NULL,
    payrefund varchar2(50) NOT NULL,
    pmethod varchar2(70) DEFAULT '카드' NOT NULL,
    flight varchar2(50) DEFAULT '정상' NOT NULL,
    seatNumber varchar2(50) NULL,
    drdate date default sysdate NOT NULL,
    nluggage number(2) DEFAULT 0 NULL,
    cost number NOT NULL,
    mileage number null,
    UserID varchar2(100) NOT NULL,
    renum number NOT NULL,
    GIFTCARDNUMBER VARCHAR2(100) NULL
);

CREATE TABLE SEAT_NUM (
    SEAT_CODE VARCHAR2(20) NOT NULL,
    SEAT_NUM VARCHAR2(20) NOT NULL,
    SEAT_GRADE VARCHAR2(100) NULL,
    asnum varchar2(100) NOT NULL
);

CREATE TABLE Scplane (
    renum number NOT NULL,
    food varchar2(100) DEFAULT '(기내식 제공없음)' NULL,
    ddate date NOT NULL,
    adate date NOT NULL,
    dnation varchar2(100) NOT NULL,
    anation varchar2(100) NOT NULL,
    AdminID varchar2(100) NOT NULL,
    fnumber varchar2(100) NOT NULL,
    aairport varchar2(100) NOT NULL,
    dairport varchar2(100) NOT NULL,
    GATE number(4) NULL,
    Terminal number(2) NOT NULL,
    asnum varchar2(100) NOT NULL
);

COMMENT ON COLUMN Scplane.dnation IS '한국고정';

COMMENT ON COLUMN Scplane.anation IS '한국,일본,중국,미국';

CREATE TABLE Bpass (
    Key VARCHAR2(10) NOT NULL,
    dairport varchar2(100) NOT NULL,
    aairport varchar2(100) NOT NULL,
    ddate date NOT NULL,
    SEAT_NUM VARCHAR2(5) NOT NULL,
    PNAME VARCHAR2(200) NOT NULL,
    GATE NUMBER(4) NULL,
    TERMINAL NUMBER(2) NOT NULL,
    UserID varchar2(100) NOT NULL
);

CREATE TABLE flight_meal (
    meal_code NUMBER(2) NOT NULL,
    menu VARCHAR2(300) NULL,
    MENU_PDF BLOB NULL
);

CREATE TABLE Customerc (
    Q_num NUMBER NOT NULL,
    type VARCHAR2(12) NOT NULL,
    Field VARCHAR2(60) NOT NULL,
    F_NAME VARCHAR2(20) NOT NULL,
    L_NAME VARCHAR2(20) NOT NULL,
    P_NUM VARCHAR2(20) DEFAULT '(82)' NOT NULL,
    Email VARCHAR2(40) NOT NULL,
    title VARCHAR2(100) NOT NULL,
    content varchar2(3000) NOT NULL,
    SP_NUM VARCHAR2(20) NULL,
    renum VARCHAR2(8) NULL,
    e_check NUMBER(1) NOT NULL,
    city_arr VARCHAR2(40) NULL,
    start_city VARCHAR2(40) NULL,
    arr_date DATE NULL,
    Flights VARCHAR2(6) NULL
);

CREATE TABLE yesno (
    Contrat_num varchar2(4) NOT NULL,
    agree varchar2(100) NOT NULL,
    Agree_date date NOT NULL,
    UserID varchar2(100) NOT NULL,
    Contract_code number NOT NULL
);

COMMENT ON COLUMN yesno.agree IS '동의/비동의';

CREATE TABLE Ifare (
    Keynum number(4) NOT NULL,
    starta varchar2(100) NOT NULL,
    arrive varchar2(100) NOT NULL,
    sg varchar2(50) NOT NULL,
    fare number NOT NULL,
    redis number NOT NULL,
    tax number NOT NULL,
    fuelch number NOT NULL,
    AdminID varchar2(100) NOT NULL
);

CREATE TABLE CARD_USE (
    record_num NUMBER(10) NOT NULL,
    section VARCHAR(12) NOT NULL,
    tdate DATE NOT NULL,
    amount number NOT NULL,
    CARD_NUM VARCHAR2(19) NOT NULL
);
CREATE TABLE GIFTCARD (
    CARD_NUM VARCHAR2(19) NOT NULL,
    message VARCHAR2(450) NOT NULL,
    PIN_NUM NUMBER(6) NOT NULL,
    Recipient VARCHAR2(30) NOT NULL,
    Recipient_PNUM varchar2(20) NOT NULL,
    SENDER VARCHAR2(30) NOT NULL,
    SENDER_PNUM varchar2(20) NOT NULL,
    amount NUMBER(7) NOT NULL
);

CREATE TABLE Contract (
    Contract_code number NOT NULL,
    Essentiality varchar2(6) NOT NULL,
    Contract_title varchar2(150) NOT NULL,
    Contract_contents varchar2(3000) NOT NULL
);

COMMENT ON COLUMN Contract.Essentiality IS '필수/선택';

COMMENT ON COLUMN Contract.Contract_title IS '50자내외';

CREATE TABLE Event (
    Evnum number(4) NOT NULL,
    Evcat varchar2(100) NOT NULL,
    Evname varchar2(100) NOT NULL,
    stdate date NOT NULL,
    endate date NOT NULL,
    AdminID varchar2(100) NOT NULL
);

CREATE TABLE Winner (
    Key number(8) NOT NULL,
    Wingrade varchar2(100) NOT NULL,
    phoneNumber varchar2(100) NOT NULL,
    UserID varchar2(100) NOT NULL,
    Evnum number(4) NOT NULL
);

CREATE TABLE Prize (
    Evnum number(4) NOT NULL,
    Price1 VARCHAR2(30) NOT NULL,
    Price2 VARCHAR2(30) NOT NULL,
    Price3 VARCHAR2(30) NOT NULL
);

CREATE TABLE Adminstrator (
    AdminID varchar2(100) NOT NULL,
    Korlastname varchar2(20) NOT NULL,
    Korfirstname varchar2(100) NOT NULL,
    lastname varchar2(100) NOT NULL,
    firstname varchar2(100) NOT NULL,
    password varchar2(200) NOT NULL,
    birthdate date NOT NULL,
    gender varchar2(6) NOT NULL,
    emailaddress varchar2(200) NOT NULL,
    phoneNumber varchar2(200) NOT NULL,
    Area_Nation varchar2(200) NOT NULL,
    Skypassnumber varchar2(200) NOT NULL
);

CREATE TABLE Userdetail (
    UserID varchar2(100) NOT NULL,
    totalmile number DEFAULT 0 NULL,
    usergrade varchar2(100) DEFAULT '스카이패스 클럽' NULL,
    family_id VARCHAR2(100) NULL
);

CREATE TABLE S_Grade (
    Key NUMBER NOT NULL,
    grade varchar2(100) DEFAULT '스카이패스 클럽' NOT NULL,
    totalmile NUMBER DEFAULT 0 NOT NULL,
    minarr NUMBER DEFAULT 0 NOT NULL
);

CREATE TABLE Movie (
    Title varchar2(100) NOT NULL,
    Duration date NOT NULL,
    Category varchar2(100) NOT NULL,
    Content clob NOT NULL,
    Lang varchar2(20) NOT NULL
);

CREATE TABLE TV (
    Title varchar2(100) NOT NULL,
    duration date NOT NULL,
    cate varchar2(100) NOT NULL,
    content clob NOT NULL
);

CREATE TABLE Music (
    Title varchar2(100) NOT NULL,
    Duration date NOT NULL,
    cate varchar2(100) NOT NULL,
    content clob NOT NULL
);

ALTER TABLE flightuser ADD CONSTRAINT PK_FLIGHTUSER PRIMARY KEY (UserID);

ALTER TABLE Cservice ADD CONSTRAINT PK_CSERVICE PRIMARY KEY (CS_num);

ALTER TABLE Rfamily ADD CONSTRAINT PK_RFAMILY PRIMARY KEY (userid);

ALTER TABLE Notice ADD CONSTRAINT PK_NOTICE PRIMARY KEY (Notice_num);

ALTER TABLE R_section ADD CONSTRAINT PK_R_SECTION PRIMARY KEY (ROUTE_SECTION);

ALTER TABLE L_rule ADD CONSTRAINT PK_L_RULE PRIMARY KEY (LUGREGULAR_NUM);

ALTER TABLE LOUNGE_INFO ADD CONSTRAINT PK_LOUNGE_INFO PRIMARY KEY (LOUNGE_NUM);

ALTER TABLE dfare ADD CONSTRAINT PK_DFARE PRIMARY KEY (Keynum);

ALTER TABLE airplane ADD CONSTRAINT PK_AIRPLANE PRIMARY KEY (asnum);

ALTER TABLE Mtracking ADD CONSTRAINT PK_MTRACKING PRIMARY KEY (Tracking_num);

ALTER TABLE payrefund ADD CONSTRAINT PK_PAYREFUND PRIMARY KEY (SerialNumber);

ALTER TABLE SEAT_NUM ADD CONSTRAINT PK_SEAT_NUM PRIMARY KEY (SEAT_CODE);

ALTER TABLE Scplane ADD CONSTRAINT PK_SCPLANE PRIMARY KEY (renum);

ALTER TABLE Bpass ADD CONSTRAINT PK_BPASS PRIMARY KEY (Key);

ALTER TABLE flight_meal ADD CONSTRAINT PK_FLIGHT_MEAL PRIMARY KEY (meal_code);

ALTER TABLE Customerc ADD CONSTRAINT PK_CUSTOMERC PRIMARY KEY (Q_num);

ALTER TABLE yesno ADD CONSTRAINT PK_YESNO PRIMARY KEY (Contrat_num);

ALTER TABLE Ifare ADD CONSTRAINT PK_IFARE PRIMARY KEY (Keynum);

ALTER TABLE CARD_USE ADD CONSTRAINT PK_CARD_USE PRIMARY KEY (record_num);

ALTER TABLE GIFTCARD ADD CONSTRAINT PK_GIFTCARD PRIMARY KEY (CARD_NUM);

ALTER TABLE Contract ADD CONSTRAINT PK_CONTRACT PRIMARY KEY (Contract_code);

ALTER TABLE Event ADD CONSTRAINT PK_EVENT PRIMARY KEY (Evnum);

ALTER TABLE Winner ADD CONSTRAINT PK_WINNER PRIMARY KEY (Key);

ALTER TABLE Prize ADD CONSTRAINT PK_PRIZE PRIMARY KEY (Evnum);

ALTER TABLE Adminstrator ADD CONSTRAINT PK_ADMINSTRATOR PRIMARY KEY (AdminID);

ALTER TABLE Userdetail ADD CONSTRAINT PK_USERDETAIL PRIMARY KEY (UserID);

ALTER TABLE S_Grade ADD CONSTRAINT PK_S_GRADE PRIMARY KEY (Key);

ALTER TABLE Movie ADD CONSTRAINT PK_MOVIE PRIMARY KEY (Title);

ALTER TABLE TV ADD CONSTRAINT PK_TV PRIMARY KEY (Title);

ALTER TABLE Music ADD CONSTRAINT PK_MUSIC PRIMARY KEY (Title);

ALTER TABLE Loginhis ADD CONSTRAINT PK_LOGINHIS PRIMARY KEY (UserID);


ALTER TABLE Cservice ADD CONSTRAINT FK_Adminstrator_TO_Cservice_1 FOREIGN KEY (AdminID)
REFERENCES Adminstrator (AdminID) on delete cascade;

ALTER TABLE Rfamily ADD CONSTRAINT FK_flightuser_TO_Rfamily_1 FOREIGN KEY (UserID)
REFERENCES flightuser (UserID) on delete cascade;

ALTER TABLE Notice ADD CONSTRAINT FK_Adminstrator_TO_Notice_1 FOREIGN KEY (AdminID)
REFERENCES Adminstrator (AdminID) on delete cascade;

ALTER TABLE L_rule ADD CONSTRAINT FK_R_section_TO_L_rule_1 FOREIGN KEY (ROUTE_SECTION)
REFERENCES R_section (ROUTE_SECTION) on delete cascade;

ALTER TABLE dfare ADD CONSTRAINT FK_Adminstrator_TO_dfare_1 FOREIGN KEY (AdminID)
REFERENCES Adminstrator (AdminID) on delete cascade;

ALTER TABLE Mtracking ADD CONSTRAINT FK_flightuser_TO_Mtracking_1 FOREIGN KEY (UserID)
REFERENCES flightuser (UserID) on delete cascade;

ALTER TABLE payrefund ADD CONSTRAINT FK_flightuser_TO_payrefund_1 FOREIGN KEY (UserID)
REFERENCES flightuser (UserID) on delete cascade;

ALTER TABLE payrefund ADD CONSTRAINT FK_Scplane_TO_payrefund_1 FOREIGN KEY (renum)
REFERENCES Scplane (renum) on delete cascade;

ALTER TABLE SEAT_NUM ADD CONSTRAINT FK_airplane_TO_SEAT_NUM_1 FOREIGN KEY (asnum)
REFERENCES airplane (asnum) on delete cascade;

ALTER TABLE Scplane ADD CONSTRAINT FK_airplane_TO_Scplane_1 FOREIGN KEY (asnum)
REFERENCES airplane (asnum) on delete cascade;

ALTER TABLE Bpass ADD CONSTRAINT FK_flightuser_TO_Bpass_1 FOREIGN KEY (UserID)
REFERENCES flightuser (UserID) on delete cascade;

ALTER TABLE yesno ADD CONSTRAINT FK_flightuser_TO_yesno_1 FOREIGN KEY (UserID)
REFERENCES flightuser (UserID) on delete cascade;

ALTER TABLE yesno ADD CONSTRAINT FK_Contract_TO_yesno_1 FOREIGN KEY (Contract_code)
REFERENCES Contract (Contract_code) on delete cascade;

ALTER TABLE Ifare ADD CONSTRAINT FK_Adminstrator_TO_Ifare_1 FOREIGN KEY (AdminID)
REFERENCES Adminstrator (AdminID) on delete cascade;

ALTER TABLE CARD_USE ADD CONSTRAINT FK_GIFTCARD_TO_CARD_USE_1 FOREIGN KEY (CARD_NUM)
REFERENCES GIFTCARD (CARD_NUM) on delete cascade;

ALTER TABLE Event ADD CONSTRAINT FK_Adminstrator_TO_Event_1 FOREIGN KEY (AdminID)
REFERENCES Adminstrator (AdminID) on delete cascade;

ALTER TABLE Winner ADD CONSTRAINT FK_flightuser_TO_Winner_1 FOREIGN KEY (UserID)
REFERENCES flightuser (UserID) on delete cascade;

ALTER TABLE Winner ADD CONSTRAINT FK_Event_TO_Winner_1 FOREIGN KEY (Evnum)
REFERENCES Event (Evnum) on delete cascade;

ALTER TABLE Prize ADD CONSTRAINT FK_Event_TO_Prize_1 FOREIGN KEY (Evnum)
REFERENCES Event (Evnum) on delete cascade;

ALTER TABLE Userdetail ADD CONSTRAINT FK_flightuser_TO_Userdetail_1 FOREIGN KEY (UserID) 
REFERENCES flightuser (UserID) on delete cascade;

--------------------------------------------------------------예시 데이터 삽입문---------------------------------------------------
--------------------------------------------------------------예시 데이터 삽입문---------------------------------------------------
--------------------------------------------------------------예시 데이터 삽입문---------------------------------------------------
--------------------------------------------------------------예시 데이터 삽입문---------------------------------------------------
--------------------------------------------------------------예시 데이터 삽입문---------------------------------------------------
--------------------------------------------------------------예시 데이터 삽입문---------------------------------------------------
--------------------------------------------------------------예시 데이터 삽입문---------------------------------------------------
--------------------------------------------------------------예시 데이터 삽입문---------------------------------------------------
-----
-- 회원 정보 5개
INSERT INTO flightuser VALUES ('user001', '홍', '길동', 'Hong', 'GilDong', 'password123', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 'Male', 'user001@example.com', '01012345678', 'Korea', '1234-5678-9012-3456');

INSERT INTO flightuser VALUES ('user002', '김', '철수', 'Kim', 'ChulSoo', 'pass456', TO_DATE('1985-12-15', 'YYYY-MM-DD'), 'Male', 'user002@example.com', '01023456789', 'Korea', '5678-9012-3456-7890');

INSERT INTO flightuser VALUES ('user003', '이', '영희', 'Lee', 'YoungHee', 'securepass', TO_DATE('1993-05-20', 'YYYY-MM-DD'), 'Female', 'user003@example.com', '01034567890', 'Japan', '9012-3456-7890-1234');

INSERT INTO flightuser VALUES ('user004', '박', '미영', 'Park', 'MiYoung', 'mypassword', TO_DATE('1987-04-03', 'YYYY-MM-DD'), 'Female', 'user004@example.com', '01045678901', 'China', '2345-6789-0123-4567');

INSERT INTO flightuser VALUES ('user005', '김', '수현', 'Kim', 'SuHyun', 'p@ssw0rd', TO_DATE('1990-11-11', 'YYYY-MM-DD'), 'Female', 'user005@example.com', '01056789012', 'Korea', '6789-0123-4567-8901');

--항공기 정보 5개
INSERT INTO airplane  VALUES (
    'HL7553',
    '대한항공',
    276,
    'A330-300',
    TO_DATE('1999-04-16', 'YYYY-MM-DD'),
    0,
    24,
    252,
    '프레스티지 클래스 우선 탑승, 추가 수하물 허용',
    '향상된 좌석 공간, 개인 엔터테인먼트 시스템',
    NULL
);



INSERT INTO airplane VALUES (
    'HL7554',
    '대한항공',
    276,
    'A330-300',
    TO_DATE('1999-01-04', 'YYYY-MM-DD'),
    0,
    24,
    252,
    '프레스티지 클래스 전용 체크인, 라운지 이용 가능',
    '조절 가능한 헤드레스트, USB 충전 포트',
    NULL
);

INSERT INTO airplane VALUES (
    'HL7611',
    '대한항공',
    407,
    'A380-800',
    TO_DATE('2010-09-27', 'YYYY-MM-DD'),
    12,
    94,
    301,
    '프레스티지 클래스 셀프 체크인, 우선 탑승',
    '와이드 스크린 개인 모니터, 다리 공간 확장'
    ,'퍼스트클래스 최고의 서비스'
);


INSERT INTO airplane VALUES (
    'HL8348',
    '대한항공',
    146,
    'B737-8',
    TO_DATE('2019-04-18', 'YYYY-MM-DD'),
    0,
    8,
    138,
    '프레스티지 클래스 스위트, 고급 식사 옵션',
    '개인 엔터테인먼트, 더 넓은 좌석 및 다리 공간'
    ,NULL
);

INSERT INTO airplane VALUES (
    'HL8240',
    '대한항공',
    138,
    'B737-800',
    TO_DATE('2011-09-14', 'YYYY-MM-DD'),
    0,
    12,
    126,
    '프레스티지 클래스 스위트, 고급 식사 옵션',
    '개인 엔터테인먼트, 더 넓은 좌석 및 다리 공간'
    ,NULL
);
-- 예약 일정 5개
INSERT INTO Scplane VALUES (1, NULL, TO_DATE('2024-03-20 09:30', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-03-20 10:45', 'YYYY-MM-DD HH24:MI'), 'Korea', 'Korea', 'admin001', 'KE1234', 'JEJU.CJU', 'SEOUL.GMP', 23, 2, 'HL7553');
INSERT INTO Scplane VALUES (2, NULL, TO_DATE('2024-03-23 15:15', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-03-23 16:30', 'YYYY-MM-DD HH24:MI'), 'Korea', 'Korea', 'admin002',  'KE5678',  'JEJU.CJU','SEOUL.GMP', 15, 3, 'HL7554');
INSERT INTO Scplane VALUES (3, '햄버거', TO_DATE('2024-04-09 14:45', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-04-09 20:00', 'YYYY-MM-DD HH24:MI'), 'Korea', 'Japan', 'admin003', 'KE9876', 'FUKU.FUK','SEOUL.ICN', 8, 1, 'HL7611');
INSERT INTO Scplane VALUES (4, '김치찌개', TO_DATE('2024-04-10 09:05', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-04-10 10:25', 'YYYY-MM-DD HH24:MI'), 'Korea', 'China', 'admin004',  'KE4321', 'BEIJING.PEK', 'SEOUL.ICN', 12, 4, 'HL8348');
INSERT INTO Scplane VALUES (5, NULL, TO_DATE('2024-05-03 21:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-05-03 22:15', 'YYYY-MM-DD HH24:MI'), 'Korea', 'Korea', 'admin005', 'KE8765', 'JEJU.CJU', 'SEOUL.GMP', 20, 2, 'HL8240');
INSERT INTO Scplane VALUES 
(6, NULL, TO_DATE('2024-03-28 06:05', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-03-28 07:15', 'YYYY-MM-DD HH24:MI')
, 'Korea', 'Korea', 'admin001',  'KE5153', 'JEJU.CJU', 'SEOUL.GMP', 23, 2, 'HL7553');
INSERT INTO Scplane VALUES 
(7, NULL, TO_DATE('2024-03-28 07:05', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-03-28 08:15', 'YYYY-MM-DD HH24:MI')
, 'Korea', 'Korea', 'admin001',  'KE5153','JEJU.CJU','SEOUL.GMP', 23, 2, 'HL7553');
INSERT INTO Scplane VALUES 
(8, NULL, TO_DATE('2024-03-28 07:25', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-03-28 08:35', 'YYYY-MM-DD HH24:MI')
, 'Korea', 'Korea', 'admin001',  'KE5153','JEJU.CJU', 'SEOUL.GMP',  23, 2, 'HL7553');
INSERT INTO Scplane VALUES 
(9, NULL, TO_DATE('2024-03-28 08:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-03-28 09:10', 'YYYY-MM-DD HH24:MI')
, 'Korea', 'Korea', 'admin001',  'KE5153','JEJU.CJU', 'SEOUL.GMP', 23, 2, 'HL7553');
INSERT INTO Scplane VALUES 
(10, NULL, TO_DATE('2024-03-28 08:30', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-03-28 09:40', 'YYYY-MM-DD HH24:MI')
, 'Korea', 'Korea', 'admin001',  'KE5153','JEJU.CJU', 'SEOUL.GMP', 23, 2, 'HL7553');


---- 나머지 5개의 데이터
--INSERT INTO Scplane VALUES 
--(11, NULL, TO_DATE('2024-03-25 09:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-03-25 11:05', 'YYYY-MM-DD HH24:MI')
--, 'Korea', 'Japan', 'admin001', 421000, 'KE2468', 'ICN', 'HND', 18, 3, 'HL9102');
--INSERT INTO Scplane VALUES 
--(12, '스테이크', TO_DATE('2024-04-15 11:10', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-04-15 12:25', 'YYYY-MM-DD HH24:MI')
--, 'Korea', 'CHINA', 'admin001', 166000, 'KE6543', 'ICN', 'PVG', 10, 1, 'HL7321');
--INSERT INTO Scplane VALUES 
--(13, NULL, TO_DATE('2024-05-01 16:30', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-05-01 17:40', 'YYYY-MM-DD HH24:MI')
--, 'Korea', 'Korea', 'admin001', 97000, 'KE7890', 'GMP', 'CJU', 25, 4, 'HL8197');
--INSERT INTO Scplane VALUES 
--(14, NULL, TO_DATE('2024-05-10 20:30', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-05-10 21:40', 'YYYY-MM-DD HH24:MI')
--, 'Korea', 'Korea', 'admin001', 132000, 'KE1227', 'GMP', 'CJU', 22, 2, 'HL6635');
--INSERT INTO Scplane VALUES 
--(15, NULL, TO_DATE('2024-05-20 13:20', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-05-20 14:30', 'YYYY-MM-DD HH24:MI')
--, 'Korea', 'Thailand', 'admin010', 101000, 'KE1115', 'GMP', 'CJU', 14, 3, 'HL5721');

--결제/예약/환불
--INSERT INTO payrefund VALUES (1, '결제', '카드', '정상', '20A', SYSDATE, 2, 97000, 276, 'user001', 1);
--INSERT INTO payrefund VALUES (2, '결제', '기프트카드', '정상', '21A', SYSDATE, 0, 115000, 150, 'user002', 2);
--INSERT INTO payrefund VALUES (3, '결제', '카드', '정상', '22A', SYSDATE, 1, 199000, 250, 'user003', 3);
--INSERT INTO payrefund VALUES (4, '결제', '마일리지', '정상', '20A', SYSDATE, 0, 169000, 398, 'user004', 4);
--INSERT INTO payrefund VALUES (5, '결제', '기프트카드', '할인', '20A', SYSDATE, 3, 63000, 276, 'user005', 5);

--
-- 관리자 5개행 삽입
INSERT INTO Adminstrator VALUES ('#admin001', '김', '철수', 'Kim', 'Chulsoo', 'adminpass1', TO_DATE('1990-01-15', 'YYYY-MM-DD'), 'Male', 'chulsoo.kim@example.com', '010-1234-5678', 'Seoul, South Korea', '1234-5678-9012-3456');
INSERT INTO Adminstrator VALUES ('#admin002', '이', '영희', 'Lee', 'Younghee', 'adminpass2', TO_DATE('1985-03-22', 'YYYY-MM-DD'), 'Female', 'younghee.lee@example.com', '010-9876-5432', 'Busan, South Korea', '7890-1234-5678-9012');
INSERT INTO Adminstrator VALUES ('#admin003', '박', '민수', 'Park', 'Minsu', 'adminpass3', TO_DATE('1995-07-10', 'YYYY-MM-DD'), 'Male', 'minsu.park@example.com', '010-5555-1234', 'Incheon, South Korea', '3456-7890-1234-5678');
INSERT INTO Adminstrator VALUES ('#admin004', '장', '서영', 'Jang', 'Seoyoung', 'adminpass4', TO_DATE('1988-11-05', 'YYYY-MM-DD'), 'Female', 'seoyoung.jang@example.com', '010-7777-8888', 'Daejeon, South Korea', '9012-3456-7890-1234');
INSERT INTO Adminstrator VALUES ('#admin005', '윤', '준호', 'Yoon', 'Junho', 'adminpass5', TO_DATE('1992-04-30', 'YYYY-MM-DD'), 'Male', 'junho.yoon@example.com', '010-3333-9999', 'Ulsan, South Korea', '5678-9012-3456-7890');

--
--국내선 운임 인서트 3개
insert into dfare values (1,'비수기','정상','선호','일반석','SEOUL/GMP-JEJU/CJU',97000,3000,'#admin001','주중');
insert into dfare values (2,'비수기','정상','일반','일반석','SEOUL/GMP-JEJU/CJU',115000,3000,'#admin002','주말');
insert into dfare values (3,'성수기','정상','일반','일반석','SEOUL/GMP-JEJU/CJU',132000,3000,'#admin005','주중');


--국제선 운임 인서트 2개
insert into ifare values (1,'ICN','FUK','일반석',150000,110000,20300,21000,'#admin003');
insert into ifare values (2,'ICN','PEK','일반석',235000,172300,22350,35000,'#admin004');


-- 안내 사항 5개
INSERT INTO notice VALUES ( 1, '한국 입국 세관신고 절차 변경', '2023년 5월 1일부터 대한민국 입국 세관신고 절차가 변경됩니다. 
 신고할 물품이 없는 경우에는 세관 신고서 없이 면세 라인 이용해 주세요.
 º 필수 신고 품목이 있는 경우에만 세관 신고서 제출 (검사 라인 이용) - 필수 신고 품목 : 미화 8백불 초과 물품, 미화 1만불 초과 외환, 검역물품 등
 º 신고 방법 : App/Web 사전 신고 또는 종이 휴대품 신고서 작성 
 º App 설치 및 Web 접속 방법', '여행정보', '#admin005');
INSERT INTO notice VALUES ( 2, '스카이패스 회원 할인 제휴 변경(키자니아 서울)', '스카이패스 회원 제휴사인 키자니아 서울과의 제휴 내용이 변경됩니다.
 º 스카이패스 회원 할인 적용은 현장 예매 시에만 가능 - 인터넷 사전 예매 시 할인 제공 불가  
 º 반일권 2부 할인율 30%로 인상 ( 2024년 2월 26일 부터) - 반일권 1부 할인율은 20% 유지', '스카이패스', '#admin001');
INSERT INTO notice VALUES ( 3, '엑설런트 보딩패스 제휴 종료 (쉐이크쉑)', '제휴사 폐점 계획에 따라 쉐이크쉑과의 엑설런트 보딩패스 제휴가 종료됩니다.
 º 제휴사 : 쉐이크쉑 (SHAKE SHACK) 인천국제공항 제2여객터미널 인천공항점
 º 제휴 종료일 : 2024년 3월 30일 º 엑설런트 보딩패스 제휴 혜택은 3월 29일 까지 제공됩니다.', '여행정보', '#admin003');
INSERT INTO notice VALUES ( 4, '카드 영수 일시 중단 (Diners Club, Discover)', '홈페이지에서 항공권 구매 시 Diners club 및 Discover 카드 영수가 일시 중단될 예정입니다.
 º 중단 일자 : 2024년 3월 16일 부 º 중단 사유 : 해당 카드사 심화인증 프로그램 개선 
 * 그 외 클로벌 카드사(Visa, Mastercard, American Express, JCB, UATP)로의 결제는 가능하며 카드사 심화인증 프로그램 개선 작업 후 다시 영수할 예정입니다.(20204년 상반기 내)'
, '기타안내', '#admin001');
INSERT INTO notice VALUES ( 5, '신규 마일리지 적립 제휴( 교보문고, 11번가)', '교보문고 및 11번가와 마일리지 적립 제휴를 시행하여,
 대한항공 홈페이지 내 제공된 링크를 통해 쇼핑 시 지불 금액에 따라 스카이패스 마일리지 적립이 가능함을 알려드립니다. 
 <제휴내용> 
  º 교보문고 : 지불 금액 1,000원당 2마일  
  º 11번가 : 지불 금액 1,000원당 1마일'
, '제휴소식', '#admin002');

--좌석 입력쿼리

-- 일등석 좌석 추가
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-01A', 'HL7553', '01A', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-01B', 'HL7553', '01B', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-01C', 'HL7553', '01C', '일등석');

-- 일반석 좌석 추가
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-20A', 'HL7553', '20A', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-20B', 'HL7553', '20B', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-20C', 'HL7553', '20C', '일반석');

-- 프레스티지석 좌석 추가
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-10A', 'HL7553', '10A', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-10B', 'HL7553', '10B', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-10C', 'HL7553', '10C', '프레스티지석');


-- 일등석
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-01D', 'HL7554', '01D', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-01E', 'HL7554', '01E', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-01F', 'HL7554', '01F', '일등석');

-- 일반석
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-21A', 'HL7554', '21A', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-21B', 'HL7554', '21B', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-21C', 'HL7554', '21C', '일반석');

-- 프레스티지석
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-11A', 'HL7554', '11A', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-11B', 'HL7554', '11B', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-11C', 'HL7554', '11C', '프레스티지석');


-- 일등석
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-01G', 'HL7611', '01G', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-01H', 'HL7611', '01H', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-01I', 'HL7611', '01I', '일등석');

-- 일반석
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-22A', 'HL7611', '22A', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-22B', 'HL7611', '22B', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-22C', 'HL7611', '22C', '일반석');

-- 프레스티지석
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-12A', 'HL7611', '12A', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-12B', 'HL7611', '12B', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-12C', 'HL7611', '12C', '프레스티지석');


-- 일등석 좌석 추가
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-01A', 'HL8348', '01A', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-01B', 'HL8348', '01B', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-01C', 'HL8348', '01C', '일등석');

-- 일반석 좌석 추가
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-20A', 'HL8348', '20A', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-20B', 'HL8348', '20B', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-20C', 'HL8348', '20C', '일반석');

-- 프레스티지석 좌석 추가
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-10A', 'HL8348', '10A', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-10B', 'HL8348', '10B', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-10C', 'HL8348', '10C', '프레스티지석');



-- 일등석 좌석 추가
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-01A', 'HL8240', '01A', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-01B', 'HL8240', '01B', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-01C', 'HL8240', '01C', '일등석');

-- 일반석 좌석 추가
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-20A', 'HL8240', '20A', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-20B', 'HL8240', '20B', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-20C', 'HL8240', '20C', '일반석');

-- 프레스티지석 좌석 추가
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-10A', 'HL8240', '10A', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-10B', 'HL8240', '10B', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-10C', 'HL8240', '10C', '프레스티지석');


-- 클럽등급기준 값 넣기 


INSERT INTO S_Grade (Key) VALUES (1); 
INSERT INTO S_Grade VALUES (2, '모닝캄 클럽', 50000, 40 ) ;  
INSERT INTO S_Grade VALUES (3, '모닝캄 프리미엄 클럽' , 500000, 40);
INSERT INTO S_Grade VALUES (4, '밀리언 마일러 클럽', 1000000, 40); 

-- 가족 신청 하기 


--INSERT INTO Rfamily (keynum,relation,family_id,userid) VALUES (1,'부','#id_01','user001');
--INSERT INTO Rfamily (keynum,relation,family_id,userid) VALUES (2,'모','#id_01','user002');
--INSERT INTO Rfamily (keynum,relation,family_id,userid) VALUES (3,'부','#id_02','user003');
--INSERT INTO Rfamily (keynum,relation,family_id,userid) VALUES (4,'모','#id_02','user004');
--INSERT INTO Rfamily (keynum,relation,family_id,userid) VALUES (5,'자','#id_02','user005');

-- 회원 세부 정보 
INSERT INTO Userdetail (UserID) VALUES ('user001');
INSERT INTO Userdetail (UserID) VALUES ('user002');
INSERT INTO Userdetail (UserID) VALUES ('user003');
INSERT INTO Userdetail (UserID) VALUES ('user004');
INSERT INTO Userdetail (UserID) VALUES ('user005');


-- 마일리지 적립 / 소비
--    
--INSERT INTO Mtracking (Tracking_num, Amount_Mileage, airline_type, spendorearned, userID) VALUES(1,0,'대한항공','적립','user001');
--INSERT INTO Mtracking (Tracking_num, Amount_Mileage, airline_type, spendorearned, userID) VALUES(2,0,'대한항공','소비','user001');
--INSERT INTO Mtracking (Tracking_num, Amount_Mileage, airline_type, spendorearned, userID) VALUES(3,20,'대한항공','적립','user002');
--INSERT INTO Mtracking (Tracking_num, Amount_Mileage, airline_type, spendorearned, userID) VALUES(4,30,'대한항공','소비','user002');
--INSERT INTO Mtracking (Tracking_num, Amount_Mileage, airline_type, spendorearned, userID) VALUES(5,40,'대한항공','적립','user003');
--

-- 고객의 말씀
-- 첫 번째 행 삽입
INSERT INTO Customerc VALUES (
    1,                -- 문의사항고유번호
    '칭송',                        -- 유형
    '공항서비스',                  -- 분야
    '이',                         -- 승객 성
    '동찬',                       -- 승객 이름
    '(82) 10-1234-5678',          -- 전화번호
    'example@email.com',          -- 이메일주소
    '칭찬해요 ~',                  -- 제목
    '모두 너무 친절합니다',          -- 내용
    '1232-3456-7890-1323',                       -- 스카이패스회원번호
    '34534534',                     -- 예약번호
    1,                            -- 이메일수신여부
    '서울',                        -- 도착도시
    '뉴욕',                        -- 출발도시
    TO_DATE('2024-03-10', 'YYYY-MM-DD'), -- 출발일자
    'KE123'                       -- 항공편명
);

-- 두 번째 행 삽입
INSERT INTO Customerc VALUES (
    2,                -- 문의사항고유번호
    '문의',                        -- 유형
    '기내식',                      -- 분야
    '김',                         -- 승객 성
    '영희',                       -- 승객 이름
    '(82) 10-2345-6789',          -- 전화번호
    'user2@example.com',          -- 이메일주소
    '기내식 관련 문의',            -- 제목
    '기내식 옵션이 무엇인가요?',   -- 내용
    '9012-3678-7890-1323',                       -- 스카이패스회원번호
    '12346786',                     -- 예약번호
    0,                            -- 이메일수신여부
    '도쿄',                        -- 도착도시
    '서울',                        -- 출발도시
    TO_DATE('2024-04-15', 'YYYY-MM-DD'), -- 출발일자
    'KE456'                       -- 항공편명
);

-- 세 번째 행 삽입
INSERT INTO Customerc VALUES (
   3,                -- 문의사항고유번호
    '불만',                        -- 유형
    '수화물',                      -- 분야
    '박',                         -- 승객 성
    '민수',                       -- 승객 이름
    '(82) 10-3456-7890',          -- 전화번호
    'user3@example.com',          -- 이메일주소
    '수화물 분실에 대한 불만',      -- 제목
    '짐을 받지 못했습니다',        -- 내용
    '9012-3456-2340-1323',                       -- 스카이패스회원번호
    '54367344',                     -- 예약번호
    1,                            -- 이메일수신여부
    '뉴욕',                        -- 도착도시
    '런던',                        -- 출발도시
    TO_DATE('2024-05-20', 'YYYY-MM-DD'), -- 출발일자
    'KE789'                       -- 항공편명
);

-- 네 번째 행 삽입
INSERT INTO Customerc VALUES (
    4,                -- 문의사항고유번호
    '제언',                        -- 유형
    '기타',                        -- 분야
    '최',                         -- 승객 성
    '지민',                       -- 승객 이름
    '(82) 10-4567-8901',          -- 전화번호
    'user4@example.com',          -- 이메일주소
    '기내 서비스 개선 제안',        -- 제목
    '기내 엔터테인먼트를 개선해주세요', -- 내용
    '9012-3456-7890-1323',                       -- 스카이패스회원번호
    '21346578',                     -- 예약번호
    0,                            -- 이메일수신여부
    '로스앤젤레스',                -- 도착도시
    '서울',                        -- 출발도시
    TO_DATE('2024-06-01', 'YYYY-MM-DD'), -- 출발일자
    'KE890'                       -- 항공편명
);

INSERT INTO Customerc VALUES (
   5,                -- 문의사항고유번호
    '불만',                        -- 유형
    '기내식',                      -- 분야
    '김',                         -- 승객 성
    '민준',                       -- 승객 이름
    '(82) 10-2345-6789',          -- 전화번호
    'user5@example.com',          -- 이메일주소
    '기내식 품질 개선 요청',         -- 제목
    '기내식의 맛과 질이 기대에 못 미쳤습니다.', -- 내용
    '1234-5678-9012-3456',        -- 스카이패스회원번호
    '87654321',                   -- 예약번호
    1,                            -- 이메일수신여부
    '도쿄',                        -- 도착도시
    '서울',                        -- 출발도시
    TO_DATE('2024-09-15', 'YYYY-MM-DD'), -- 출발일자
    'KE453'                       -- 항공편명
);

--식사메뉴

-- 첫 번째 식사 옵션 추가
INSERT INTO flight_meal (meal_code, menu) VALUES (1, '치킨 카레 라이스 - 온화한 향신료와 함께 제공되는 풍미 가득한 치킨 카레');

-- 두 번째 식사 옵션 추가
INSERT INTO flight_meal (meal_code, menu) VALUES (2, '비건 스페셜 - 채식주의자를 위한 특별 준비된 신선한 야채와 곡물로 만든 식사');

-- 세 번째 식사 옵션 추가
INSERT INTO flight_meal (meal_code, menu) VALUES (3, '스테이크와 감자 - 고급스러운 스테이크와 함께 제공되는 구운 감자');



---
--기프트카드 50만원 1개 생성

---
INSERT INTO GIFTCARD (
    CARD_NUM, 
    message, 
    PIN_NUM, 
    Recipient, 
    Recipient_PNUM, 
    SENDER, 
    SENDER_PNUM, 
    amount
) VALUES (
    '1234-5678-9012-3456',       -- 카드 번호
    '축하합니다!',               -- 메시지
    123456,                      -- PIN 번호
    '홍길동',                    -- 수령인
    '010-1234-5678',             -- 수령인 전화번호
    '김철수',                    -- 발송인
    '010-8765-4321',             -- 발송인 전화번호
    500000                       -- 금액 (50만원)
);

-- 구간 테이블 3개

INSERT INTO r_section VALUES ( '국내선', 'ICN, GMP, PUS, CJU, KWJ, TAE, RSU, USN, HIN, CJJ, KPO'
                              , 'ICN, GMP, PUS, CJU, KWJ, TAE, RSU, USN, HIN, CJJ, KPO');
INSERT INTO r_section VALUES ( '국제선 미주', 'ICN, GMP, PUS, CJU, KWJ, TAE, RSU, USN, HIN, CJJ, KPO'
                              , 'NYC, DFW, DTW, LAS, LAX, MSP, YVR, BOS, SFO, SEA, CHI, ATL, WAS, YYZ, HNL');   
INSERT INTO r_section VALUES ( '국제선 동북아시아', 'ICN, GMP, PUS, CJU, KWJ, TAE, RSU, USN, HIN, CJJ, KPO'
                             ,'KOJ, KHH, KMQ, CAN, KKJ, NGO, NKG, KIJ, DLC, TYO, MFM, PEK, CTS, SHA, XMN, SHE, SZX, XIY, AOJ, YNJ, YNT, KIX, OIT, OKA, URC, WUH, WEH, DYG, CGO, TNA, CSX, TAO, KMG, TPE, RMQ, TSN, HGH, HFE, HKG, TXN, FUK');

--수화물 규정

INSERT INTO l_rule VALUES ( 1, '일반석', 1, 0 , '국제선 동북아시아' );
INSERT INTO l_rule VALUES ( 2, '일반석', 2, 70000 , '국제선 동북아시아' );
INSERT INTO l_rule VALUES ( 3, '일반석', 3, 170000 , '국제선 동북아시아' );
INSERT INTO l_rule VALUES ( 4, '프레스티지석', 1, 0 , '국제선 동북아시아' );
INSERT INTO l_rule VALUES ( 5, '프레스티지석', 2, 0 , '국제선 동북아시아' );
INSERT INTO l_rule VALUES ( 6, '프레스티지석', 3, 100000 , '국제선 동북아시아' );
INSERT INTO l_rule VALUES ( 7, '일등석', 1, 0 , '국제선 동북아시아' );
INSERT INTO l_rule VALUES ( 8, '일등석', 2, 0 , '국제선 동북아시아' );
INSERT INTO l_rule VALUES ( 9, '일등석', 3, 0 , '국제선 동북아시아' );
INSERT INTO l_rule VALUES ( 10, '일등석', 4, 100000 , '국제선 동북아시아' );

INSERT INTO l_rule VALUES ( 11, '일반석', 1, 0 , '국제선 미주' );
INSERT INTO l_rule VALUES ( 12, '일반석', 2, 0 , '국제선 미주' );
INSERT INTO l_rule VALUES ( 13, '일반석', 3, 200000 , '국제선 미주' );
INSERT INTO l_rule VALUES ( 14, '프레스티지석', 1, 0 , '국제선 미주' );
INSERT INTO l_rule VALUES ( 15, '프레스티지석', 2, 0 , '국제선 미주' );
INSERT INTO l_rule VALUES ( 16, '프레스티지석', 3, 200000 , '국제선 미주' );
INSERT INTO l_rule VALUES ( 17, '일등석', 1, 0 , '국제선 미주' );
INSERT INTO l_rule VALUES ( 18, '일등석', 2, 0 , '국제선 미주' );
INSERT INTO l_rule VALUES ( 19, '일등석', 3, 0 , '국제선 미주' );
INSERT INTO l_rule VALUES ( 20, '일등석', 4, 200000 , '국제선 미주' );

--라운지 정보
INSERT INTO lounge_info (lounge_num, lounge_name, destination_airport, country, location, operating_time, operator, entry_passenger, service)
VALUES ( 1,'KAL 일등석 라운지', '서울/인천', '대한민국','(제 2여객 터미널,출국심사 후)248 Gate 맞은편 위층(4F)', 'º 요일 : 매일
 º 시간 : 04:00 ~ 22:00 ', '직영', '일등석 승객' ,'음료, 스낵, 독서물, 텔레비전, 팩스, 무선 인터넷, 노트북 포트, 프린터, 회의실, 샤워시설, 주류');
INSERT INTO lounge_info (lounge_num, lounge_name, destination_airport, country, location, operating_time, operator, entry_passenger, service)
VALUES ( 2,'KAL 라운지(국제선)', '서울/김포', '대한민국','대한민국, 출국장 내 4층(보안 검색 및 출국심사 후)', 'º 요일 : 매일
 º 시간 : 06:20 ~ 20:05 º 라운지 운영 시간은 항공기 운항 스케줄에 따라 변동될 수 있습니다.', '직영', 'º 프레스티지 클래스 승객 º 대한항공 밀리언 마일러 클럽 승객
 º 대한항공 모닝캄 프리미엄 클럽 승객 º 스카이팀 엘리트 플러스 승객 º 대한항공 모닝캄 클럽 승객 (라운지 좌석 상황에 따라 입장 제한)' 
 ,'음료, 스낵, 독서물, 텔레비전, 팩스, 무선 인터넷, 노트북 포트, 프린터, 주류');
INSERT INTO lounge_info (lounge_num, lounge_name, destination_airport, country, location, operating_time, operator, entry_passenger, service)
VALUES ( 3,'KAL 라운지', '도쿄/나리타', '동북아시아','제1 터미널 출국심사 후 26번 GATE 근처에 위치', 'º 요일 : 매일
 º 시간 : 07:15 ~ 20:30 º 최종 접수 시간 : 종료 시간 20분전', '직영', 'º 일등석 승객 º 프리스티지 클래스 승객 º 대한항공 밀리언 마일러 클럽 승객 º 대한항공 모닝캄 프리미엄 클럽 승객
 º 스카이팀 엘리트 플러스 승객 º 대한항공 모닝캄 클럽 승객 (라운지 좌석 상황에 따라 입장 제한)' ,'음료, 스낵, 텔레비전, 무선 인터넷, 주류');
INSERT INTO lounge_info (lounge_num, lounge_name, destination_airport, country, location, operating_time, operator, entry_passenger, service)
VALUES ( 4,'중국국제항공 라운지', '베이징/서우두(PEK)', '동북아시아','터미널2,보안검색지역 통과 후 면세지역','<º 요일 : 화, 목, 토
 º 시간 : 07:40 ~ 10:40> <º 요일 : 월, 수, 금, 일 º 시간 : 07:50 ~ 10:50> <º 요일 : 매일 º 시간 : 08:45 ~ 11:45> <º 요일 : 월, 수, 금, 일 º 시간 : 11:15 ~ 14:15>
 <º 요일 : 월, 수, 금, 일 º 시간 : 15:55 ~ 18:55> <º 요일 : 매일 º 시간 : 18:55 ~ 21:45>', '임차', 'º 일등석 승객 º 프리스티지 클래스 승객 º 대한항공 밀리언 마일러 클럽 승객
 º 대한항공 모닝캄 프리미엄 클럽 승객 º 스카이팀 엘리트 플러스 승객' ,'음료, 스낵, 독서물, 텔레비전, 무선 인터넷, 노트북 포트, 프린터, 주류');
INSERT INTO lounge_info (lounge_num, lounge_name, destination_airport, country, location, operating_time, operator, entry_passenger, service)
VALUES ( 5,'36번 동방항공 라운지', '상하이/푸동(PVG)', '동북아시아','보안검색지역 통과후 면세지역','º 요일 : 매일 º 시간 : 05:00 ~ 23:59', '임차'
 , 'º 일등석 승객 º 프리스티지 클래스 승객 º 대한항공 밀리언 마일러 클럽 승객 º 대한항공 모닝캄 프리미엄 클럽 승객 º 스카이팀 엘리트 플러스 승객' 
 ,'음료, 스낵, 독서물, 텔레비전, 전화, 팩스, 컴퓨터(인터넷 가능), 무선 인터넷, 프린터, 수면실, 샤워시설, 주류');
INSERT INTO lounge_info (lounge_num, lounge_name, destination_airport, country, location, operating_time, operator, entry_passenger, service)
VALUES ( 6,'중화항공 라운지', '타이베이/타오위엔(TPE)', '동북아시아','제1 여객터미널, 출국장 3층 안전검사 통과 및 출국사열 후 오른쪽"A" 방향의 4층에 위치'
 ,'º 요일 : 매일 º 시간 : 05:30 ~ 23:30', '임차', 'º 일등석 승객 º 프리스티지 클래스 승객 º 대한항공 밀리언 마일러 클럽 승객 º 대한항공 모닝캄 프리미엄 클럽 승객
 º 스카이팀 엘리트 플러스 승객' ,'음료, 스낵, 독서물, 텔레비전, 팩스, 컴퓨터(인터넷 가능), 무선 인터넷, 노트북 포트, 수면실, 샤워시설, 주류');
INSERT INTO lounge_info (lounge_num, lounge_name, destination_airport, country, location, operating_time, operator, entry_passenger, service)
VALUES ( 7,'플라자 프리미엄 라운지', '홍콩(HKG)', '동북아시아','1번 탑승구 부근','º 요일 : 매일 º 시간 : 06:00 ~ 01:00 º 라운지 사용 시간 : 최대 3시간'
, '임차', 'º 일등석 승객 º 프리스티지 클래스 승객 º 대한항공 밀리언 마일러 클럽 승객 º 대한항공 모닝캄 프리미엄 클럽 승객
 º 스카이팀 엘리트 플러스 승객' ,'음료, 스낵, 텔레비전, 전화');
INSERT INTO lounge_info (lounge_num, lounge_name, destination_airport, country, location, operating_time, operator, entry_passenger, service)
VALUES ( 8,'스카이팀 라운지', '밴쿠버(YVR)', '미주','국제선 청사 탑승구 D54 근처에 위치','º 요일 : 매일 º 시간 : 07:30 ~ 02:00
 º 추가정보는 공식 웹사이트 참조 요망 http://www.skyteam.com/en/lounges/Vancouver 참조', '임차', 'º 프리스티지 클래스 승객 º 대한항공 밀리언 마일러 클럽 승객
 º 대한항공 모닝캄 프리미엄 클럽 승객 º 스카이팀 엘리트 플러스 승객 ※주류 제공으로 인해 19세 이상만 출입 가능( 단, 성인 동반자와는 입장 가능)' 
 ,'음료, 스낵, 팩스, 무선 인터넷, 노트북 포트, 프린터, 수면실, 샤워시설, 주류');

--서비스 센터 5개

INSERT INTO cservice VALUES ('82', '한국', '대한민국', '1588-2001', '02-2656-2001', '[국내선] 
한국어/영어 : 매일 07:00-19:00 
[국제선] 
한국어 : 매일 07:00-22:00 
영어 : 매일 24시간 
일본어 : 매일 09:00-19:00(일본 현지시간 기준) 
중국어 : 매일 08:00-19:00(중국 현지시간 기준)','#admin002');
INSERT INTO cservice VALUES ('81', '동북아시아', '일본', '0570-05-2001', '06-6648-8201', '한국어/영어 : 매일 24시간 
일본어 : 매일 09:00-19:00 
중국어 : 매일 08:00-19:00(중국 현지시간 기준)','#admin002');
INSERT INTO cservice (cs_num, area, country_name, cs_call1,lang_time, adminid) VALUES ('852', '동북아시아', '홍콩', '2366-2001', '한국어/영어 : 매일 24시간 
일본어 : 매일 09:00-19:00(일본 현지시간 기준) 
중국어(보통화) : 매일 08:00-19:00(중국 현지시간 기준)','#admin003');
INSERT INTO cservice (cs_num, area, country_name, cs_call1,lang_time, adminid) VALUES ('61', '대양주/괌', '호주', '02-9262-6000', '한국어/영어 : 매일 24시간 
일본어 : 매일 09:00-19:00(일본 현지시간 기준) 
중국어 : 매일 08:00-19:00(중국 현지시간 기준)','#admin003');
INSERT INTO cservice VALUES ('7', '러시아/중앙아시아', '러시아', '(모스크바)8-800-500-2510(무료)', '(블라디보스토크)8-4232-433-444', '한국어/영어 : 매일 24시간 
일본어 : 매일 09:00-19:00(일본 현지시간 기준) 
중국어 : 매일 08:00-19:00(중국 현지시간 기준) 
* 현지어 선택 가능
현지어는 지점의 운영시간에 따라 서비스 제공 시간이 다릅니다.','#admin002');

-- 약관
INSERT INTO Contract (Contract_code, Essentiality, Contract_title, Contract_contents)
VALUES (1, '필수', '이용약관', '제1장 총칙 제1조 (목적) 이 약관은 ㈜대한항공(이하 "대한항공"이라 합니다)이 운영하는 대한항공 온라인 플랫폼에서 제공하는 온라인 서비스(이하 "서비스"라 합니다)를 이용함에 있어 대한항공과 이용자의 권리· 및 의무 및 책임사항을 규정함을 목적으로 합니다.');
INSERT INTO Contract (Contract_code, Essentiality, Contract_title, Contract_contents)
VALUES (2, '필수', '개인정보 수집 및 이용 동의', '회원의 개인정보 수집 및 이용에 대한 동의 사항');
INSERT INTO Contract (Contract_code, Essentiality, Contract_title, Contract_contents)
VALUES (3, '선택', '개인정보 제3자 제공 동의', '회원의 개인정보보호를 위한 이용자 동의 사항');
INSERT INTO Contract (Contract_code, Essentiality, Contract_title, Contract_contents)
VALUES (4, '선택', '마케팅 광고 활용 및 수신 동의', '마케팅 광고 활용 동의
대한항공은 광고성 정보(이벤트, 혜택) 제공을 위해 휴대전화 번호, 이메일 주소, 우편물 수령지(자택, 직장), 회사정보(회사명, 부서명, 직위)를 수집합니다.');
INSERT INTO Contract (Contract_code, Essentiality, Contract_title, Contract_contents)
VALUES (5, '선택', '뉴스레터', '내용없음');
INSERT INTO Contract (Contract_code, Essentiality, Contract_title, Contract_contents)
VALUES (6, '선택', '프로모션 정보', '내용없음');
INSERT INTO Contract (Contract_code, Essentiality, Contract_title, Contract_contents)
VALUES (7, '선택', '이메일', '내용없음');
INSERT INTO Contract (Contract_code, Essentiality, Contract_title, Contract_contents)
VALUES (8, '선택', 'SMS', '내용없음');


-- 약관 동의 여부
INSERT INTO yesno (Contrat_num, agree, Agree_date, UserID, Contract_code)
VALUES ('1', '동의', TO_DATE('2024.03.08', 'YYYY.MM.DD'), 'user001', 1);
INSERT INTO yesno (Contrat_num, agree, Agree_date, UserID, Contract_code)
VALUES ('2', '동의', TO_DATE('2024.03.08', 'YYYY.MM.DD'), 'user001', 2);
INSERT INTO yesno (Contrat_num, agree, Agree_date, UserID, Contract_code)
VALUES ('3', '동의', TO_DATE('2024.03.08', 'YYYY.MM.DD'), 'user001', 3);
INSERT INTO yesno (Contrat_num, agree, Agree_date, UserID, Contract_code)
VALUES ('4', '동의', TO_DATE('2024.03.08', 'YYYY.MM.DD'), 'user001', 4);
INSERT INTO yesno (Contrat_num, agree, Agree_date, UserID, Contract_code)
VALUES ('5', '동의', TO_DATE('2024.03.08', 'YYYY.MM.DD'), 'user001', 5);
INSERT INTO yesno (Contrat_num, agree, Agree_date, UserID, Contract_code)
VALUES ('6', '동의', TO_DATE('2024.03.08', 'YYYY.MM.DD'), 'user001', 6);
INSERT INTO yesno (Contrat_num, agree, Agree_date, UserID, Contract_code)
VALUES ('7', '동의', TO_DATE('2024.03.08', 'YYYY.MM.DD'), 'user001', 7);
INSERT INTO yesno (Contrat_num, agree, Agree_date, UserID, Contract_code)
VALUES ('8', '동의', TO_DATE('2024.03.08', 'YYYY.MM.DD'), 'user001', 8);

--기프트 카드 사용 내역

--INSERT INTO CARD_USE VALUES (1,'등록',TO_DATE('2024-03-07','YYYY-MM-DD'),500000,'1234-5678-9012-3456');



-------기능 실행 전 미리 만들어야하는 수열,전역변수 ----------------------------------------------------------------------------
-------기능 실행 전 미리 만들어야하는 수열 ----------------------------------------------------------------------------
-------기능 실행 전 미리 만들어야하는 수열 ----------------------------------------------------------------------------
-------기능 실행 전 미리 만들어야하는 수열 ----------------------------------------------------------------------------
-------기능 실행 전 미리 만들어야하는 수열 ----------------------------------------------------------------------------
-------기능 실행 전 미리 만들어야하는 수열 ----------------------------------------------------------------------------

-- 약관용 수열
create sequence yesnoseq
start with 1 increment by 1 nomaxvalue nocycle;
create sequence mk_mtrackingseq
start with 1 increment by 1 nomaxvalue nocycle;
create sequence mk_giftcardseq
start with 1 increment by 1 nomaxvalue nocycle;
drop sequence yesnoseq;
drop sequence mk_mtrackingseq;
drop sequence mk_giftcardseq;


------------------------------------트리거 목록 ----------------------------------------------------------
------------------------------------트리거 목록 ----------------------------------------------------------
------------------------------------트리거 목록 ----------------------------------------------------------
------------------------------------트리거 목록 ----------------------------------------------------------
------------------------------------트리거 목록 ----------------------------------------------------------
-- 예약 결제 행 업데이트 후 
create or replace trigger tr_mk_payrefund_01
AFTER insert on payrefund
for each row
begin
     if :new.pmethod ='마일리지' then
     insert into mtracking values(mk_mtrackingseq.nextval , sysdate, :new.mileage,'대한항공','소비','user001');
     elsif :new.pmethod ='카드' then 
     insert into mtracking values(mk_mtrackingseq.nextval , sysdate, :new.mileage, '대한항공','적립','user001');
     elsif :new.pmethod = '기프트카드' then
     insert into card_use values ( mk_giftcardseq.nextval,'사용' ,sysdate, :new.cost, :new.giftcardnumber);
     end if;
end;
select * from mtracking;
delete mtracking where 1=1;











---- 기능 실행 -----------------------------------------------------------------------------------------------------
---- 기능 실행 -----------------------------------------------------------------------------------------------------
---- 기능 실행 -----------------------------------------------------------------------------------------------------
---- 기능 실행 -----------------------------------------------------------------------------------------------------
---- 기능 실행 -----------------------------------------------------------------------------------------------------
---- 기능 실행 -----------------------------------------------------------------------------------------------------

-----------------------------맑음 --------------------------------------------------
-----------------------------맑음 --------------------------------------------------
-----------------------------맑음 --------------------------------------------------
-----------------------------맑음 --------------------------------------------------
-----------------------------맑음 --------------------------------------------------
-----------------------------맑음 --------------------------------------------------
-----------------------------맑음 --------------------------------------------------
-----------------------------맑음 --------------------------------------------------
-----------------------------맑음 --------------------------------------------------

-- 일정 삽입 프로시저 
create or replace procedure mk_scplane_01 
(
    pddate varchar2,
    padate varchar2,
    pdnation scplane.dnation%type default 'Korea',
    panation scplane.anation%type,
    padmin scplane.adminid%type,
    pdairport scplane.dairport%type,
    paairport scplane.aairport%type
    
)
is
    vnumber varchar2(100);
    vasnum varchar2(100);
    vddate date;
    vadate date;
    vdnation varchar2(100);
    vanation varchar2(100);
    vfood varchar2(100) default '(기내식 제공없음)';
begin
    vanation := upper(panation); 
    if vanation !='KOREA' then
    select substr(menu,1,instr(menu,'-')-1) into vfood from  (select menu from flight_meal order by dbms_random.value ) where rownum=1;
    end if ;
    vddate :=to_date(pddate,'yyyy.mm.dd hh24:mi');
    vadate :=to_date(padate,'yyyy.mm.dd hh24:mi');
    select asnum into vasnum from  (select asnum from airplane order by dbms_random.value ) where rownum=1 ;
    select NVL(max(renum)+1,1) INTO vnumber  from scplane ;
    insert into scplane values (vnumber ,vfood, vddate,vadate ,upper(pdnation),upper(panation),padmin, substr(initcap(pAnation),1,1) ||upper(dbms_random.string('A',1))||to_char(round(dbms_random.value(1000,9999))),paairport,pdairport,dbms_random.value(1,30),dbms_random.value(1,6),vasnum);
end;
exec mk_scplane_01('202404050800', '202404050925' ,'korea' ,'japan','#admin001','FUK.FUK','SEOUL.ICN');
exec mk_scplane_01('202404200800', '202404200925' ,'korea' ,'japan','#admin001','FUK.FUK','SEOUL.ICN');
exec mk_scplane_01('202404201835', '202404202000' ,'korea' ,'japan','#admin001','FUK.FUK','SEOUL.ICN');
exec mk_scplane_01('202403270625', '202403270715' ,'korea' ,'Korea','#admin001','JEJU.CJU','SEOUL.GMP');
exec mk_scplane_01('202403270915', '202403271025' ,'korea' ,'Korea','#admin001','JEJU.CJU','SEOUL.GMP');
exec mk_scplane_01('202403271330', '202403271445' ,'korea' ,'Korea','#admin001','JEJU.CJU','SEOUL.GMP');
exec mk_scplane_01('202404200640', '202404200750' ,'korea' ,'Korea','#admin002','JEJU.CJU','SEOUL.GMP');
exec mk_scplane_01('202404201300', '202404201410' ,'korea' ,'Korea','#admin002','JEJU.CJU','SEOUL.GMP');
exec mk_scplane_01('202404201300', '202404201410' ,'korea' ,'Korea','#admin002','JEJU.CJU','SEOUL.GMP');
exec mk_scplane_01('202404201300', '202404201410' ,'korea' ,'Korea','#admin002','JEJU.CJU','SEOUL.GMP');
exec mk_scplane_01('202405100905', '202405101025' ,'korea' ,'china','#admin002','BEIJING.PEK','SEOUL.ICN');
exec mk_scplane_01('202405101040', '202405101205' ,'korea' ,'china','#admin002','BEIJING.PEK','SEOUL.ICN');
exec mk_scplane_01('202405101840', '202405102005' ,'korea' ,'china','#admin002','BEIJING.PEK','SEOUL.ICN');

select * from flight_meal;
select * from scplane;
delete scplane where 1=1;
--회원가입 프로시저
create or replace procedure mk_flightuser_01 
(
    UI flightuser.userid%type,
    kl flightuser.Korlastname%type ,
    kf flightuser.Korfirstname%type ,
    lne flightuser.lastname%type,
    fn flightuser.firstname%type ,
    pw flightuser.password%type ,
    bd  flightuser.birthdate%type ,
    gd flightuser.gender%type ,
    ea1 flightuser.emailaddress%type ,
    pn flightuser.phoneNumber%type  ,
    at1 flightuser.Anation%type,
    spn flightuser.Skypassnumber%type,
    ct1 contract.contract_code%type,
    ct2 contract.contract_code%type
)
is
  vui flightuser.userid%type;
begin
    if ct1<>12 then 
        raise_application_error(-20003,' 필수 약관 미동의 회원가입 진행 불가');
     end if;
      select userid into vui from flightuser where userid=ui ;
     if ui=vui then
        raise_application_error(-20002,' 유저Id 중복 오류');
    end if;
    exception 
        when no_data_found then
       insert into flightuser values ( ui,kl,kf,lne,fn,pw,bd,gd,ea1,pn,at1,spn);
       insert into yesno values ( yesnoseq.nextval,'동의',to_char(sysdate,'yyyy-mm-dd'),ui,1);
       insert into yesno values ( yesnoseq.nextval,'동의',to_char(sysdate,'yyyy-mm-dd'),ui,2);
       insert into yesno values ( yesnoseq.nextval,decode(instr(ct2,'3'),0,'거부','동의'),to_char(sysdate,'yyyy-mm-dd'),ui,3);
       insert into yesno values ( yesnoseq.nextval,decode(instr(ct2,'4'),0,'거부','동의'),to_char(sysdate,'yyyy-mm-dd'),ui,4);
       insert into yesno values ( yesnoseq.nextval,decode(instr(ct2,'5'),0,'거부','동의'),to_char(sysdate,'yyyy-mm-dd'),ui,5);
end;

--회원 탈퇴 프로시저
create or replace procedure mk_flightuser_02
 (
    UI flightuser.userid%type 
 )
 is 

 begin
   delete flightuser
   where userid=ui;
 end;

 --로그인 프로시저
 
 create or replace procedure mk_flightuser_03
 (
   ui flightuser.userid%type ,
   pw flightuser.password%type
 )
 is
     vui flightuser.userid%type;
    vpw flightuser.password%type;
 begin
        select  password into vpw from flightuser where userid=ui;
        if vpw != pw then
        raise_application_error(-20006,'비밀번호가 일치하지 않습니다.');
        end if;
        
        dbms_output.put_line('로그인에 성공하였습니다');
        insert into loginhis values(ui,to_char(sysdate, 'yyyy"년" mm"월" dd"일" hh24"시" mi"분" ss"초"'));
        exception
            when no_data_found then 
            raise_application_error(-20007,'아이디가 존재하지 않습니다.');
end;


select * from user_role_privs;
exec mk_flightuser_01('user006', '홍', '길동', 'Hong', 'GilDong', 'password123', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 'Male', 'user001@example.com', '01012345678', 'Korea', '1234-5678-9012-3456',2,35);
exec mk_flightuser_02('user006');

exec mk_flightuser_03('user001','password123');
--로그아웃 프로시저 -- 
create or replace procedure mk_loginhis_01
is
begin
    delete loginhis where 1=1;
end;

exec mk_loginhis_01;
select * from loginhis;

set serveroutput on;

--예약 가능 일정 조회 프로시저 (국내선)
create or replace procedure mk_scplane_01
(
    dap scplane.dairport%type,
    aap scplane.aairport%type,
    dd scplane.ddate%type,
    anum number,
    sgrade seat_num.seat_grade%type
)
is
 cursor vreserv is
 select to_char(s.ddate,'yy/mm/dd hh24:mi') 출발시각, to_char(s.adate,'yy/mm/dd hh24:mi') 도착시각, 
 to_char(to_number(to_char(s.adate , 'hh24')) -to_number(to_char(s.ddate , 'hh24')) )||'시간' || to_char(to_number(to_char(s.adate , 'mi')) -to_number(to_char(s.ddate , 'mi'))) || '분' 소요시간,
 substr(dairport,instr(dairport,'.')+1) 출발공항,
 substr(aairport,instr(aairport,'.')+1) 도착공항,
 a.FCLA_COUNT -(select count(p.renum) from scplane s,airplane a ,payrefund p,seat_num sn where s.asnum=a.asnum and s.renum=p.renum and sn.asnum=s.asnum and sn.seat_num=p.seatnumber and substr(s.dairport,1,instr(s.dairport,'.')-1)=dap and substr(s.aairport,1,instr(s.aairport,'.')-1)=aap and to_char(s.ddate,'yymmdd')=dd and sn.seat_grade='일등석'
) 남은일등석수 ,
a.PreCLA_COUNT -(select count(p.renum)   from scplane s,airplane a ,payrefund p,seat_num sn where s.asnum=a.asnum and s.renum=p.renum and sn.asnum=s.asnum and sn.seat_num=p.seatnumber and substr(s.dairport,1,instr(s.dairport,'.')-1)=dap and substr(s.aairport,1,instr(s.aairport,'.')-1)=aap and to_char(s.ddate,'yymmdd')=dd and sn.seat_grade='프레스티지석'
) 남은프레스티지석수 , 
a.NCLA_COUNT -(select count(p.renum)  from scplane s,airplane a ,payrefund p,seat_num sn where s.asnum=a.asnum and s.renum=p.renum and sn.asnum=s.asnum and sn.seat_num=p.seatnumber and substr(s.dairport,1,instr(s.dairport,'.')-1)=dap and substr(s.aairport,1,instr(s.aairport,'.')-1)=aap and to_char(s.ddate,'yymmdd')=dd and sn.seat_grade='일반석'
) 남은일반석수, 
d.fare 정상운임 from scplane s,airplane a , dfare d 
where s.asnum=a.asnum 
and substr(s.dairport,1,instr(s.dairport,'.')-1)=dap and substr(s.aairport,1,instr(s.aairport,'.')-1)=aap  and sgrade = d.sg 
and to_char(s.ddate,'yymmdd')=dd and d.peak = CASE
        WHEN to_char(s.ddate, 'yymmdd') = to_date('240101','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_date('240208','yymmdd') AND to_date('240213','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_date('240224','yymmdd') AND to_date('240302','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_date('240503','yymmdd') AND to_date('240506','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') = to_date('240515','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_Date('240606','yymmdd') AND to_date('240608','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_Date('240727','yymmdd') AND to_date('240824','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_Date('240913','yymmdd')AND to_Date('240919','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_Date('241003','yymmdd') AND to_Date('241005','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') = to_Date('241009','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') = to_Date('241225','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') = to_Date('241231','yymmdd') THEN '성수기'
        else '비수기'
        end
    and d.discount = '정상' and d.sg=sgrade and substr(d.route,1,instr(d.route,'/')-1)=dap and substr(d.route,instr(d.route,'-')+1,instr(d.route,'/',-1)-instr(d.route,'-')-1)=aap and 
      d.timezone = case when to_char( s.ddate , 'hh24mi') >= '1500' then '일반' else '선호' end  and d.wknddy  = case to_char(s.ddate , 'dy') when '월' then '주중' when '화' then '주중' when '수' then '주중' when '목' then '주중' else '주말' end;
   rec vreserv%ROWTYPE;
begin
     open vreserv;
       FETCH vreserv INTO rec;
     if vreserv%notfound then
        raise no_data_found ;
        close vreserv;
        end if;
          close vreserv;
        for rec in vreserv loop 
            dbms_output.put_line('출발시각 :'|| rec.출발시각 || ' 도착시각 : ' ||rec.도착시각 || ' 출발공항 :'|| rec.출발공항 ||' 도착공항 :'||rec.도착공항 || ' 소요시간 : '|| rec.소요시간 ||' 정상 운임 : ' ||rec.정상운임 ||' 남은 일등석 갯수 :'|| rec.남은일등석수 ||' 남은 프레스티지석 갯수 :'||rec.남은프레스티지석수||' 남은 일반석 갯수 :'|| rec.남은일반석수  );
        end loop;
        
        exception 
            when no_data_found then
            dbms_output.put_line('해당하는 예약 가능한 일정이 없습니다.');
            when others then
            dbms_output.put_line('입력 오류입니다.');
end;

exec mk_scplane_01 ('SEOUL','JEJU','240328',1,'일반석');
exec mk_scplane_01 ('SEOUL','JEJU','240323',1,'일반석');
exec mk_scplane_01 ('SEOUL','JEJU','240411',1,'일반석');
--
--예약 (결제 ) 기능 
drop sequence mk_payrefundseq;
     create sequence mk_payrefundseq 
     start with 1 increment by 1 ;
create or replace procedure mk_payrefund_01
(
    pddate varchar2,
    pdairport scplane.dairport%type,
    paairport scplane.aairport%type,
    pseatnum payrefund.seatnumber%type default null,
    pnum number,
    pflight payrefund.flight%type,
    ppmethod payrefund.pmethod%type,
    pnluggage payrefund.nluggage%type,
    PCARDNUM PAYrefund.giftcardnumber%type default null
)

is
    vrenum scplane.renum%type;
    vcost payrefund.cost%type;
    vpnum payrefund.seatnumber%type;
    occupfiederror exception; 
    nocard exception; 
    nocardamount exception; 
    nomile exception; 
    vamount number;
    cardnumc payrefund.giftcardnumber%type;
    vmile number;
    vuserid varchar2(100);
begin
     select userid into vuserid from loginhis ;
     select 
         count(seatnumber)  into vpnum from payrefund p ,scplane s where p.renum = (select renum from scplane s where to_char(s.ddate ,'YYMMDDhh24mi') =pddate) and pseatnum=p.seatnumber ;
     if  vpnum !=0 then
         raise occupfiederror;
        end if;
        select count(card_num) into cardnumc from giftcard ;
         if  cardnumc !=1  and ppmethod = '기프트카드' then
         raise  nocard ;
        end if;
    select renum  into vrenum from scplane s where to_char(s.ddate ,'YYMMDDhh24mi') =pddate
    and substr(s.dairport,instr(s.dairport,'.')+1) = pdairport and  substr(s.aairport,instr(s.aairport,'.')+1) = paairport ;
    select d.fare 정상운임 into vcost from scplane s,dfare d 
where s.renum=vrenum and d.peak = CASE
        WHEN to_char(s.ddate, 'yymmdd') = to_date('240101','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_date('240208','yymmdd') AND to_date('240213','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_date('240224','yymmdd') AND to_date('240302','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_date('240503','yymmdd') AND to_date('240506','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') = to_date('240515','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_Date('240606','yymmdd') AND to_date('240608','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_Date('240727','yymmdd') AND to_date('240824','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_Date('240913','yymmdd')AND to_Date('240919','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_Date('241003','yymmdd') AND to_Date('241005','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') = to_Date('241009','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') = to_Date('241225','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') = to_Date('241231','yymmdd') THEN '성수기'
        else '비수기'
        end
    and d.discount = '정상' and substr(d.route,instr(d.route,'/')+1,instr(d.route,'-')-instr(d.route,'/')-1)=pdairport and substr(d.route,instr(d.route,'/',-1)+1)=paairport and 
      d.timezone = case when to_char( s.ddate , 'hh24mi') >= '1500' then '일반' else '선호' end  and d.wknddy  = case to_char(s.ddate , 'dy') when '월' then '주중' when '화' then '주중' when '수' then '주중' when '목' then '주중' else '주말' end;
    
     if ppmethod = '기프트카드' then 
      select amount into vamount from giftcard where card_num = pcardnum; 
        if vamount <vcost then 
        raise nocardamount ;
        end if;
        end if;
      
        vcost := (case when pflight = '할인' then vcost*0.85 when pflight = '특가' then vcost *0.55 else vcost end);
          if ppmethod = '마일리지' then
            select totalmile into vmile from userdetail where userid = vuserid;
            if vmile<vcost then 
                raise nomile;
                end if;
            end if ;
    insert into payrefund  values
    (mk_payrefundseq.nextval, '결제', ppmethod , pflight, pseatnum ,sysdate , pnluggage ,round(vcost,-2), round(vcost*0.005,-1) ,vuserid, vrenum, pcardnum);
    dbms_output.put_line('예약이 완료되었습니다.');
    exception
        when no_data_found then
        dbms_output.put_line('예약가능한 일정이 없습니다');
        when occupfiederror then
         dbms_output.put_line('해당 좌석은 이미 예약되어있습니다.');
          when nocard then
         dbms_output.put_line('입력하신 기프트카드가 없습니다.');
         when nocardamount then
          dbms_output.put_line('기프트카드 잔액이 부족합니다.');
          when nomile then
          dbms_output.put_line('마일리지 잔액이 부족합니다.');
end;

exec mk_payrefund_01('2403231515','GMP','CJU','20A',1,'정상','카드',1);

select * from loginhis;
select * from adminstrator;
select * from userdetail;
select * from scplane;
SELECT * FROM GIFTCARD;
update giftcard set amount=50000 where sender = '김철수' ;
select * from payrefund;
SELECT * FROM MTRACKING;
DELETE CARD_USE WHERE 1=1;
SELECT * FROM CARD_USE;
select to_char(ddate,'hh24mi') from scplane;
delete payrefund where 1=1;








-----------------------------맑음 --------------------------------------------------
-----------------------------맑음 --------------------------------------------------
-----------------------------맑음 --------------------------------------------------
-----------------------------맑음 --------------------------------------------------
-----------------------------맑음 --------------------------------------------------
-----------------------------맑음 --------------------------------------------------
-----------------------------맑음 --------------------------------------------------
-----------------------------맑음 --------------------------------------------------
-----------------------------맑음 --------------------------------------------------
-- 지역별 서비스 조회쿼리
CREATE OR REPLACE PROCEDURE se_cservice_01
(
 parea cservice.area%TYPE
)
IS
BEGIN
 FOR vrow IN ( SELECT * 
 FROM cservice
 WHERE area = parea)
 LOOP
 IF vrow.cs_call2 IS NULL THEN
 DBMS_OUTPUT.PUT_LINE(vrow.country_name||'('||vrow.cs_num||')');
 DBMS_OUTPUT.PUT_LINE('전화번호 : ' || vrow.cs_call1);
 DBMS_OUTPUT.PUT_LINE('언어/시간 : ' || vrow.lang_time);
 DBMS_OUTPUT.PUT_LINE(' ');
 ELSE
 DBMS_OUTPUT.PUT_LINE(vrow.country_name||'('||vrow.cs_num||')');
 DBMS_OUTPUT.PUT_LINE('전화번호 : ' || vrow.cs_call1 || ',' || vrow.cs_call2);
 DBMS_OUTPUT.PUT_LINE('언어/시간 : ' || vrow.lang_time);
 DBMS_OUTPUT.PUT_LINE(' ');
 END IF;
 END LOOP;
END;

EXEC SE_CSERVICE_01('한국');
EXEC SE_CSERVICE_01('동북아시아');

-- 공지사항 수정을 위한 프로시저
CREATE OR REPLACE PROCEDURE ye_Notice_01(
    p_Notice_num IN VARCHAR2,
    p_New_Title IN VARCHAR2
)
AS
BEGIN
    UPDATE Notice
    SET Notice_title = p_New_Title
    WHERE Notice_num = p_Notice_num;
    
    -- 수정된 데이터 출력
    DBMS_OUTPUT.PUT_LINE('Notice_num: ' || p_Notice_num || ', Notice_title: ' || p_New_Title || ' - 제목이 성공적으로 변경되었습니다.');
    
    COMMIT;
END;
-- 공지사항 생성을 위한 프로시저
CREATE OR REPLACE PROCEDURE ye_Notice_01(
    p_Notice_num IN VARCHAR2,
    p_Notice_title IN VARCHAR2,
    p_Notice_contents IN CLOB,
    p_Notice_topic IN VARCHAR2,
    p_AdminID IN VARCHAR2
)
AS
BEGIN
    INSERT INTO Notice (Notice_num, Notice_title, Notice_contents, Notice_topic, AdminID)
    VALUES (p_Notice_num, p_Notice_title, p_Notice_contents, p_Notice_topic, p_AdminID);
    DBMS_OUTPUT.PUT_LINE('"새로운 공지사항이 추가되었습니다."');
    COMMIT;
END;


SET SERVEROUTPUT ON;
BEGIN
    ye_Notice_01('10', '새로운 공지사항', '새로운 내용', '새로운 주제', 'admin003');
END;
/
SET SERVEROUTPUT ON;
DECLARE
    notice_cursor SYS_REFCURSOR;
BEGIN
    ye_Notice_02('10', notice_cursor);
END;


-- 공지사항 조회을 위한 프로시저
CREATE OR REPLACE PROCEDURE ye_Notice_02(
    p_Notice_num IN VARCHAR2,
    p_Notice OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN p_Notice FOR
    SELECT *
    FROM Notice
    WHERE Notice_num = p_Notice_num;
    DBMS_OUTPUT.PUT_LINE('"공지사항을 출력했습니다."');
    FOR notice_rec IN (SELECT * FROM Notice WHERE Notice_num = p_Notice_num) LOOP
        DBMS_OUTPUT.PUT_LINE('Notice_num: ' || notice_rec.Notice_num || ', Notice_title: ' || notice_rec.Notice_title || ', Notice_contents: ' || notice_rec.Notice_contents || ', Notice_topic: ' || notice_rec.Notice_topic || ', AdminID: ' || notice_rec.AdminID);
    END LOOP;
END;
SET SERVEROUTPUT ON;
DECLARE
    notice_cursor SYS_REFCURSOR;
BEGIN
    ye_Notice_02('1', notice_cursor);
END;

-- 공지사항 수정을 위한 프로시저
CREATE OR REPLACE PROCEDURE ye_Notice_03(
    p_Notice_num IN VARCHAR2,
    p_New_Title IN VARCHAR2
)
AS
BEGIN
    UPDATE Notice
    SET Notice_title = p_New_Title
    WHERE Notice_num = p_Notice_num;
    DBMS_OUTPUT.PUT_LINE('Notice_num: ' || p_Notice_num || ', Notice_title: ' || p_New_Title || ' - 제목이 성공적으로 변경되었습니다.');
    COMMIT;
END;

SET SERVEROUTPUT ON;
BEGIN
    UpdateNoticeTitle('1', '세관신고 절차 복잡다난해짐');
END;


-- 공지사항 삭제를 위한 프로시저
CREATE OR REPLACE PROCEDURE ye_Notice_04(
    p_Notice_num IN VARCHAR2
)
AS
BEGIN
    DELETE FROM Notice
    WHERE Notice_num = p_Notice_num;
    DBMS_OUTPUT.PUT_LINE('"공지사항이 삭제되었습니다."');
    COMMIT;
END;

SET SERVEROUTPUT ON;
BEGIN
    ye_Notice_04('3');
END;

--국제선 기본운임 작성 쿼리
--EXEC  up_createifare('ICN', 'FUK', '일반석', 150000, 110000, 20300, 21000, 'admin004');
--                    (keynum, starta, arrive, sg, fare, redis, tax, fuelch, adminid)

CREATE OR REPLACE PROCEDURE up_createifare (
    
    p_starta IN VARCHAR2,
    p_arrive IN VARCHAR2,
    p_sg IN VARCHAR2,
    p_fare IN NUMBER,
    p_redis IN NUMBER,
    p_tax IN NUMBER,
    p_fuelch IN NUMBER,
    p_adminid IN VARCHAR2
    )
IS
    v_admin_count NUMBER;
    v_keynum ifare.keynum%TYPE;
BEGIN
    -- 관리자 권한 확인
    SELECT COUNT(*)
    INTO v_admin_count
    FROM Adminstrator
    WHERE AdminID = p_adminid;

    IF v_admin_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('해당 관리자는 권한이 없습니다.');
        RETURN;
    END IF;

    -- KEYNUM 값 한개씩 증가
    SELECT NVL(MAX(keynum), 0) + 1 INTO v_keynum FROM ifare;

    -- 운임 정보 작성
    INSERT INTO ifare (keynum, starta, arrive, sg, fare, redis, tax, fuelch, adminid)
    VALUES (v_keynum, p_starta, p_arrive, p_sg, p_fare, p_redis, p_tax, p_fuelch, p_adminid);
    DBMS_OUTPUT.PUT_LINE('운임 정보가 성공적으로 추가되었습니다.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('해당하는 관리자가 없습니다.');
END;

------------------------------------------------------------------------------
SELECT *
FROM ifare;
EXEC up_updateifare(3, NULL, NULL, '쮸쀼', NULL, NULL, NULL, NULL, 'admin005');

--국제선 운임 테이블 수정쿼리
--EXEC up_updateifare(3, 'IC', 'FU', '반석', 333333, 333333, 33333, 33333, 'admin001');
--                   (keynum, starta, arrive, sg, fare, redis, tax, fuelch, adminid)
--EXEC up_updateifare(3, NULL, NULL, '쮸쀼', NULL, NULL, NULL, NULL, 'admin005');
--                  일부만 수정하고싶을때에는 NULL값을 준다.
--                  수정의 경우 adminid는 권한확인에만 쓰임
CREATE OR REPLACE PROCEDURE up_updateifare (
    p_keynum IN NUMBER,
    p_starta IN VARCHAR2 DEFAULT NULL,
    p_arrive IN VARCHAR2 DEFAULT NULL,
    p_sg IN VARCHAR2 DEFAULT NULL,
    p_fare IN NUMBER DEFAULT NULL,
    p_redis IN NUMBER DEFAULT NULL,
    p_tax IN NUMBER DEFAULT NULL,
    p_fuelch IN NUMBER DEFAULT NULL,
    p_adminid IN VARCHAR2
)
IS
    v_admin_count NUMBER;
BEGIN
    -- 관리자 권한 확인
    SELECT COUNT(*)
    INTO v_admin_count
    FROM Adminstrator
    WHERE AdminID = p_adminid;

    IF v_admin_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('해당 관리자는 권한이 없습니다.');
        RETURN;
    END IF;

    -- 매개변수가 NULL이 아니면 해당 값으로 수정
    UPDATE ifare
    SET starta = COALESCE(p_starta, starta),
        arrive = COALESCE(p_arrive, arrive),
        sg = COALESCE(p_sg, sg),
        fare = COALESCE(p_fare, fare),
        redis = COALESCE(p_redis, redis),
        tax = COALESCE(p_tax, tax),
        fuelch = COALESCE(p_fuelch, fuelch)
    WHERE keynum = p_keynum;
    
    DBMS_OUTPUT.PUT_LINE('운임 정보가 성공적으로 수정되었습니다.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('해당하는 관리자가 없습니다.');
END;
------------------------------------------------------------------------------
--국제선 운임 테이블 삭제 프로시저
--EXEC up_deleteifare(3, 'admin001');
CREATE OR REPLACE PROCEDURE up_deleteifare (
    p_keynum IN ifare.keynum%TYPE,
    p_adminid IN VARCHAR2
)
IS
    v_admin_count NUMBER;
BEGIN
    -- 관리자 권한 확인
    SELECT COUNT(*)
    INTO v_admin_count
    FROM Adminstrator
    WHERE AdminID = p_adminid;

    IF v_admin_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('해당 관리자는 권한이 없습니다.');
        RETURN;
    END IF;

    -- 운임 정보 삭제
    DELETE FROM ifare
    WHERE keynum = p_keynum;
    DBMS_OUTPUT.PUT_LINE('운임 정보가 성공적으로 삭제되었습니다.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('해당하는 운임 정보가 없습니다.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('운임 정보를 삭제하는 도중 오류가 발생했습니다.');
END;



delete yesno
where userid='user006';
delete flightuser
where userid='user006';

drop sequence yesnoseq;
select * from yesno;
select * from flightuser;


commit;
delete flightuser
where userid='user007';

SELECT * FROM SCPLANE;
SELECT * FROM FLIGHTUSER;
select * from adminstrator;
select * from dfare;
select * from ifare;
select * from notice;
select * from airplane;
SELECT * FROM S_Grade;
SELECT * FROm Rfamily;
SELECT * FROM userdetail;
SELECT * fROM Mtracking;
select * from CARD_USE;






------------------------------------------------------------------------------

--국제선 기본운임 작성 쿼리
--EXEC  up_createifare('ICN', 'FUK', '일반석', 150000, 110000, 20300, 21000, '#admin003');
--                    (keynum, starta, arrive, sg, fare, redis, tax, fuelch, adminid)
SELECT *
FROM ifare;
CREATE OR REPLACE PROCEDURE up_createifare (
    
    p_starta IN VARCHAR2,
    p_arrive IN VARCHAR2,
    p_sg IN VARCHAR2,
    p_fare IN NUMBER,
    p_redis IN NUMBER,
    p_tax IN NUMBER,
    p_fuelch IN NUMBER,
    p_adminid IN VARCHAR2
    )
IS
    v_admin_count NUMBER;
    v_keynum ifare.keynum%TYPE;
BEGIN
    -- 관리자 권한 확인
    SELECT COUNT(*)
    INTO v_admin_count
    FROM Adminstrator
    WHERE AdminID = p_adminid;

    IF v_admin_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('해당 관리자는 권한이 없습니다.');
        RETURN;
    END IF;

    -- KEYNUM 값 한개씩 증가
    SELECT NVL(MAX(keynum), 0) + 1 INTO v_keynum FROM ifare;

    -- 운임 정보 작성
    INSERT INTO ifare (keynum, starta, arrive, sg, fare, redis, tax, fuelch, adminid)
    VALUES (v_keynum, p_starta, p_arrive, p_sg, p_fare, p_redis, p_tax, p_fuelch, p_adminid);
    DBMS_OUTPUT.PUT_LINE('운임 정보가 성공적으로 추가되었습니다.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('해당하는 관리자가 없습니다.');
END;

------------------------------------------------------------------------------



--국제선 운임 테이블 수정쿼리
--EXEC up_updateifare(3, 'IC', 'FU', '반석', 333333, 333333, 33333, 33333, '#admin001');
--                   (keynum, starta, arrive, sg, fare, redis, tax, fuelch, adminid)
--EXEC up_updateifare(3, NULL, NULL, '쮸쀼', NULL, NULL, NULL, NULL, '#admin005');
--                  일부만 수정하고싶을때에는 NULL값을 준다.
--                  수정의 경우 adminid는 권한확인에만 쓰임
CREATE OR REPLACE PROCEDURE up_updateifare (
    p_keynum IN NUMBER,
    p_starta IN VARCHAR2 DEFAULT NULL,
    p_arrive IN VARCHAR2 DEFAULT NULL,
    p_sg IN VARCHAR2 DEFAULT NULL,
    p_fare IN NUMBER DEFAULT NULL,
    p_redis IN NUMBER DEFAULT NULL,
    p_tax IN NUMBER DEFAULT NULL,
    p_fuelch IN NUMBER DEFAULT NULL,
    p_adminid IN VARCHAR2
)
IS
    v_admin_count NUMBER;
BEGIN
    -- 관리자 권한 확인
    SELECT COUNT(*)
    INTO v_admin_count
    FROM Adminstrator
    WHERE AdminID = p_adminid;

    IF v_admin_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('해당 관리자는 권한이 없습니다.');
        RETURN;
    END IF;

    -- 매개변수가 NULL이 아니면 해당 값으로 수정
    UPDATE ifare
    SET starta = COALESCE(p_starta, starta),
        arrive = COALESCE(p_arrive, arrive),
        sg = COALESCE(p_sg, sg),
        fare = COALESCE(p_fare, fare),
        redis = COALESCE(p_redis, redis),
        tax = COALESCE(p_tax, tax),
        fuelch = COALESCE(p_fuelch, fuelch)
    WHERE keynum = p_keynum;
    
    DBMS_OUTPUT.PUT_LINE('운임 정보가 성공적으로 수정되었습니다.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('해당하는 관리자가 없습니다.');
END;
------------------------------------------------------------------------------
--국제선 운임 테이블 삭제 프로시저
--EXEC up_deleteifare(3, '#admin001');
--EXEC up_deleteifare('3~5', '#admin001');
--EXEC up_deleteifare('4,8', '#admin001');
--한개의 행만 지울때에는 숫자를 매개변수로 받고
--두개이상 혹은 범위의 행을 지울때에는 ,와 ~를 입력한 문자열로 매개변수를 줄 수 있다.
CREATE OR REPLACE PROCEDURE up_deleteifare (
    p_range_or_nums IN VARCHAR2,
    p_adminid IN VARCHAR2
)
IS
    v_admin_count NUMBER;
    v_deleted_count NUMBER := 0;
BEGIN
    -- 관리자 권한 확인
    SELECT COUNT(*)
    INTO v_admin_count
    FROM Adminstrator
    WHERE AdminID = p_adminid;

    IF v_admin_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('해당 관리자는 권한이 없습니다.');
        RETURN;
    END IF;

    -- 쉼표로 구분된 키넘들 파싱하여 삭제
    IF INSTR(p_range_or_nums, '~') > 0 THEN -- 범위 형태로 받은 경우
        FOR i IN (
            SELECT TO_NUMBER(REGEXP_SUBSTR(p_range_or_nums, '\d+', 1, 1)) AS start_keynum,
                   TO_NUMBER(REGEXP_SUBSTR(p_range_or_nums, '\d+', 1, 2)) AS end_keynum
            FROM dual
        ) LOOP
            FOR j IN i.start_keynum..i.end_keynum LOOP
                DELETE FROM ifare -- ifare 테이블명 수정
                WHERE keynum = j;
                v_deleted_count := v_deleted_count + SQL%ROWCOUNT;
            END LOOP;
        END LOOP;
    ELSE -- 쉼표로 구분된 키넘들을 받은 경우 또는 단일 키넘을 받은 경우
        FOR i IN (
            SELECT TO_NUMBER(REGEXP_SUBSTR(p_range_or_nums, '\d+', 1, LEVEL)) AS keynum
            FROM dual
            CONNECT BY LEVEL <= REGEXP_COUNT(p_range_or_nums, '\d+')
        ) LOOP
            DELETE FROM ifare -- ifare 테이블명 수정
            WHERE keynum = i.keynum;
            v_deleted_count := v_deleted_count + SQL%ROWCOUNT;
        END LOOP;
    END IF;

    -- 삭제된 행 수가 0이면 해당하는 운임 정보가 없다고 출력
    IF v_deleted_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('해당하는 운임 정보가 없습니다.');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_deleted_count || '개의 운임 정보가 성공적으로 삭제되었습니다.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('운임 정보를 삭제하는 도중 오류가 발생했습니다.');
END;















SELECT *
FROM Adminstrator;
DELETE FROM Adminstrator
WHERE adminid IN (#admin001,#admin002,#admin003,#admin004,#admin005) ;
--------------------------------------------------------------------------------------------------------
--국내선 기본운임 작성 쿼리
EXEC up_createdfare('성수기', '특가', '선호', '일반석', '서울/광주', 50000, 1000, '#admin005', '주말');
--                    (keynum, starta, arrive, sg, fare, redis, tax, fuelch, adminid)
CREATE OR REPLACE PROCEDURE up_createdfare (
    p_peak IN VARCHAR2,
    p_discount IN VARCHAR2,
    p_timezone IN VARCHAR2,
    p_sg IN VARCHAR2,
    p_route IN VARCHAR2,
    p_fare IN NUMBER,
    p_redis IN NUMBER,
    p_adminid IN VARCHAR2,
    p_wknddy IN VARCHAR2
)
IS
    v_admin_count NUMBER;
    v_keynum dfare.keynum%TYPE;
BEGIN
    -- 관리자 권한 확인
    SELECT COUNT(*)
    INTO v_admin_count
    FROM Adminstrator
    WHERE AdminID = p_adminid;

    IF v_admin_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('해당 관리자는 권한이 없습니다.');
        RETURN;
    END IF;

    -- KEYNUM 값 설정
    SELECT NVL(MAX(keynum), 0) + 1 INTO v_keynum FROM dfare;

    -- 운임 정보 작성
    INSERT INTO dfare (keynum, peak, discount, timezone, sg, route, fare, redis, adminid, wknddy)
    VALUES (v_keynum, p_peak, p_discount, p_timezone, p_sg, p_route, p_fare, p_redis, p_adminid, p_wknddy);

    DBMS_OUTPUT.PUT_LINE('운임 정보가 성공적으로 추가되었습니다.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('해당하는 관리자가 없습니다.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('운임 정보를 추가하는 도중 오류가 발생했습니다.');
END;



--------------------------------------------------------------------------------------------------------

--국내선 운임 수정 프로시저
--EXEC up_updatedfare(4, NULL, NULL, NULL, NULL, NULL, 888500, NULL, '#admin001', '호에에엑');
--                  (keynum, peak, discount, timezone, sg, route, fare, redis, adminid, wknddy)
--                  매개변수로 수정하고싶은 값을 주거나, NULL을 입력하여 원래의 값이 변경되지 않게 할 수 있다.

CREATE OR REPLACE PROCEDURE up_updatedfare (
    p_keynum IN dfare.keynum%TYPE,
    p_peak IN VARCHAR2 DEFAULT NULL,
    p_discount IN VARCHAR2 DEFAULT NULL,
    p_timezone IN VARCHAR2 DEFAULT NULL,
    p_sg IN VARCHAR2 DEFAULT NULL,
    p_route IN VARCHAR2 DEFAULT NULL,
    p_fare IN NUMBER DEFAULT NULL,
    p_redis IN NUMBER DEFAULT NULL,
    p_adminid IN VARCHAR2,
    p_wknddy IN VARCHAR2 DEFAULT NULL
)
IS
    v_admin_count NUMBER;
BEGIN
    -- 관리자 권한 확인
    SELECT COUNT(*)
    INTO v_admin_count
    FROM Adminstrator
    WHERE AdminID = p_adminid;

    IF v_admin_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('해당 관리자는 권한이 없습니다.');
        RETURN;
    END IF;

    -- 운임 정보 수정
    UPDATE dfare
    SET peak = COALESCE(p_peak, peak),
        discount = COALESCE(p_discount, discount),
        timezone = COALESCE(p_timezone, timezone),
        sg = COALESCE(p_sg, sg),
        route = COALESCE(p_route, route),
        fare = COALESCE(p_fare, fare),
        redis = COALESCE(p_redis, redis),
        wknddy = COALESCE(p_wknddy, wknddy)
    WHERE keynum = p_keynum;

    DBMS_OUTPUT.PUT_LINE('운임 정보가 성공적으로 수정되었습니다.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('해당하는 운임 정보가 없습니다.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('운임 정보를 수정하는 도중 오류가 발생했습니다.');
END;


--------------------------------------------------------------------------------------------------------
--국내선 운임정보 삭제 프로시저
--EXEC up_deletedfare(13, '#admin001');
--keynum값과 관리자ID를 매개변수로 받아 해당 행의 정보를 삭제
--EXEC up_deletedfare('9~13', '#admin001');
--                  문자열로 숫자와 숫자 사이에 '~' 를 입력한 값을 주면 다수행의 삭제가 가능
--EXEC up_deletedfare('9,13,4,7', '#admin001');
--                  ','를 주면 해당하는 번호만 골라서 삭제 가능
CREATE OR REPLACE PROCEDURE up_deletedfare (
    p_range_or_nums IN VARCHAR2,
    p_adminid IN VARCHAR2
)
IS
    v_admin_count NUMBER;
    v_deleted_count NUMBER := 0;
BEGIN
    -- 관리자 권한 확인
    SELECT COUNT(*)
    INTO v_admin_count
    FROM Adminstrator
    WHERE AdminID = p_adminid;

    IF v_admin_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('해당 관리자는 권한이 없습니다.');
        RETURN;
    END IF;

    -- 쉼표로 구분된 키넘들 파싱하여 삭제
   IF INSTR(p_range_or_nums, '~') > 0 THEN -- 범위 형태로 받은 경우
    FOR i IN (
        SELECT TO_NUMBER(REGEXP_SUBSTR(p_range_or_nums, '\d+', 1, 1)) AS start_keynum,
               TO_NUMBER(REGEXP_SUBSTR(p_range_or_nums, '\d+', 1, 2)) AS end_keynum
        FROM dual
    ) LOOP
        FOR j IN i.start_keynum..i.end_keynum LOOP
            DELETE FROM dfare -- dfare 테이블명 수정
            WHERE keynum = j;
            v_deleted_count := v_deleted_count + SQL%ROWCOUNT;
        END LOOP;
    END LOOP;
ELSE -- 쉼표로 구분된 키넘들을 받은 경우 또는 단일 키넘을 받은 경우
    FOR i IN (
        SELECT TO_NUMBER(REGEXP_SUBSTR(p_range_or_nums, '\d+', 1, LEVEL)) AS keynum
        FROM dual
        CONNECT BY LEVEL <= REGEXP_COUNT(p_range_or_nums, '\d+')
    ) LOOP
        DELETE FROM dfare -- dfare 테이블명 수정
        WHERE keynum = i.keynum;
        v_deleted_count := v_deleted_count + SQL%ROWCOUNT;
    END LOOP;
END IF;

    -- 삭제된 행 수가 0이면 해당하는 운임 정보가 없다고 출력
    IF v_deleted_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('해당하는 운임 정보가 없습니다.');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_deleted_count || '개의 운임 정보가 성공적으로 삭제되었습니다.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('운임 정보를 삭제하는 도중 오류가 발생했습니다.');
END;










--


















--
--CREATE OR REPLACE PROCEDURE up_deletedfare (
--    p_keynum IN dfare.keynum%TYPE,
--    p_adminid IN VARCHAR2
--)
--IS
--    v_admin_count NUMBER;
--    v_deleted_count NUMBER;
--BEGIN
--    -- 관리자 권한 확인
--    SELECT COUNT(*)
--    INTO v_admin_count
--    FROM Adminstrator
--    WHERE AdminID = p_adminid;
--
--    IF v_admin_count = 0 THEN
--        DBMS_OUTPUT.PUT_LINE('해당 관리자는 권한이 없습니다.');
--        RETURN;
--    END IF;
--
--    -- 운임 정보 삭제
--    DELETE FROM dfare
--    WHERE keynum = p_keynum;
--
--    -- 삭제된 행 수 확인
--    v_deleted_count := SQL%ROWCOUNT;
--
--    IF v_deleted_count = 0 THEN
--        DBMS_OUTPUT.PUT_LINE('해당하는 운임 정보가 없습니다.');
--    ELSE
--        DBMS_OUTPUT.PUT_LINE('운임 정보가 성공적으로 삭제되었습니다.');
--    END IF;
--EXCEPTION
--    WHEN OTHERS THEN
--        DBMS_OUTPUT.PUT_LINE('운임 정보를 삭제하는 도중 오류가 발생했습니다.');
--END;

----------------------------------------------------------------------------------------------------------------

--SELECT *
--FROM ifare
--WHERE starta = 'ICN'
--AND arrive = 'PEK'
--AND sg = '일반석';
--DESC dfare;
--DESC ifare;
--
--
----국제선 운임정보 조회 프로시저
----매개변수 출발지, 도착지, 좌석등급
----EXEC up_ifareinfo( 'ICN', 'PEK', '일반석' );
----해당하는 정보가 두개 이상인 경우 모두 출력되도록 변경
--DROP PROCEDURE up_ifareinfo;
--CREATE OR REPLACE PROCEDURE up_ifareinfo (
--    p_starta IN VARCHAR2,
--    p_arrive IN VARCHAR2,
--    p_sg IN VARCHAR2
--)
--IS
--    CURSOR fare_cursor IS
--        SELECT fare, redis, tax, fuelch
--        FROM ifare
--        WHERE starta = p_starta
--        AND arrive = p_arrive
--        AND sg = p_sg;
--    
--    v_fare ifare.fare%TYPE;
--    v_redis ifare.redis%TYPE;
--    v_tax ifare.tax%TYPE;
--    v_fuelch ifare.fuelch%TYPE;
--    v_row_count NUMBER := 0;
--BEGIN
--    OPEN fare_cursor;
--    LOOP
--        FETCH fare_cursor INTO v_fare, v_redis, v_tax, v_fuelch;
--        EXIT WHEN fare_cursor%NOTFOUND;
--        
--        DBMS_OUTPUT.PUT_LINE('검색하신 ' || p_starta || '에서 출발하여 ' ||  p_arrive || '까지 운행되는 ' ||  p_sg || ' 좌석의 운임 정보입니다' );
--        DBMS_OUTPUT.PUT_LINE('운임 : ' || v_fare || '원');
--        DBMS_OUTPUT.PUT_LINE('환불액 : ' || v_redis|| '원');
--        DBMS_OUTPUT.PUT_LINE('세금 : ' || v_tax|| '원');
--        DBMS_OUTPUT.PUT_LINE('유류할증 : ' || v_fuelch|| '원');
--        DBMS_OUTPUT.PUT_LINE('-------------------------------------');
--        
--        v_row_count := v_row_count + 1;
--    END LOOP;
--    CLOSE fare_cursor;
--
--    IF v_row_count = 0 THEN
--        DBMS_OUTPUT.PUT_LINE('해당하는 정보가 존재하지 않습니다.');
--    END IF;
--EXCEPTION
--    WHEN OTHERS THEN
--        DBMS_OUTPUT.PUT_LINE('오류 발생');
--END;
------------------------------------------------------------------------------------------------------------
SELECT *
FROM movie;



--테이블 수정
DROP TABLE Movie;
DROP TABLE TV;
DROP TABLE Music;
CREATE TABLE Movie (
    MovieID NUMBER PRIMARY KEY,
    Title varchar2(100) NOT NULL,
    Duration date NOT NULL,
    Category varchar2(100) NOT NULL,
    Content clob NOT NULL,
    Lang varchar2(20) NOT NULL
);
CREATE TABLE TV (
    TVID NUMBER PRIMARY KEY,
    Title varchar2(100) NOT NULL,
    duration date NOT NULL,
    cate varchar2(100) NOT NULL,
    content clob NOT NULL
);
CREATE TABLE Music (
    MusicID NUMBER PRIMARY KEY,
    Title varchar2(100) NOT NULL,
    Duration date NOT NULL,
    cate varchar2(100) NOT NULL,
    content clob NOT NULL
);
----------------------------------------------------------------------------------------------------
--영화 정보 작성 프로시저
EXEC up_create_movie('어른 김장하', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '다큐멘터리', '(다큐멘터리) 경남 진주의 어느 한약방, 그곳에는 60년 동안 한약방을 지킨 한약사 김장하 선생이 있다. 전 재산을 사회에 환원하고도 인터뷰 한 번 하지 않고 많은 이들을 도우면서도 자신의 옷 한 벌 허투루 사지 않는 그를 만나본다.', '한국어');
EXEC up_create_movie('아쿠아맨과 로스트 킹덤', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '액션', '세상을 뒤흔들 강력한 아이템을 손에 넣은 블랙 만타는 아버지를 죽인 원수 아쿠아맨을 무너뜨리려 한다.', '영어, 스페인어');
EXEC up_create_movie('화란', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '드라마', '(드라마) 새아버지의 반복되는 폭력으로 인해 돈을 모아 엄마와 같이 네덜란드로 떠나는 것이 유일한 희망인 소년 연규. 어느 날 동생을 지키기 위해 싸움을 벌이게 되고 합의금이 필요한 연규에게 조직의 중간 보스 치건이 도움을 준다.', '한국어');
EXEC up_create_movie('만추 리마스터링', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '로맨스', '(로맨스) 수인번호 2537번 애나는 7년째 수감 중, 어머니의 부고로 3일간의 휴가가 허락된다. 장례식에 가기 위해 탄 시애틀행 버스에 쫓기듯이 탄 훈이 차비를 빌린다. 훈은 돈을 갚고 찾아가겠다며 애나에게 억지로 시계를 채워준다.', '한국어');
EXEC up_create_movie('30일', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '코미디', '(코미디) 지성과 외모, 찌질함까지 타고난 정열은 능력과 커리어, 똘기까지 타고난 나라와 영화같은 사랑을 했지만 서로의 찌질함과 똘기를 견디다 못해 마침내 이혼을 결심한다. 그러나 이혼을 30일 앞둔 둘은 같이 교통사고를 당한다.', '한국어');
EXEC up_create_movie('거미집', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '코미디', '(코미디) 성공적이었던 데뷔작 이후, 악평과 조롱에 시달리던 김감독은 촬영이 끝난 영화 거미집의 새로운 결말에 대한 꿈을 며칠째 꾸고 있다. 그대로만 찍으면 틀림없이 걸작이 된다는 예감에 딱 이틀간의 추가 촬영을 꿈꾼다.', '한국어');
EXEC up_create_movie('천박사 퇴마 연구소: 설경의 비밀', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '드라마', '(판타지) 대대로 마을을 지켜 온 당주집 장손이지만 정작 귀신은 믿지 않는 가짜 퇴마사 천박사는 사람의 마음을 꿰뚫는 통찰력으로 가짜 퇴마를 하며, 의뢰받은 사건들을 해결한다. 의뢰인 유경이 찾아와 거절하기 힘든 제안을 한다.', '한국어');
EXEC up_create_movie('괴물', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '드라마', '싱글맘 사오리는 아들의 행동이 이상해지자 학교를 찾아가 선생님과 상담을 하는데, 그날 이후 선생님과 학생들의 분위기가 심상치 않게 흐르기 시작한다.', '일본어');
EXEC up_create_movie('넥스트 골 윈즈', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '드라마', '2001년 FIFA 월드컵에서 31 대 0으로 패배한 것으로 악명 높은 아메리칸사모아 국가대표팀과 이 팀에 새롭게 부임한 다혈질 감독의 유쾌한 도전 실화를 담은 영화.', '영어');
EXEC up_create_movie('오펜하이머', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '드라마', '핵을 개발한 과학자 오펜하이머의 삶을 그린 영화. 세상을 구할지도, 파괴할지도 모르는 오펜하이머의 이야기를 담았다.', '영어');
EXEC up_create_movie('1947 보스톤', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '드라마', '(드라마) 1936년 베를린 올림픽 마라톤 금메달리스트 손기정은 시상대에서 가슴에 단 일장기를 가려 일제의 탄압으로 더 이상 달릴 수 없게 된다. 광복 이후 촉망받는 마라토너 윤복에게 기정은 보스톤 마라톤 대회에 나가자고 제안한다.', '한국어');
EXEC up_create_movie('헝거게임: 노래하는 새와 뱀의 발라드', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '액션', '헝거게임 10회를 맞아 멘토제가 도입되자 스노우는 루시 그레이의 멘토가 되고, 선과 악 사이에서 본능과 싸운다.', '영어');
EXEC up_create_movie('범죄도시3', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '범죄', '(범죄) 베트남 납치 살해범 검거 후 7년 뒤, 마석도는 서울 광수대로 발탁되어 새로운 팀원들과 함께 살인사건을 조사한다. 사건 조사 중 석도는 신종 마약 사건이 연루되었음을 알게 되고 수사를 확대한다.', '한국어');
EXEC up_create_movie('트롤: 밴드 투게더', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '애니메이션', '파피의 남자친구이자 최고의 아이돌 그룹 브로존의 멤버였던 브랜치는 납치당한 메인 보컬을 구하기 위해 흩어져 있는 브로존 멤버들을 불러 모은다.', '한국어');
EXEC up_create_movie('트롤', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '애니메이션', '모두가 행복한 트롤 왕국에 우울 종결자 버겐이 쳐들어온다. 긍정 공주 파피는 납치된 친구들을 구하기 위해 걱정병 친구 브랜치와 위험천만한 모험을 떠난다.', '한국어');
EXEC up_create_movie('다운튼 애비 2', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '드라마', '전 세계적으로 인기 있는 TV 시리즈 "다운튼 애비"를 영화로 만든 작품.', '영어');
EXEC up_create_movie('에브리씽 에브리웨어 올 앳 원스', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '액션', '빨래방을 운영하는 중국계 미국인 에벌린은 남편의 이혼 요구와 반항하는 딸로 인해 혼란에 빠지는데, 어느 날 멀티버스 안에서 살아가는 수만 명의 자신을 발견하게 된다.', '영어');
SELECT *
FROM movie;
CREATE OR REPLACE PROCEDURE up_create_movie (
    p_Title IN Movie.Title%TYPE,
    p_Duration IN Movie.Duration%TYPE,
    p_Category IN Movie.Category%TYPE,
    p_Content IN Movie.Content%TYPE,
    p_Lang IN Movie.Lang%TYPE
)
AS
    v_MovieID NUMBER;
BEGIN
    SELECT NVL(MAX(MovieID), 0) + 1 INTO v_MovieID FROM Movie;
    
    INSERT INTO Movie (MovieID, Title, Duration, Category, Content, Lang)
    VALUES (v_MovieID, p_Title, p_Duration, p_Category, p_Content, p_Lang);
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('영화 정보가 성공적으로 추가되었습니다. MovieID: ' || v_MovieID);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('영화 정보를 추가하는 도중 오류가 발생했습니다: ' || SQLERRM);
        ROLLBACK;
END;
------------------------------------------------------------------------------------------------------------

--영화 정보 수정 프로시저
--EXEC up_update_movie(0001,'가', TO_DATE('2024-06-30', 'YYYY-MM-DD'),'다','라','마');
--매개변수로 기본키와 각각의 수정하고자 하는 내용을 문자열로 받음
--
--EXEC up_update_movie(0001,'가',TO_DATE,NULL,'라',NULL);
--NULL을 주면 값이 변하지 않는다.
CREATE OR REPLACE PROCEDURE up_update_movie (
    p_MovieID IN Movie.MovieID%TYPE,
    p_Title IN Movie.Title%TYPE,
    p_Duration IN Movie.Duration%TYPE,
    p_Category IN Movie.Category%TYPE,
    p_Content IN Movie.Content%TYPE,
    p_Lang IN Movie.Lang%TYPE
)
IS
BEGIN
    UPDATE Movie
    SET Title = COALESCE(p_Title, Title),
        Duration = COALESCE(p_Duration, Duration),
        Category = COALESCE(p_Category, Category),
        Content = COALESCE(p_Content, Content),
        Lang = COALESCE(p_Lang, Lang)
    WHERE MovieID = p_MovieID;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('해당하는 무비 아이디의 영화를 찾을 수 없습니다.');
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('영화 정보가 성공적으로 업데이트되었습니다.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('영화 정보를 업데이트하는 도중 오류가 발생했습니다: ' || SQLERRM);
        ROLLBACK;
END;
------------------------------------------------------------------------------------------------------------

--영화 정보 삭제 프로시저

SELECT *
FROM movie;
EXEC up_delete_movie('7');
EXEC up_delete_movie('18,27,30');
EXEC up_delete_movie('6~10');
CREATE OR REPLACE PROCEDURE up_delete_movie (
    p_MovieID IN VARCHAR2
)
IS
    v_deleted_count NUMBER := 0; -- 삭제된 행 수를 추적하기 위한 변수
BEGIN
    IF INSTR(p_MovieID, '~') > 0 THEN -- 범위 형태로 받은 경우
        FOR i IN (
            SELECT TO_NUMBER(REGEXP_SUBSTR(p_MovieID, '\d+', 1, 1)) AS start_MovieID,
                   TO_NUMBER(REGEXP_SUBSTR(p_MovieID, '\d+', 1, 2)) AS end_MovieID
            FROM dual
        ) LOOP
            FOR j IN i.start_MovieID..i.end_MovieID LOOP
                DELETE FROM Movie
                WHERE MovieID = j;
                v_deleted_count := v_deleted_count + SQL%ROWCOUNT;
            END LOOP;
        END LOOP;
    ELSE -- 쉼표로 구분된 키넘들을 받은 경우 또는 단일 키넘을 받은 경우
        FOR i IN (
            SELECT TO_NUMBER(REGEXP_SUBSTR(p_MovieID, '\d+', 1, LEVEL)) AS MovieID
            FROM dual
            CONNECT BY LEVEL <= REGEXP_COUNT(p_MovieID, '\d+')
        ) LOOP
            DELETE FROM Movie
            WHERE MovieID = i.MovieID;
            v_deleted_count := v_deleted_count + SQL%ROWCOUNT;
        END LOOP;
    END IF;

    IF v_deleted_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('해당하는 무비 아이디의 영화를 찾을 수 없습니다.');
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('영화 정보가 성공적으로 삭제되었습니다.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('영화 정보를 삭제하는 도중 오류가 발생했습니다: ' || SQLERRM);
        ROLLBACK;
END;
------------------------------------------------------------------------------------------------------------
--영화 정보 조회 프로시저
--EXEC up_movieinfo(202404);
--연도와 월을 여섯자리 숫자로 입력받아 해당 월에 시청 가능한 영화 정보 조회
CREATE OR REPLACE PROCEDURE up_movieinfo (
    p_YearMonth IN VARCHAR2
)
AS
    v_StartDate DATE;
    v_EndDate DATE;
BEGIN
    v_StartDate := TO_DATE(p_YearMonth || '01', 'YYYYMMDD');
    v_EndDate := LAST_DAY(v_StartDate);
    
    FOR movieinfo IN (
        SELECT Title, Duration, Category, Content, Lang
        FROM Movie
        WHERE TRUNC(Duration, 'MM') = v_StartDate
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('제목: ' || movieinfo.Title);
        DBMS_OUTPUT.PUT_LINE('시청가능일자: ' || TO_CHAR(movieinfo.Duration, 'YYYY-MM-DD'));
        DBMS_OUTPUT.PUT_LINE('장르: ' || movieinfo.Category);
        DBMS_OUTPUT.PUT_LINE('줄거리: ' || movieinfo.Content);
        DBMS_OUTPUT.PUT_LINE('언어: ' || movieinfo.Lang);
        DBMS_OUTPUT.PUT_LINE('---------------------------------------');
    END LOOP;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('해당 월에 시청 가능한 컨텐츠가 없습니다.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('컨텐츠 조회 중 오류가 발생했습니다: ' || SQLERRM);
END;
----------------------------------------------------------------------------------------------------

--EXEC up_create_TV('작은 불빛 시즌1 (1-2)', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '드라마', '제2차 세계대전 때 나치로부터 오토 프랑크의 가족을 숨겨준 젊고 발랄한 비서 미프 히스의 이야기를 담은 드라마.');
--EXEC up_create_TV('리버데일 시즌7 (1-5)', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '드라마', '저그헤드 존스와 그의 친구들은 1950년대로 가게 된다.');
--EXEC up_create_TV('1923 시즌1 (1-5)', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '드라마', '20세기 초반, 기록적인 가뭄과 대공황 등으로 역경과 고난이 휘몰아치던 서부 산맥에서 고군분투하는 더튼 가문의 이야기를 그린 드라마.');
--EXEC up_create_TV('로 앤 오더 성범죄전담반 시즌24 (1-5)', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '드라마', '올리비아 벤슨이 이끄는 뉴욕시 성범죄전담반의 이야기를 그린 드라마.');
--EXEC up_create_TV('씰팀 시즌6 (1-5)', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '드라마', '위험한 임무를 수행하는 미 해군 특수부대원들의 이야기를 그린 드라마.');
--EXEC up_create_TV('KBS 드라마 스페셜 2023 (1-3)', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '드라마', '다양하고 완성도 있는 이야기로 제작된 단편 드라마를 담은 프로그램.');
--EXEC up_create_TV('열녀박씨 계약결혼뎀', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '드라마', '죽음을 뛰어넘어 2023년 대한민국에 당도한 19세기 유교 걸 박연우와 21세기 무감정 끝판왕 강태하의 금쪽같은 계약 결혼 스토리.');
--EXEC up_create_TV('퍼즐 메이커 시즌1 (1-3)', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '드라마', '화가이자 퍼즐 제작가인 에릭 도들이 전 세계를 돌며 새로운 퍼즐의 조각들을 완성해 나간다.');
--EXEC up_create_TV('브루클린 나인-나인 시즌8 (1-5)', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '드라마', '형사 제이크 페랄타와 원칙주의자 서장 홀트가 있는 브루클린 99 관할 경찰서의 이야기를 그린 드라마.');
--EXEC up_create_TV('팍스 앤 레크리에이션 시즌7 (1-5)', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '드라마', '인디애나주 포니시의 공원휴양부에서 일하는 공무원 레슬리가 따분한 도시를 조금 더 재밌게 만들기 위해 끊임없이 노력하며 펼쳐지는 이야기.');
--EXEC up_create_TV('프렌즈 시즌10 (1-5)', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '시트콤', '뉴욕에 사는 여섯 청춘들의 다이내믹 한 일상을 그린 시트콤.');
--EXEC up_create_TV('태어난 김에 세계일주 3 (1-2)', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '예능', '태어난 김에 자신의 버킷리스트를 이뤄나가는 기안84, 이번엔 원시의 바다로 향한다! 태초의 자연을 품은 비밀의 섬, 마다가스카르! 바닷길 위 자유를 찾아 섬 타러 떠나는 "태계일주" 세 번째 여행!');
--EXEC up_create_TV('무한도전', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '12세 이상 관람가', '대한민국 평균 이하임을 자처하는 남자들이 매주 새로운 상황 속에서 펼치는 좌충우돌 도전기.');
--EXEC up_create_TV('두시탈출 컬투쇼 레전드 사연 애니메이션 by YOUTOO (1-4)', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '12세 이상 관람가', '높은 인기를 자랑하는 두시탈출 컬투쇼 레전드 사연! 코미디언 김태균과 정찬우가 소개하는 청취자들의 상상초월 경험담이 애니메이션과 만났다!');
--TV테이블 작성 프로시저
--EXEC up_create_TV(TV프로그램,기간,장르,줄거리및설명);
CREATE OR REPLACE PROCEDURE up_create_movie (
    p_Title IN Movie.Title%TYPE,
    p_Duration IN Movie.Duration%TYPE,
    p_Category IN Movie.Category%TYPE,
    p_Content IN Movie.Content%TYPE,
    p_Lang IN Movie.Lang%TYPE
)
AS
    v_MovieID NUMBER;
BEGIN
    SELECT NVL(MAX(MovieID), 0) + 1 INTO v_MovieID FROM Movie;
    
    INSERT INTO Movie (MovieID, Title, Duration, Category, Content, Lang)
    VALUES (v_MovieID, p_Title, p_Duration, p_Category, p_Content, p_Lang);
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('영화 정보가 성공적으로 추가되었습니다. MovieID: ' || v_MovieID);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('영화 정보를 추가하는 도중 오류가 발생했습니다: ' || SQLERRM);
        ROLLBACK;
END;
----------------------------------------------------------------------------------------------------
--TV 테이블 수정 프로시저
--EXEC up_update_TV(13,NULL,TO_DATE('2024-04-20', 'YYYY-MM-DD'),NULL,NULL);
--EXEC up_update_TV(14,NULL,TO_DATE('2024-10-20', 'YYYY-MM-DD'),'미입력',NULL);
--                 (TVID,Title,Duration,Category,Content)
CREATE OR REPLACE PROCEDURE up_update_TV (
    p_TVID IN TV.TVID%TYPE,
    p_Title IN TV.Title%TYPE,
    p_Duration IN TV.Duration%TYPE,
    p_Category IN TV.Cate%TYPE,
    p_Content IN TV.Content%TYPE
)
IS
BEGIN
    UPDATE TV
    SET Title = COALESCE(p_Title, Title),
        Duration = COALESCE(p_Duration, Duration),
        Cate = COALESCE(p_Category, Cate),
        Content = COALESCE(p_Content, Content)
    WHERE TVID = p_TVID;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('해당하는 TV 아이디의 프로그램을 찾을 수 없습니다.');
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('TV 프로그램 정보가 성공적으로 업데이트되었습니다.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('TV 프로그램 정보를 업데이트하는 도중 오류가 발생했습니다: ' || SQLERRM);
        ROLLBACK;
END;


----------------------------------------------------------------------------------------------------


--TV 테이블 삭제 프로시저
--EXEC up_delete_TV(13);
--EXEC up_delete_TV('1~16');
--EXEC up_delete_TV('6,7,8,10');

CREATE OR REPLACE PROCEDURE up_delete_TV (
    p_TVIDs IN VARCHAR2
)
IS
    v_deleted_count NUMBER := 0;
BEGIN
    IF INSTR(p_TVIDs, '~') > 0 THEN  -- ~로 구분된 문자열숫자를 받은 경우
        FOR i IN (
            SELECT TO_NUMBER(REGEXP_SUBSTR(p_TVIDs, '\d+', 1, 1)) AS start_TVID,
                   TO_NUMBER(REGEXP_SUBSTR(p_TVIDs, '\d+', 1, 2)) AS end_TVID
            FROM dual
        ) LOOP
            FOR j IN i.start_TVID..i.end_TVID LOOP
                DELETE FROM TV
                WHERE TVID = j;
                v_deleted_count := v_deleted_count + SQL%ROWCOUNT;
            END LOOP;
        END LOOP;
    ELSE -- 쉼표로 구분된 TVID들을 받은 경우 또는 단일 TVID를 받은 경우
        FOR i IN (
            SELECT TO_NUMBER(REGEXP_SUBSTR(p_TVIDs, '\d+', 1, LEVEL)) AS TVID
            FROM dual
            CONNECT BY LEVEL <= REGEXP_COUNT(p_TVIDs, '\d+')
        ) LOOP
            DELETE FROM TV
            WHERE TVID = i.TVID;
            v_deleted_count := v_deleted_count + SQL%ROWCOUNT;
        END LOOP;
    END IF;

    IF v_deleted_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('해당하는 TV 아이디의 프로그램을 찾을 수 없습니다.');
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('프로그램이 성공적으로 삭제되었습니다.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('프로그램을 삭제하는 도중 오류가 발생했습니다: ' || SQLERRM);
        ROLLBACK;
END;
----------------------------------------------------------------------------------------------------

--EXEC up_tvinfo(202404);
CREATE OR REPLACE PROCEDURE up_tvinfo (
    p_YearMonth IN VARCHAR2
)
AS
    v_StartDate DATE;
    v_EndDate DATE;
BEGIN
    v_StartDate := TO_DATE(p_YearMonth || '01', 'YYYYMMDD');
    v_EndDate := LAST_DAY(v_StartDate);
    
    FOR tvinfo IN (
        SELECT Title, duration, cate, content
        FROM TV
        WHERE TRUNC(duration, 'MM') = v_StartDate
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('제목: ' || tvinfo.Title);
        DBMS_OUTPUT.PUT_LINE('시청가능기간: ' || TO_CHAR(tvinfo.duration, 'YYYY-MM-DD'));
        DBMS_OUTPUT.PUT_LINE('장르: ' || tvinfo.cate);
        DBMS_OUTPUT.PUT_LINE('내용: ' || tvinfo.content);
        DBMS_OUTPUT.PUT_LINE('---------------------------------------');
    END LOOP;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('해당 월에 시청 가능한 TV 컨텐츠가 없습니다.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('TV 컨텐츠 조회 중 오류가 발생했습니다: ' || SQLERRM);
END;
----------------------------------------------------------------------------------------------------


--뮤직 테이블 작성 프로시저
--EXEC up_create_music('포레스텔라', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '클래식', 'JTBC ?팬텀싱어2? 에서 우승을 거머쥔 포레스텔라의 노래 모음집.');
--EXEC up_create_music('A Symphonic Celebration - 스튜디오 지브리 애니메이션 음악', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '클래식', '‘지브리 사운드의 창시자’, 일본을 대표하는 음악감독, 히사이시 조가 새로운 지브리 OST 앨범으로 돌아왔다.');
--EXEC up_create_music('Bach, Bologne, Previn, Vivaldi, Williams', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '클래식', 'Anne-Sophie Mutter & Mutter''s Virtuosi 의 앙상블 협주곡 ''Bach, Bologne, Previn, Vivaldi, Williams');
--EXEC up_create_music('Tchaikovsky: Ballet Suites - Swan Lake; Sleeping Beauty; The Nutcracker', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '클래식', '빈 필하모니 관현악단의 ''Tchaikovsky: Ballet Suites');
--EXEC up_create_music('풍월당: 클래식을 듣는 당신에게', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '클래식', '클래식을 처음 접하는 입문자부터 클래식을 좋아하지만 방대한 양에 어떤 곡부터 들어야 할지 모르는 사람을 위해, 꼭 들어봐야 할 클래식 명곡 25곡을 담았다.');
--EXEC up_create_music('라흐마니노프, 리플렉션(Rachmaninoff, A Reflection)', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '클래식', '반 클라이번 국제 콩쿠르 한국인 최초 우승자 선우예권의 데카 레이블 두 번째 스튜디오 앨범 [라흐마니노프, 리플렉션].');
--EXEC up_create_music('Inspired By Bach: The Cello Suites (Remastered)', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '클래식', '요요마가 바흐의 6개의 첼로 모음곡을 바탕으로 만든 오리지널 사운드 트랙 앨범.');
--EXEC up_create_music('라흐마니노프: 피아노 협주곡 작품번호 1 & 2', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '클래식', '레코딩 시대의 가장 위대한 피아니스트 라흐마니노프의 ''피아노 협주곡 작품번호 1 & 2');
--EXEC up_create_music('The World of Hans Zimmer - A Symphonic Celebration (Live)', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '클래식', '영화 음악계 거장 한스 짐머의 "A Symphonic Celebration (Live)"');
--EXEC up_create_music('임윤찬의 베토벤 ‘황제’ 공연 실황 음반', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '클래식', '반 클라이번 피아노 콩쿠르 최연소 우승자 임윤찬의 연주곡.');
--EXEC up_create_music('헨델로 돌아온 조성진의 신보', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '클래식', '조성진의 첫 바로크 앨범 ''헨델 프로젝트''');

CREATE OR REPLACE PROCEDURE up_create_music (
    p_Title IN Music.Title%TYPE,
    p_Duration IN Music.Duration%TYPE,
    p_Category IN Music.Cate%TYPE,
    p_Content IN Music.Content%TYPE
)
AS
    v_MusicID NUMBER;
BEGIN
    SELECT NVL(MAX(MusicID), 0) + 1 INTO v_MusicID FROM Music;
    
    INSERT INTO Music (MusicID, Title, Duration, Cate, Content)
    VALUES (v_MusicID, p_Title, p_Duration, p_Category, p_Content);
    
    DBMS_OUTPUT.PUT_LINE('음악 정보가 성공적으로 추가되었습니다. MusicID: ' || v_MusicID);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('음악 정보를 추가하는 도중 오류가 발생했습니다: ' || SQLERRM);
        ROLLBACK;
END;


----------------------------------------------------------------------------------------------------
--뮤직 테이블 수정 프로시저

--EXEC up_update_music(1,'쮸쀼쮸쀼',NULL,NULL,NULL);
--EXEC up_update_music(2,'쮸쀼쮸쀼',TO_DATE('2024-05-31', 'YYYY-MM-DD'),'쮸쀼쮸쀼','쮸쀼쮸쀼');

CREATE OR REPLACE PROCEDURE up_update_music (
    p_MusicID IN Music.MusicID%TYPE,
    p_Title IN Music.Title%TYPE,
    p_Duration IN Music.Duration%TYPE,
    p_Category IN Music.Cate%TYPE,
    p_Content IN Music.Content%TYPE
)
IS
BEGIN
    UPDATE Music
    SET Title = COALESCE(p_Title, Title),
        Duration = COALESCE(p_Duration, Duration),
        Cate = COALESCE(p_Category, Cate),
        Content = COALESCE(p_Content, Content)
    WHERE MusicID = p_MusicID;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('해당하는 음악 아이디의 프로그램을 찾을 수 없습니다.');
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('음악 정보가 성공적으로 업데이트되었습니다.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('음악 정보를 업데이트하는 도중 오류가 발생했습니다: ' || SQLERRM);
        ROLLBACK;
END;
----------------------------------------------------------------------------------------------------
--뮤직 테이블 삭제 프로시저
--EXEC up_delete_music(1);
--EXEC up_delete_music('2,5');
--EXEC up_delete_music('1~11');
CREATE OR REPLACE PROCEDURE up_delete_music (
    p_MusicIDs IN VARCHAR2
)
IS
    v_deleted_count NUMBER := 0;
BEGIN
    IF INSTR(p_MusicIDs, '~') > 0 THEN  -- ~로 구분된 문자열숫자를 받은 경우
        FOR i IN (
            SELECT TO_NUMBER(REGEXP_SUBSTR(p_MusicIDs, '\d+', 1, 1)) AS start_MusicID,
                   TO_NUMBER(REGEXP_SUBSTR(p_MusicIDs, '\d+', 1, 2)) AS end_MusicID
            FROM dual
        ) LOOP
            FOR j IN i.start_MusicID..i.end_MusicID LOOP
                DELETE FROM Music
                WHERE MusicID = j;
                v_deleted_count := v_deleted_count + SQL%ROWCOUNT;
            END LOOP;
        END LOOP;
    ELSE -- 쉼표로 구분된 MusicID들을 받은 경우 또는 단일 MusicID를 받은 경우
        FOR i IN (
            SELECT TO_NUMBER(REGEXP_SUBSTR(p_MusicIDs, '\d+', 1, LEVEL)) AS MusicID
            FROM dual
            CONNECT BY LEVEL <= REGEXP_COUNT(p_MusicIDs, '\d+')
        ) LOOP
            DELETE FROM Music
            WHERE MusicID = i.MusicID;
            v_deleted_count := v_deleted_count + SQL%ROWCOUNT;
        END LOOP;
    END IF;

    IF v_deleted_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('해당하는 음악 아이디의 음악을 찾을 수 없습니다.');
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('음악이 성공적으로 삭제되었습니다.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('음악을 삭제하는 도중 오류가 발생했습니다: ' || SQLERRM);
        ROLLBACK;
END;

----------------------------------------------------------------------------------------------------

EXEC up_musicinfo(202404);
CREATE OR REPLACE PROCEDURE up_musicinfo (
    p_YearMonth IN VARCHAR2
)
AS
    v_StartDate DATE;
    v_EndDate DATE;
BEGIN
    v_StartDate := TO_DATE(p_YearMonth || '01', 'YYYYMMDD');
    v_EndDate := LAST_DAY(v_StartDate);
    
    FOR musicinfo IN (
        SELECT Title, Duration, cate, content
        FROM Music
        WHERE TRUNC(Duration, 'MM') = v_StartDate
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('제목: ' || musicinfo.Title);
        DBMS_OUTPUT.PUT_LINE('감상가능기간: ' || TO_CHAR(musicinfo.Duration, 'YYYY-MM-DD'));
        DBMS_OUTPUT.PUT_LINE('장르: ' || musicinfo.cate);
        DBMS_OUTPUT.PUT_LINE('내용: ' || musicinfo.content);
        DBMS_OUTPUT.PUT_LINE('---------------------------------------');
    END LOOP;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('해당 월에 감상 가능한 음악 컨텐츠가 없습니다.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('음악 컨텐츠 조회 중 오류가 발생했습니다: ' || SQLERRM);
END;

----------------------------------------------------------------------------------------------------





INSERT INTO dfare (Keynum, peak, discount, timezone, sg, route, fare, redis, AdminID, wknddy)
VALUES (1, '비수기', '정상', '선호', '일반석', 'SEOUL/GMP-JEJU/CJU', 101000, 3000, '#admin001', '주중');
INSERT INTO dfare (Keynum, peak, discount, timezone, sg, route, fare, redis, AdminID, wknddy)
VALUES (2, '비수기', '정상', '일반', '일반석', 'SEOUL/GMP-JEJU/CJU', 97000 , 3000, '#admin001', '주중');
INSERT INTO dfare (Keynum, peak, discount, timezone, sg, route, fare, redis, AdminID, wknddy)
VALUES (3, '비수기', '정상', '선호', '일반석', 'SEOUL/GMP-JEJU/CJU', 115000, 3000, '#admin001', '주말');
INSERT INTO dfare (Keynum, peak, discount, timezone, sg, route, fare, redis, AdminID, wknddy)
VALUES (4, '비수기', '정상', '일반', '일반석', 'SEOUL/GMP-JEJU/CJU', 110000, 3000, '#admin001', '주말');
INSERT INTO dfare (Keynum, peak, discount, timezone, sg, route, fare, redis, AdminID, wknddy)
VALUES (5, '성수기', '정상', '성수기', '일반석', 'SEOUL/GMP-JEJU/CJU', 132000, 3000, '#admin001', '성수기');

INSERT INTO dfare (Keynum, peak, discount, timezone, sg, route, fare, redis, AdminID, wknddy)
VALUES (6, '비수기', '정상', '선호', '프레스티지석', 'SEOUL/GMP-JEJU/CJU', 161000, 3000, '#admin001', '주중');
INSERT INTO dfare (Keynum, peak, discount, timezone, sg, route, fare, redis, AdminID, wknddy)
VALUES (7, '비수기', '정상', '일반', '프레스티지석', 'SEOUL/GMP-JEJU/CJU', 157000, 3000, '#admin001', '주중');
INSERT INTO dfare (Keynum, peak, discount, timezone, sg, route, fare, redis, AdminID, wknddy)
VALUES (8, '비수기', '정상', '선호', '프레스티지석', 'SEOUL/GMP-JEJU/CJU', 175000, 3000, '#admin001', '주말');
INSERT INTO dfare (Keynum, peak, discount, timezone, sg, route, fare, redis, AdminID, wknddy)
VALUES (9, '비수기', '정상', '일반', '프레스티지석', 'SEOUL/GMP-JEJU/CJU', 170000, 3000, '#admin001', '주말');
INSERT INTO dfare (Keynum, peak, discount, timezone, sg, route, fare, redis, AdminID, wknddy)
VALUES (10, '성수기', '정상', '성수기', '프레스티지석', 'SEOUL/GMP-JEJU/CJU', 192000, 3000, '#admin001', '성수기');
--날짜와 시간대에 따른 운임기준
--exec mk_scplane_01 ('202404190640','202404190750','korea','korea','#admin001','SEOUL.GMP','JEJU.CJU');    2
--exec mk_scplane_01 ('202404190730','202404190840','korea','korea','#admin001','SEOUL.GMP','JEJU.CJU');    2
--exec mk_scplane_01 ('202404190730','202404190840','korea','korea','#admin001','SEOUL.GMP','JEJU.CJU');    2
--exec mk_scplane_01 ('202404191330','202404191440','korea','korea','#admin001','SEOUL.GMP','JEJU.CJU');    1
--exec mk_scplane_01  ('202404191900','202404192010','korea','korea','#admin001','SEOUL.GMP','JEJU.CJU');   2
--exec mk_scplane_01  ('202404192030','202404192140','korea','korea','#admin001','SEOUL.GMP','JEJU.CJU');   2



INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (1, 'ICN', 'FUK', '일등석', 807600, 593500, 18450, 35000, 'admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (2, 'ICN', 'FUK', '프레스티지석', 588850, 432000, 18450, 35000, 'admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (3, 'ICN', 'FUK', '일반석A(정상)', 235000, 172300, 18450, 35000, 'admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (4, 'ICN', 'FUK', '일반석B(특가/할인)', 150000, 110000, 11770, 21000, 'admin001');
--exec mk_scplane_01  ('202404050800','202404050925','korea','JAPAN','#admin001','SEOUL.ICN','FUK.FUK');
--exec mk_scplane_01  ('202404051355','202404051525','korea','JAPAN','#admin001','SEOUL.ICN','FUK.FUK');
--exec mk_scplane_01  ('202404051835','202404052000','korea','JAPAN','#admin001','SEOUL.ICN','FUK.FUK');


INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (5, 'ICN', 'PEK', '일등석', 667000, 489500,  22,350, 35000, 'admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (6, 'ICN', 'PEK', '프레스티지석', 506000,  370800,  22350, 35000, 'admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (7, 'ICN', 'PEK', '일반석A(정상)', 361500, 265200, 22350, 35000, 'admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (8, 'ICN', 'PEK', '일반석B(특가/할인)', 235000, 171000, 20300, 21000, 'admin001');
--exec mk_scplane_01  ('202404200815','202404200940','korea','CHINA','#admin001','SEOUL.ICN','BEIJING.PEK');
--exec mk_scplane_01  ('202404200905','202404201025','korea','CHINA','#admin002','SEOUL.ICN','BEIJING.PEK');
--exec mk_scplane_01  ('202404201840','202404202005','korea','CHINA','#admin002','SEOUL.ICN','BEIJING.PEK');



INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (9, 'ICN', 'JFK', '일등석', 6412000,  4743000, 62300, 161000, 'admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (10, 'ICN', 'JFK', '프레스티지석', 4511000, 3336000, 62300, 161000, 'admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (11, 'ICN', 'JFK', '일반석A(정상)', 2384000, 1763000, 62300, 161000, 'admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (12, 'ICN', 'JFK', '일반석B(특가/할인)', 1450000, 1073000, 62300, 161000, 'admin001');
--exec mk_scplane_01  ('202404201000','202404210020','korea','USA','#admin002','SEOUL.ICN','NYC.JFK');
--exec mk_scplane_01  ('202404201930','202404210930','korea','USA','#admin002','SEOUL.ICN','NYC.JFK');


INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (13, 'ICN', 'BOS', '일등석', 6412200, 4735028, 62300, 161000, 'admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (14, 'ICN', 'BOS', '프레스티지석', 4511000, 3334140, 62300, 161000, 'admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (15, 'ICN', 'BOS', '일반석A(정상)', 2384500, 1759230, 62300, 161000, 'admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (16, 'ICN', 'BOS', '일반석B(특가/할인)', 1450000, 1073000, 62300, 161000, 'admin001');
--exec mk_scplane_01  ('202405100930','202405102330','korea','USA','#admin002','SEOUL.ICN','BOS.BOS');
--exec mk_scplane_01  ('202405100920','202405110340','korea','USA','#admin002','SEOUL.ICN','BOS.BOS');

INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (17, 'ICN', 'LAS', '일등석', 11033900, 4082543,  124600, 260400, 'admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (18, 'ICN', 'LAS', '프레스티지석', 7755600, 2869572 , 124600, 260400, 'admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (19, 'ICN', 'LAS', '일반석A(정상)', 3656100, 1352757, 124600, 260400, 'admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (20, 'ICN', 'LAS', '일반석B(특가/할인)', 2400000, 888000, 124600, 260400, 'admin001');
exec mk_scplane_01  ('202403271600','202403280633','korea','USA','#admin002','SEOUL.ICN','LAS.LAS');
exec mk_scplane_01  ('202403271430','202403280631','korea','USA','#admin002','SEOUL.ICN','LAS.LAS');
exec mk_scplane_01  ('202403271940','202403281200','korea','USA','#admin002','SEOUL.ICN','LAS.LAS');
