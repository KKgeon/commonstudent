-- ���� ���谡 �ִ� ���̺� ����
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

-- ���� ���谡 ���� ���̺� ����
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


----------------------------------------------------���̺� ���� �� ---------------------------------------------------------------
----------------------------------------------------���̺� ���� �� ---------------------------------------------------------------
----------------------------------------------------���̺� ���� �� ---------------------------------------------------------------
----------------------------------------------------���̺� ���� �� ---------------------------------------------------------------
----------------------------------------------------���̺� ���� �� ---------------------------------------------------------------
----------------------------------------------------���̺� ���� �� ---------------------------------------------------------------
----------------------------------------------------���̺� ���� �� ---------------------------------------------------------------
----------------------------------------------------���̺� ���� �� ---------------------------------------------------------------
----------------------------------------------------���̺� ���� �� ---------------------------------------------------------------
----------------------------------------------------���̺� ���� �� ---------------------------------------------------------------
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
    pmethod varchar2(70) DEFAULT 'ī��' NOT NULL,
    flight varchar2(50) DEFAULT '����' NOT NULL,
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
    food varchar2(100) DEFAULT '(�⳻�� ��������)' NULL,
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

COMMENT ON COLUMN Scplane.dnation IS '�ѱ�����';

COMMENT ON COLUMN Scplane.anation IS '�ѱ�,�Ϻ�,�߱�,�̱�';

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

COMMENT ON COLUMN yesno.agree IS '����/����';

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

COMMENT ON COLUMN Contract.Essentiality IS '�ʼ�/����';

COMMENT ON COLUMN Contract.Contract_title IS '50�ڳ���';

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
    usergrade varchar2(100) DEFAULT '��ī���н� Ŭ��' NULL,
    family_id VARCHAR2(100) NULL
);

CREATE TABLE S_Grade (
    Key NUMBER NOT NULL,
    grade varchar2(100) DEFAULT '��ī���н� Ŭ��' NOT NULL,
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

--------------------------------------------------------------���� ������ ���Թ�---------------------------------------------------
--------------------------------------------------------------���� ������ ���Թ�---------------------------------------------------
--------------------------------------------------------------���� ������ ���Թ�---------------------------------------------------
--------------------------------------------------------------���� ������ ���Թ�---------------------------------------------------
--------------------------------------------------------------���� ������ ���Թ�---------------------------------------------------
--------------------------------------------------------------���� ������ ���Թ�---------------------------------------------------
--------------------------------------------------------------���� ������ ���Թ�---------------------------------------------------
--------------------------------------------------------------���� ������ ���Թ�---------------------------------------------------
-----
-- ȸ�� ���� 5��
INSERT INTO flightuser VALUES ('user001', 'ȫ', '�浿', 'Hong', 'GilDong', 'password123', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 'Male', 'user001@example.com', '01012345678', 'Korea', '1234-5678-9012-3456');

INSERT INTO flightuser VALUES ('user002', '��', 'ö��', 'Kim', 'ChulSoo', 'pass456', TO_DATE('1985-12-15', 'YYYY-MM-DD'), 'Male', 'user002@example.com', '01023456789', 'Korea', '5678-9012-3456-7890');

INSERT INTO flightuser VALUES ('user003', '��', '����', 'Lee', 'YoungHee', 'securepass', TO_DATE('1993-05-20', 'YYYY-MM-DD'), 'Female', 'user003@example.com', '01034567890', 'Japan', '9012-3456-7890-1234');

INSERT INTO flightuser VALUES ('user004', '��', '�̿�', 'Park', 'MiYoung', 'mypassword', TO_DATE('1987-04-03', 'YYYY-MM-DD'), 'Female', 'user004@example.com', '01045678901', 'China', '2345-6789-0123-4567');

INSERT INTO flightuser VALUES ('user005', '��', '����', 'Kim', 'SuHyun', 'p@ssw0rd', TO_DATE('1990-11-11', 'YYYY-MM-DD'), 'Female', 'user005@example.com', '01056789012', 'Korea', '6789-0123-4567-8901');

--�װ��� ���� 5��
INSERT INTO airplane  VALUES (
    'HL7553',
    '�����װ�',
    276,
    'A330-300',
    TO_DATE('1999-04-16', 'YYYY-MM-DD'),
    0,
    24,
    252,
    '������Ƽ�� Ŭ���� �켱 ž��, �߰� ���Ϲ� ���',
    '���� �¼� ����, ���� �������θ�Ʈ �ý���',
    NULL
);



INSERT INTO airplane VALUES (
    'HL7554',
    '�����װ�',
    276,
    'A330-300',
    TO_DATE('1999-01-04', 'YYYY-MM-DD'),
    0,
    24,
    252,
    '������Ƽ�� Ŭ���� ���� üũ��, ����� �̿� ����',
    '���� ������ ��巹��Ʈ, USB ���� ��Ʈ',
    NULL
);

INSERT INTO airplane VALUES (
    'HL7611',
    '�����װ�',
    407,
    'A380-800',
    TO_DATE('2010-09-27', 'YYYY-MM-DD'),
    12,
    94,
    301,
    '������Ƽ�� Ŭ���� ���� üũ��, �켱 ž��',
    '���̵� ��ũ�� ���� �����, �ٸ� ���� Ȯ��'
    ,'�۽�ƮŬ���� �ְ��� ����'
);


INSERT INTO airplane VALUES (
    'HL8348',
    '�����װ�',
    146,
    'B737-8',
    TO_DATE('2019-04-18', 'YYYY-MM-DD'),
    0,
    8,
    138,
    '������Ƽ�� Ŭ���� ����Ʈ, ��� �Ļ� �ɼ�',
    '���� �������θ�Ʈ, �� ���� �¼� �� �ٸ� ����'
    ,NULL
);

INSERT INTO airplane VALUES (
    'HL8240',
    '�����װ�',
    138,
    'B737-800',
    TO_DATE('2011-09-14', 'YYYY-MM-DD'),
    0,
    12,
    126,
    '������Ƽ�� Ŭ���� ����Ʈ, ��� �Ļ� �ɼ�',
    '���� �������θ�Ʈ, �� ���� �¼� �� �ٸ� ����'
    ,NULL
);
-- ���� ���� 5��
INSERT INTO Scplane VALUES (1, NULL, TO_DATE('2024-03-20 09:30', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-03-20 10:45', 'YYYY-MM-DD HH24:MI'), 'Korea', 'Korea', 'admin001', 'KE1234', 'JEJU.CJU', 'SEOUL.GMP', 23, 2, 'HL7553');
INSERT INTO Scplane VALUES (2, NULL, TO_DATE('2024-03-23 15:15', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-03-23 16:30', 'YYYY-MM-DD HH24:MI'), 'Korea', 'Korea', 'admin002',  'KE5678',  'JEJU.CJU','SEOUL.GMP', 15, 3, 'HL7554');
INSERT INTO Scplane VALUES (3, '�ܹ���', TO_DATE('2024-04-09 14:45', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-04-09 20:00', 'YYYY-MM-DD HH24:MI'), 'Korea', 'Japan', 'admin003', 'KE9876', 'FUKU.FUK','SEOUL.ICN', 8, 1, 'HL7611');
INSERT INTO Scplane VALUES (4, '��ġ�', TO_DATE('2024-04-10 09:05', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-04-10 10:25', 'YYYY-MM-DD HH24:MI'), 'Korea', 'China', 'admin004',  'KE4321', 'BEIJING.PEK', 'SEOUL.ICN', 12, 4, 'HL8348');
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


---- ������ 5���� ������
--INSERT INTO Scplane VALUES 
--(11, NULL, TO_DATE('2024-03-25 09:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-03-25 11:05', 'YYYY-MM-DD HH24:MI')
--, 'Korea', 'Japan', 'admin001', 421000, 'KE2468', 'ICN', 'HND', 18, 3, 'HL9102');
--INSERT INTO Scplane VALUES 
--(12, '������ũ', TO_DATE('2024-04-15 11:10', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-04-15 12:25', 'YYYY-MM-DD HH24:MI')
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

--����/����/ȯ��
--INSERT INTO payrefund VALUES (1, '����', 'ī��', '����', '20A', SYSDATE, 2, 97000, 276, 'user001', 1);
--INSERT INTO payrefund VALUES (2, '����', '����Ʈī��', '����', '21A', SYSDATE, 0, 115000, 150, 'user002', 2);
--INSERT INTO payrefund VALUES (3, '����', 'ī��', '����', '22A', SYSDATE, 1, 199000, 250, 'user003', 3);
--INSERT INTO payrefund VALUES (4, '����', '���ϸ���', '����', '20A', SYSDATE, 0, 169000, 398, 'user004', 4);
--INSERT INTO payrefund VALUES (5, '����', '����Ʈī��', '����', '20A', SYSDATE, 3, 63000, 276, 'user005', 5);

--
-- ������ 5���� ����
INSERT INTO Adminstrator VALUES ('#admin001', '��', 'ö��', 'Kim', 'Chulsoo', 'adminpass1', TO_DATE('1990-01-15', 'YYYY-MM-DD'), 'Male', 'chulsoo.kim@example.com', '010-1234-5678', 'Seoul, South Korea', '1234-5678-9012-3456');
INSERT INTO Adminstrator VALUES ('#admin002', '��', '����', 'Lee', 'Younghee', 'adminpass2', TO_DATE('1985-03-22', 'YYYY-MM-DD'), 'Female', 'younghee.lee@example.com', '010-9876-5432', 'Busan, South Korea', '7890-1234-5678-9012');
INSERT INTO Adminstrator VALUES ('#admin003', '��', '�μ�', 'Park', 'Minsu', 'adminpass3', TO_DATE('1995-07-10', 'YYYY-MM-DD'), 'Male', 'minsu.park@example.com', '010-5555-1234', 'Incheon, South Korea', '3456-7890-1234-5678');
INSERT INTO Adminstrator VALUES ('#admin004', '��', '����', 'Jang', 'Seoyoung', 'adminpass4', TO_DATE('1988-11-05', 'YYYY-MM-DD'), 'Female', 'seoyoung.jang@example.com', '010-7777-8888', 'Daejeon, South Korea', '9012-3456-7890-1234');
INSERT INTO Adminstrator VALUES ('#admin005', '��', '��ȣ', 'Yoon', 'Junho', 'adminpass5', TO_DATE('1992-04-30', 'YYYY-MM-DD'), 'Male', 'junho.yoon@example.com', '010-3333-9999', 'Ulsan, South Korea', '5678-9012-3456-7890');

--
--������ ���� �μ�Ʈ 3��
insert into dfare values (1,'�����','����','��ȣ','�Ϲݼ�','SEOUL/GMP-JEJU/CJU',97000,3000,'#admin001','����');
insert into dfare values (2,'�����','����','�Ϲ�','�Ϲݼ�','SEOUL/GMP-JEJU/CJU',115000,3000,'#admin002','�ָ�');
insert into dfare values (3,'������','����','�Ϲ�','�Ϲݼ�','SEOUL/GMP-JEJU/CJU',132000,3000,'#admin005','����');


--������ ���� �μ�Ʈ 2��
insert into ifare values (1,'ICN','FUK','�Ϲݼ�',150000,110000,20300,21000,'#admin003');
insert into ifare values (2,'ICN','PEK','�Ϲݼ�',235000,172300,22350,35000,'#admin004');


-- �ȳ� ���� 5��
INSERT INTO notice VALUES ( 1, '�ѱ� �Ա� �����Ű� ���� ����', '2023�� 5�� 1�Ϻ��� ���ѹα� �Ա� �����Ű� ������ ����˴ϴ�. 
 �Ű��� ��ǰ�� ���� ��쿡�� ���� �Ű� ���� �鼼 ���� �̿��� �ּ���.
 �� �ʼ� �Ű� ǰ���� �ִ� ��쿡�� ���� �Ű� ���� (�˻� ���� �̿�) - �ʼ� �Ű� ǰ�� : ��ȭ 8��� �ʰ� ��ǰ, ��ȭ 1���� �ʰ� ��ȯ, �˿���ǰ ��
 �� �Ű� ��� : App/Web ���� �Ű� �Ǵ� ���� �޴�ǰ �Ű� �ۼ� 
 �� App ��ġ �� Web ���� ���', '��������', '#admin005');
INSERT INTO notice VALUES ( 2, '��ī���н� ȸ�� ���� ���� ����(Ű�ڴϾ� ����)', '��ī���н� ȸ�� ���޻��� Ű�ڴϾ� ������� ���� ������ ����˴ϴ�.
 �� ��ī���н� ȸ�� ���� ������ ���� ���� �ÿ��� ���� - ���ͳ� ���� ���� �� ���� ���� �Ұ�  
 �� ���ϱ� 2�� ������ 30%�� �λ� ( 2024�� 2�� 26�� ����) - ���ϱ� 1�� �������� 20% ����', '��ī���н�', '#admin001');
INSERT INTO notice VALUES ( 3, '������Ʈ �����н� ���� ���� (����ũ��)', '���޻� ���� ��ȹ�� ���� ����ũ������ ������Ʈ �����н� ���ް� ����˴ϴ�.
 �� ���޻� : ����ũ�� (SHAKE SHACK) ��õ�������� ��2�����͹̳� ��õ������
 �� ���� ������ : 2024�� 3�� 30�� �� ������Ʈ �����н� ���� ������ 3�� 29�� ���� �����˴ϴ�.', '��������', '#admin003');
INSERT INTO notice VALUES ( 4, 'ī�� ���� �Ͻ� �ߴ� (Diners Club, Discover)', 'Ȩ���������� �װ��� ���� �� Diners club �� Discover ī�� ������ �Ͻ� �ߴܵ� �����Դϴ�.
 �� �ߴ� ���� : 2024�� 3�� 16�� �� �� �ߴ� ���� : �ش� ī��� ��ȭ���� ���α׷� ���� 
 * �� �� Ŭ�ι� ī���(Visa, Mastercard, American Express, JCB, UATP)���� ������ �����ϸ� ī��� ��ȭ���� ���α׷� ���� �۾� �� �ٽ� ������ �����Դϴ�.(20204�� ��ݱ� ��)'
, '��Ÿ�ȳ�', '#admin001');
INSERT INTO notice VALUES ( 5, '�ű� ���ϸ��� ���� ����( ��������, 11����)', '�������� �� 11������ ���ϸ��� ���� ���޸� �����Ͽ�,
 �����װ� Ȩ������ �� ������ ��ũ�� ���� ���� �� ���� �ݾ׿� ���� ��ī���н� ���ϸ��� ������ �������� �˷��帳�ϴ�. 
 <���޳���> 
  �� �������� : ���� �ݾ� 1,000���� 2����  
  �� 11���� : ���� �ݾ� 1,000���� 1����'
, '���޼ҽ�', '#admin002');

--�¼� �Է�����

-- �ϵ �¼� �߰�
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-01A', 'HL7553', '01A', '�ϵ');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-01B', 'HL7553', '01B', '�ϵ');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-01C', 'HL7553', '01C', '�ϵ');

-- �Ϲݼ� �¼� �߰�
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-20A', 'HL7553', '20A', '�Ϲݼ�');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-20B', 'HL7553', '20B', '�Ϲݼ�');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-20C', 'HL7553', '20C', '�Ϲݼ�');

-- ������Ƽ���� �¼� �߰�
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-10A', 'HL7553', '10A', '������Ƽ����');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-10B', 'HL7553', '10B', '������Ƽ����');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-10C', 'HL7553', '10C', '������Ƽ����');


-- �ϵ
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-01D', 'HL7554', '01D', '�ϵ');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-01E', 'HL7554', '01E', '�ϵ');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-01F', 'HL7554', '01F', '�ϵ');

-- �Ϲݼ�
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-21A', 'HL7554', '21A', '�Ϲݼ�');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-21B', 'HL7554', '21B', '�Ϲݼ�');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-21C', 'HL7554', '21C', '�Ϲݼ�');

-- ������Ƽ����
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-11A', 'HL7554', '11A', '������Ƽ����');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-11B', 'HL7554', '11B', '������Ƽ����');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-11C', 'HL7554', '11C', '������Ƽ����');


-- �ϵ
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-01G', 'HL7611', '01G', '�ϵ');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-01H', 'HL7611', '01H', '�ϵ');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-01I', 'HL7611', '01I', '�ϵ');

-- �Ϲݼ�
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-22A', 'HL7611', '22A', '�Ϲݼ�');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-22B', 'HL7611', '22B', '�Ϲݼ�');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-22C', 'HL7611', '22C', '�Ϲݼ�');

-- ������Ƽ����
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-12A', 'HL7611', '12A', '������Ƽ����');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-12B', 'HL7611', '12B', '������Ƽ����');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-12C', 'HL7611', '12C', '������Ƽ����');


-- �ϵ �¼� �߰�
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-01A', 'HL8348', '01A', '�ϵ');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-01B', 'HL8348', '01B', '�ϵ');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-01C', 'HL8348', '01C', '�ϵ');

-- �Ϲݼ� �¼� �߰�
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-20A', 'HL8348', '20A', '�Ϲݼ�');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-20B', 'HL8348', '20B', '�Ϲݼ�');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-20C', 'HL8348', '20C', '�Ϲݼ�');

-- ������Ƽ���� �¼� �߰�
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-10A', 'HL8348', '10A', '������Ƽ����');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-10B', 'HL8348', '10B', '������Ƽ����');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-10C', 'HL8348', '10C', '������Ƽ����');



-- �ϵ �¼� �߰�
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-01A', 'HL8240', '01A', '�ϵ');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-01B', 'HL8240', '01B', '�ϵ');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-01C', 'HL8240', '01C', '�ϵ');

-- �Ϲݼ� �¼� �߰�
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-20A', 'HL8240', '20A', '�Ϲݼ�');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-20B', 'HL8240', '20B', '�Ϲݼ�');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-20C', 'HL8240', '20C', '�Ϲݼ�');

-- ������Ƽ���� �¼� �߰�
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-10A', 'HL8240', '10A', '������Ƽ����');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-10B', 'HL8240', '10B', '������Ƽ����');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-10C', 'HL8240', '10C', '������Ƽ����');


-- Ŭ����ޱ��� �� �ֱ� 


INSERT INTO S_Grade (Key) VALUES (1); 
INSERT INTO S_Grade VALUES (2, '���į Ŭ��', 50000, 40 ) ;  
INSERT INTO S_Grade VALUES (3, '���į �����̾� Ŭ��' , 500000, 40);
INSERT INTO S_Grade VALUES (4, '�и��� ���Ϸ� Ŭ��', 1000000, 40); 

-- ���� ��û �ϱ� 


--INSERT INTO Rfamily (keynum,relation,family_id,userid) VALUES (1,'��','#id_01','user001');
--INSERT INTO Rfamily (keynum,relation,family_id,userid) VALUES (2,'��','#id_01','user002');
--INSERT INTO Rfamily (keynum,relation,family_id,userid) VALUES (3,'��','#id_02','user003');
--INSERT INTO Rfamily (keynum,relation,family_id,userid) VALUES (4,'��','#id_02','user004');
--INSERT INTO Rfamily (keynum,relation,family_id,userid) VALUES (5,'��','#id_02','user005');

-- ȸ�� ���� ���� 
INSERT INTO Userdetail (UserID) VALUES ('user001');
INSERT INTO Userdetail (UserID) VALUES ('user002');
INSERT INTO Userdetail (UserID) VALUES ('user003');
INSERT INTO Userdetail (UserID) VALUES ('user004');
INSERT INTO Userdetail (UserID) VALUES ('user005');


-- ���ϸ��� ���� / �Һ�
--    
--INSERT INTO Mtracking (Tracking_num, Amount_Mileage, airline_type, spendorearned, userID) VALUES(1,0,'�����װ�','����','user001');
--INSERT INTO Mtracking (Tracking_num, Amount_Mileage, airline_type, spendorearned, userID) VALUES(2,0,'�����װ�','�Һ�','user001');
--INSERT INTO Mtracking (Tracking_num, Amount_Mileage, airline_type, spendorearned, userID) VALUES(3,20,'�����װ�','����','user002');
--INSERT INTO Mtracking (Tracking_num, Amount_Mileage, airline_type, spendorearned, userID) VALUES(4,30,'�����װ�','�Һ�','user002');
--INSERT INTO Mtracking (Tracking_num, Amount_Mileage, airline_type, spendorearned, userID) VALUES(5,40,'�����װ�','����','user003');
--

-- ���� ����
-- ù ��° �� ����
INSERT INTO Customerc VALUES (
    1,                -- ���ǻ��װ�����ȣ
    'Ī��',                        -- ����
    '���׼���',                  -- �о�
    '��',                         -- �°� ��
    '����',                       -- �°� �̸�
    '(82) 10-1234-5678',          -- ��ȭ��ȣ
    'example@email.com',          -- �̸����ּ�
    'Ī���ؿ� ~',                  -- ����
    '��� �ʹ� ģ���մϴ�',          -- ����
    '1232-3456-7890-1323',                       -- ��ī���н�ȸ����ȣ
    '34534534',                     -- �����ȣ
    1,                            -- �̸��ϼ��ſ���
    '����',                        -- ��������
    '����',                        -- ��ߵ���
    TO_DATE('2024-03-10', 'YYYY-MM-DD'), -- �������
    'KE123'                       -- �װ����
);

-- �� ��° �� ����
INSERT INTO Customerc VALUES (
    2,                -- ���ǻ��װ�����ȣ
    '����',                        -- ����
    '�⳻��',                      -- �о�
    '��',                         -- �°� ��
    '����',                       -- �°� �̸�
    '(82) 10-2345-6789',          -- ��ȭ��ȣ
    'user2@example.com',          -- �̸����ּ�
    '�⳻�� ���� ����',            -- ����
    '�⳻�� �ɼ��� �����ΰ���?',   -- ����
    '9012-3678-7890-1323',                       -- ��ī���н�ȸ����ȣ
    '12346786',                     -- �����ȣ
    0,                            -- �̸��ϼ��ſ���
    '����',                        -- ��������
    '����',                        -- ��ߵ���
    TO_DATE('2024-04-15', 'YYYY-MM-DD'), -- �������
    'KE456'                       -- �װ����
);

-- �� ��° �� ����
INSERT INTO Customerc VALUES (
   3,                -- ���ǻ��װ�����ȣ
    '�Ҹ�',                        -- ����
    '��ȭ��',                      -- �о�
    '��',                         -- �°� ��
    '�μ�',                       -- �°� �̸�
    '(82) 10-3456-7890',          -- ��ȭ��ȣ
    'user3@example.com',          -- �̸����ּ�
    '��ȭ�� �нǿ� ���� �Ҹ�',      -- ����
    '���� ���� ���߽��ϴ�',        -- ����
    '9012-3456-2340-1323',                       -- ��ī���н�ȸ����ȣ
    '54367344',                     -- �����ȣ
    1,                            -- �̸��ϼ��ſ���
    '����',                        -- ��������
    '����',                        -- ��ߵ���
    TO_DATE('2024-05-20', 'YYYY-MM-DD'), -- �������
    'KE789'                       -- �װ����
);

-- �� ��° �� ����
INSERT INTO Customerc VALUES (
    4,                -- ���ǻ��װ�����ȣ
    '����',                        -- ����
    '��Ÿ',                        -- �о�
    '��',                         -- �°� ��
    '����',                       -- �°� �̸�
    '(82) 10-4567-8901',          -- ��ȭ��ȣ
    'user4@example.com',          -- �̸����ּ�
    '�⳻ ���� ���� ����',        -- ����
    '�⳻ �������θ�Ʈ�� �������ּ���', -- ����
    '9012-3456-7890-1323',                       -- ��ī���н�ȸ����ȣ
    '21346578',                     -- �����ȣ
    0,                            -- �̸��ϼ��ſ���
    '�ν���������',                -- ��������
    '����',                        -- ��ߵ���
    TO_DATE('2024-06-01', 'YYYY-MM-DD'), -- �������
    'KE890'                       -- �װ����
);

INSERT INTO Customerc VALUES (
   5,                -- ���ǻ��װ�����ȣ
    '�Ҹ�',                        -- ����
    '�⳻��',                      -- �о�
    '��',                         -- �°� ��
    '����',                       -- �°� �̸�
    '(82) 10-2345-6789',          -- ��ȭ��ȣ
    'user5@example.com',          -- �̸����ּ�
    '�⳻�� ǰ�� ���� ��û',         -- ����
    '�⳻���� ���� ���� ��뿡 �� ���ƽ��ϴ�.', -- ����
    '1234-5678-9012-3456',        -- ��ī���н�ȸ����ȣ
    '87654321',                   -- �����ȣ
    1,                            -- �̸��ϼ��ſ���
    '����',                        -- ��������
    '����',                        -- ��ߵ���
    TO_DATE('2024-09-15', 'YYYY-MM-DD'), -- �������
    'KE453'                       -- �װ����
);

--�Ļ�޴�

-- ù ��° �Ļ� �ɼ� �߰�
INSERT INTO flight_meal (meal_code, menu) VALUES (1, 'ġŲ ī�� ���̽� - ��ȭ�� ��ŷ�� �Բ� �����Ǵ� ǳ�� ������ ġŲ ī��');

-- �� ��° �Ļ� �ɼ� �߰�
INSERT INTO flight_meal (meal_code, menu) VALUES (2, '��� ����� - ä�������ڸ� ���� Ư�� �غ�� �ż��� ��ä�� ��� ���� �Ļ�');

-- �� ��° �Ļ� �ɼ� �߰�
INSERT INTO flight_meal (meal_code, menu) VALUES (3, '������ũ�� ���� - ��޽����� ������ũ�� �Բ� �����Ǵ� ���� ����');



---
--����Ʈī�� 50���� 1�� ����

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
    '1234-5678-9012-3456',       -- ī�� ��ȣ
    '�����մϴ�!',               -- �޽���
    123456,                      -- PIN ��ȣ
    'ȫ�浿',                    -- ������
    '010-1234-5678',             -- ������ ��ȭ��ȣ
    '��ö��',                    -- �߼���
    '010-8765-4321',             -- �߼��� ��ȭ��ȣ
    500000                       -- �ݾ� (50����)
);

-- ���� ���̺� 3��

INSERT INTO r_section VALUES ( '������', 'ICN, GMP, PUS, CJU, KWJ, TAE, RSU, USN, HIN, CJJ, KPO'
                              , 'ICN, GMP, PUS, CJU, KWJ, TAE, RSU, USN, HIN, CJJ, KPO');
INSERT INTO r_section VALUES ( '������ ����', 'ICN, GMP, PUS, CJU, KWJ, TAE, RSU, USN, HIN, CJJ, KPO'
                              , 'NYC, DFW, DTW, LAS, LAX, MSP, YVR, BOS, SFO, SEA, CHI, ATL, WAS, YYZ, HNL');   
INSERT INTO r_section VALUES ( '������ ���Ͼƽþ�', 'ICN, GMP, PUS, CJU, KWJ, TAE, RSU, USN, HIN, CJJ, KPO'
                             ,'KOJ, KHH, KMQ, CAN, KKJ, NGO, NKG, KIJ, DLC, TYO, MFM, PEK, CTS, SHA, XMN, SHE, SZX, XIY, AOJ, YNJ, YNT, KIX, OIT, OKA, URC, WUH, WEH, DYG, CGO, TNA, CSX, TAO, KMG, TPE, RMQ, TSN, HGH, HFE, HKG, TXN, FUK');

--��ȭ�� ����

INSERT INTO l_rule VALUES ( 1, '�Ϲݼ�', 1, 0 , '������ ���Ͼƽþ�' );
INSERT INTO l_rule VALUES ( 2, '�Ϲݼ�', 2, 70000 , '������ ���Ͼƽþ�' );
INSERT INTO l_rule VALUES ( 3, '�Ϲݼ�', 3, 170000 , '������ ���Ͼƽþ�' );
INSERT INTO l_rule VALUES ( 4, '������Ƽ����', 1, 0 , '������ ���Ͼƽþ�' );
INSERT INTO l_rule VALUES ( 5, '������Ƽ����', 2, 0 , '������ ���Ͼƽþ�' );
INSERT INTO l_rule VALUES ( 6, '������Ƽ����', 3, 100000 , '������ ���Ͼƽþ�' );
INSERT INTO l_rule VALUES ( 7, '�ϵ', 1, 0 , '������ ���Ͼƽþ�' );
INSERT INTO l_rule VALUES ( 8, '�ϵ', 2, 0 , '������ ���Ͼƽþ�' );
INSERT INTO l_rule VALUES ( 9, '�ϵ', 3, 0 , '������ ���Ͼƽþ�' );
INSERT INTO l_rule VALUES ( 10, '�ϵ', 4, 100000 , '������ ���Ͼƽþ�' );

INSERT INTO l_rule VALUES ( 11, '�Ϲݼ�', 1, 0 , '������ ����' );
INSERT INTO l_rule VALUES ( 12, '�Ϲݼ�', 2, 0 , '������ ����' );
INSERT INTO l_rule VALUES ( 13, '�Ϲݼ�', 3, 200000 , '������ ����' );
INSERT INTO l_rule VALUES ( 14, '������Ƽ����', 1, 0 , '������ ����' );
INSERT INTO l_rule VALUES ( 15, '������Ƽ����', 2, 0 , '������ ����' );
INSERT INTO l_rule VALUES ( 16, '������Ƽ����', 3, 200000 , '������ ����' );
INSERT INTO l_rule VALUES ( 17, '�ϵ', 1, 0 , '������ ����' );
INSERT INTO l_rule VALUES ( 18, '�ϵ', 2, 0 , '������ ����' );
INSERT INTO l_rule VALUES ( 19, '�ϵ', 3, 0 , '������ ����' );
INSERT INTO l_rule VALUES ( 20, '�ϵ', 4, 200000 , '������ ����' );

--����� ����
INSERT INTO lounge_info (lounge_num, lounge_name, destination_airport, country, location, operating_time, operator, entry_passenger, service)
VALUES ( 1,'KAL �ϵ �����', '����/��õ', '���ѹα�','(�� 2���� �͹̳�,�ⱹ�ɻ� ��)248 Gate ������ ����(4F)', '�� ���� : ����
 �� �ð� : 04:00 ~ 22:00 ', '����', '�ϵ �°�' ,'����, ����, ������, �ڷ�����, �ѽ�, ���� ���ͳ�, ��Ʈ�� ��Ʈ, ������, ȸ�ǽ�, �����ü�, �ַ�');
INSERT INTO lounge_info (lounge_num, lounge_name, destination_airport, country, location, operating_time, operator, entry_passenger, service)
VALUES ( 2,'KAL �����(������)', '����/����', '���ѹα�','���ѹα�, �ⱹ�� �� 4��(���� �˻� �� �ⱹ�ɻ� ��)', '�� ���� : ����
 �� �ð� : 06:20 ~ 20:05 �� ����� � �ð��� �װ��� ���� �����ٿ� ���� ������ �� �ֽ��ϴ�.', '����', '�� ������Ƽ�� Ŭ���� �°� �� �����װ� �и��� ���Ϸ� Ŭ�� �°�
 �� �����װ� ���į �����̾� Ŭ�� �°� �� ��ī���� ����Ʈ �÷��� �°� �� �����װ� ���į Ŭ�� �°� (����� �¼� ��Ȳ�� ���� ���� ����)' 
 ,'����, ����, ������, �ڷ�����, �ѽ�, ���� ���ͳ�, ��Ʈ�� ��Ʈ, ������, �ַ�');
INSERT INTO lounge_info (lounge_num, lounge_name, destination_airport, country, location, operating_time, operator, entry_passenger, service)
VALUES ( 3,'KAL �����', '����/����Ÿ', '���Ͼƽþ�','��1 �͹̳� �ⱹ�ɻ� �� 26�� GATE ��ó�� ��ġ', '�� ���� : ����
 �� �ð� : 07:15 ~ 20:30 �� ���� ���� �ð� : ���� �ð� 20����', '����', '�� �ϵ �°� �� ������Ƽ�� Ŭ���� �°� �� �����װ� �и��� ���Ϸ� Ŭ�� �°� �� �����װ� ���į �����̾� Ŭ�� �°�
 �� ��ī���� ����Ʈ �÷��� �°� �� �����װ� ���į Ŭ�� �°� (����� �¼� ��Ȳ�� ���� ���� ����)' ,'����, ����, �ڷ�����, ���� ���ͳ�, �ַ�');
INSERT INTO lounge_info (lounge_num, lounge_name, destination_airport, country, location, operating_time, operator, entry_passenger, service)
VALUES ( 4,'�߱������װ� �����', '����¡/�����(PEK)', '���Ͼƽþ�','�͹̳�2,���Ȱ˻����� ��� �� �鼼����','<�� ���� : ȭ, ��, ��
 �� �ð� : 07:40 ~ 10:40> <�� ���� : ��, ��, ��, �� �� �ð� : 07:50 ~ 10:50> <�� ���� : ���� �� �ð� : 08:45 ~ 11:45> <�� ���� : ��, ��, ��, �� �� �ð� : 11:15 ~ 14:15>
 <�� ���� : ��, ��, ��, �� �� �ð� : 15:55 ~ 18:55> <�� ���� : ���� �� �ð� : 18:55 ~ 21:45>', '����', '�� �ϵ �°� �� ������Ƽ�� Ŭ���� �°� �� �����װ� �и��� ���Ϸ� Ŭ�� �°�
 �� �����װ� ���į �����̾� Ŭ�� �°� �� ��ī���� ����Ʈ �÷��� �°�' ,'����, ����, ������, �ڷ�����, ���� ���ͳ�, ��Ʈ�� ��Ʈ, ������, �ַ�');
INSERT INTO lounge_info (lounge_num, lounge_name, destination_airport, country, location, operating_time, operator, entry_passenger, service)
VALUES ( 5,'36�� �����װ� �����', '������/Ǫ��(PVG)', '���Ͼƽþ�','���Ȱ˻����� ����� �鼼����','�� ���� : ���� �� �ð� : 05:00 ~ 23:59', '����'
 , '�� �ϵ �°� �� ������Ƽ�� Ŭ���� �°� �� �����װ� �и��� ���Ϸ� Ŭ�� �°� �� �����װ� ���į �����̾� Ŭ�� �°� �� ��ī���� ����Ʈ �÷��� �°�' 
 ,'����, ����, ������, �ڷ�����, ��ȭ, �ѽ�, ��ǻ��(���ͳ� ����), ���� ���ͳ�, ������, �����, �����ü�, �ַ�');
INSERT INTO lounge_info (lounge_num, lounge_name, destination_airport, country, location, operating_time, operator, entry_passenger, service)
VALUES ( 6,'��ȭ�װ� �����', 'Ÿ�̺���/Ÿ������(TPE)', '���Ͼƽþ�','��1 �����͹̳�, �ⱹ�� 3�� �����˻� ��� �� �ⱹ�翭 �� ������"A" ������ 4���� ��ġ'
 ,'�� ���� : ���� �� �ð� : 05:30 ~ 23:30', '����', '�� �ϵ �°� �� ������Ƽ�� Ŭ���� �°� �� �����װ� �и��� ���Ϸ� Ŭ�� �°� �� �����װ� ���į �����̾� Ŭ�� �°�
 �� ��ī���� ����Ʈ �÷��� �°�' ,'����, ����, ������, �ڷ�����, �ѽ�, ��ǻ��(���ͳ� ����), ���� ���ͳ�, ��Ʈ�� ��Ʈ, �����, �����ü�, �ַ�');
INSERT INTO lounge_info (lounge_num, lounge_name, destination_airport, country, location, operating_time, operator, entry_passenger, service)
VALUES ( 7,'�ö��� �����̾� �����', 'ȫ��(HKG)', '���Ͼƽþ�','1�� ž�±� �α�','�� ���� : ���� �� �ð� : 06:00 ~ 01:00 �� ����� ��� �ð� : �ִ� 3�ð�'
, '����', '�� �ϵ �°� �� ������Ƽ�� Ŭ���� �°� �� �����װ� �и��� ���Ϸ� Ŭ�� �°� �� �����װ� ���į �����̾� Ŭ�� �°�
 �� ��ī���� ����Ʈ �÷��� �°�' ,'����, ����, �ڷ�����, ��ȭ');
INSERT INTO lounge_info (lounge_num, lounge_name, destination_airport, country, location, operating_time, operator, entry_passenger, service)
VALUES ( 8,'��ī���� �����', '�����(YVR)', '����','������ û�� ž�±� D54 ��ó�� ��ġ','�� ���� : ���� �� �ð� : 07:30 ~ 02:00
 �� �߰������� ���� ������Ʈ ���� ��� http://www.skyteam.com/en/lounges/Vancouver ����', '����', '�� ������Ƽ�� Ŭ���� �°� �� �����װ� �и��� ���Ϸ� Ŭ�� �°�
 �� �����װ� ���į �����̾� Ŭ�� �°� �� ��ī���� ����Ʈ �÷��� �°� ���ַ� �������� ���� 19�� �̻� ���� ����( ��, ���� �����ڿʹ� ���� ����)' 
 ,'����, ����, �ѽ�, ���� ���ͳ�, ��Ʈ�� ��Ʈ, ������, �����, �����ü�, �ַ�');

--���� ���� 5��

INSERT INTO cservice VALUES ('82', '�ѱ�', '���ѹα�', '1588-2001', '02-2656-2001', '[������] 
�ѱ���/���� : ���� 07:00-19:00 
[������] 
�ѱ��� : ���� 07:00-22:00 
���� : ���� 24�ð� 
�Ϻ��� : ���� 09:00-19:00(�Ϻ� �����ð� ����) 
�߱��� : ���� 08:00-19:00(�߱� �����ð� ����)','#admin002');
INSERT INTO cservice VALUES ('81', '���Ͼƽþ�', '�Ϻ�', '0570-05-2001', '06-6648-8201', '�ѱ���/���� : ���� 24�ð� 
�Ϻ��� : ���� 09:00-19:00 
�߱��� : ���� 08:00-19:00(�߱� �����ð� ����)','#admin002');
INSERT INTO cservice (cs_num, area, country_name, cs_call1,lang_time, adminid) VALUES ('852', '���Ͼƽþ�', 'ȫ��', '2366-2001', '�ѱ���/���� : ���� 24�ð� 
�Ϻ��� : ���� 09:00-19:00(�Ϻ� �����ð� ����) 
�߱���(����ȭ) : ���� 08:00-19:00(�߱� �����ð� ����)','#admin003');
INSERT INTO cservice (cs_num, area, country_name, cs_call1,lang_time, adminid) VALUES ('61', '�����/��', 'ȣ��', '02-9262-6000', '�ѱ���/���� : ���� 24�ð� 
�Ϻ��� : ���� 09:00-19:00(�Ϻ� �����ð� ����) 
�߱��� : ���� 08:00-19:00(�߱� �����ð� ����)','#admin003');
INSERT INTO cservice VALUES ('7', '���þ�/�߾Ӿƽþ�', '���þ�', '(��ũ��)8-800-500-2510(����)', '(���𺸽���ũ)8-4232-433-444', '�ѱ���/���� : ���� 24�ð� 
�Ϻ��� : ���� 09:00-19:00(�Ϻ� �����ð� ����) 
�߱��� : ���� 08:00-19:00(�߱� �����ð� ����) 
* ������ ���� ����
������� ������ ��ð��� ���� ���� ���� �ð��� �ٸ��ϴ�.','#admin002');

-- ���
INSERT INTO Contract (Contract_code, Essentiality, Contract_title, Contract_contents)
VALUES (1, '�ʼ�', '�̿���', '��1�� ��Ģ ��1�� (����) �� ����� �ߴ����װ�(���� "�����װ�"�̶� �մϴ�)�� ��ϴ� �����װ� �¶��� �÷������� �����ϴ� �¶��� ����(���� "����"�� �մϴ�)�� �̿��Կ� �־� �����װ��� �̿����� �Ǹ��� �� �ǹ� �� å�ӻ����� �������� �������� �մϴ�.');
INSERT INTO Contract (Contract_code, Essentiality, Contract_title, Contract_contents)
VALUES (2, '�ʼ�', '�������� ���� �� �̿� ����', 'ȸ���� �������� ���� �� �̿뿡 ���� ���� ����');
INSERT INTO Contract (Contract_code, Essentiality, Contract_title, Contract_contents)
VALUES (3, '����', '�������� ��3�� ���� ����', 'ȸ���� ����������ȣ�� ���� �̿��� ���� ����');
INSERT INTO Contract (Contract_code, Essentiality, Contract_title, Contract_contents)
VALUES (4, '����', '������ ���� Ȱ�� �� ���� ����', '������ ���� Ȱ�� ����
�����װ��� ���� ����(�̺�Ʈ, ����) ������ ���� �޴���ȭ ��ȣ, �̸��� �ּ�, ���� ������(����, ����), ȸ������(ȸ���, �μ���, ����)�� �����մϴ�.');
INSERT INTO Contract (Contract_code, Essentiality, Contract_title, Contract_contents)
VALUES (5, '����', '��������', '�������');
INSERT INTO Contract (Contract_code, Essentiality, Contract_title, Contract_contents)
VALUES (6, '����', '���θ�� ����', '�������');
INSERT INTO Contract (Contract_code, Essentiality, Contract_title, Contract_contents)
VALUES (7, '����', '�̸���', '�������');
INSERT INTO Contract (Contract_code, Essentiality, Contract_title, Contract_contents)
VALUES (8, '����', 'SMS', '�������');


-- ��� ���� ����
INSERT INTO yesno (Contrat_num, agree, Agree_date, UserID, Contract_code)
VALUES ('1', '����', TO_DATE('2024.03.08', 'YYYY.MM.DD'), 'user001', 1);
INSERT INTO yesno (Contrat_num, agree, Agree_date, UserID, Contract_code)
VALUES ('2', '����', TO_DATE('2024.03.08', 'YYYY.MM.DD'), 'user001', 2);
INSERT INTO yesno (Contrat_num, agree, Agree_date, UserID, Contract_code)
VALUES ('3', '����', TO_DATE('2024.03.08', 'YYYY.MM.DD'), 'user001', 3);
INSERT INTO yesno (Contrat_num, agree, Agree_date, UserID, Contract_code)
VALUES ('4', '����', TO_DATE('2024.03.08', 'YYYY.MM.DD'), 'user001', 4);
INSERT INTO yesno (Contrat_num, agree, Agree_date, UserID, Contract_code)
VALUES ('5', '����', TO_DATE('2024.03.08', 'YYYY.MM.DD'), 'user001', 5);
INSERT INTO yesno (Contrat_num, agree, Agree_date, UserID, Contract_code)
VALUES ('6', '����', TO_DATE('2024.03.08', 'YYYY.MM.DD'), 'user001', 6);
INSERT INTO yesno (Contrat_num, agree, Agree_date, UserID, Contract_code)
VALUES ('7', '����', TO_DATE('2024.03.08', 'YYYY.MM.DD'), 'user001', 7);
INSERT INTO yesno (Contrat_num, agree, Agree_date, UserID, Contract_code)
VALUES ('8', '����', TO_DATE('2024.03.08', 'YYYY.MM.DD'), 'user001', 8);

--����Ʈ ī�� ��� ����

--INSERT INTO CARD_USE VALUES (1,'���',TO_DATE('2024-03-07','YYYY-MM-DD'),500000,'1234-5678-9012-3456');



-------��� ���� �� �̸� �������ϴ� ����,�������� ----------------------------------------------------------------------------
-------��� ���� �� �̸� �������ϴ� ���� ----------------------------------------------------------------------------
-------��� ���� �� �̸� �������ϴ� ���� ----------------------------------------------------------------------------
-------��� ���� �� �̸� �������ϴ� ���� ----------------------------------------------------------------------------
-------��� ���� �� �̸� �������ϴ� ���� ----------------------------------------------------------------------------
-------��� ���� �� �̸� �������ϴ� ���� ----------------------------------------------------------------------------

-- ����� ����
create sequence yesnoseq
start with 1 increment by 1 nomaxvalue nocycle;
create sequence mk_mtrackingseq
start with 1 increment by 1 nomaxvalue nocycle;
create sequence mk_giftcardseq
start with 1 increment by 1 nomaxvalue nocycle;
drop sequence yesnoseq;
drop sequence mk_mtrackingseq;
drop sequence mk_giftcardseq;


------------------------------------Ʈ���� ��� ----------------------------------------------------------
------------------------------------Ʈ���� ��� ----------------------------------------------------------
------------------------------------Ʈ���� ��� ----------------------------------------------------------
------------------------------------Ʈ���� ��� ----------------------------------------------------------
------------------------------------Ʈ���� ��� ----------------------------------------------------------
-- ���� ���� �� ������Ʈ �� 
create or replace trigger tr_mk_payrefund_01
AFTER insert on payrefund
for each row
begin
     if :new.pmethod ='���ϸ���' then
     insert into mtracking values(mk_mtrackingseq.nextval , sysdate, :new.mileage,'�����װ�','�Һ�','user001');
     elsif :new.pmethod ='ī��' then 
     insert into mtracking values(mk_mtrackingseq.nextval , sysdate, :new.mileage, '�����װ�','����','user001');
     elsif :new.pmethod = '����Ʈī��' then
     insert into card_use values ( mk_giftcardseq.nextval,'���' ,sysdate, :new.cost, :new.giftcardnumber);
     end if;
end;
select * from mtracking;
delete mtracking where 1=1;











---- ��� ���� -----------------------------------------------------------------------------------------------------
---- ��� ���� -----------------------------------------------------------------------------------------------------
---- ��� ���� -----------------------------------------------------------------------------------------------------
---- ��� ���� -----------------------------------------------------------------------------------------------------
---- ��� ���� -----------------------------------------------------------------------------------------------------
---- ��� ���� -----------------------------------------------------------------------------------------------------

-----------------------------���� --------------------------------------------------
-----------------------------���� --------------------------------------------------
-----------------------------���� --------------------------------------------------
-----------------------------���� --------------------------------------------------
-----------------------------���� --------------------------------------------------
-----------------------------���� --------------------------------------------------
-----------------------------���� --------------------------------------------------
-----------------------------���� --------------------------------------------------
-----------------------------���� --------------------------------------------------

-- ���� ���� ���ν��� 
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
    vfood varchar2(100) default '(�⳻�� ��������)';
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
--ȸ������ ���ν���
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
        raise_application_error(-20003,' �ʼ� ��� �̵��� ȸ������ ���� �Ұ�');
     end if;
      select userid into vui from flightuser where userid=ui ;
     if ui=vui then
        raise_application_error(-20002,' ����Id �ߺ� ����');
    end if;
    exception 
        when no_data_found then
       insert into flightuser values ( ui,kl,kf,lne,fn,pw,bd,gd,ea1,pn,at1,spn);
       insert into yesno values ( yesnoseq.nextval,'����',to_char(sysdate,'yyyy-mm-dd'),ui,1);
       insert into yesno values ( yesnoseq.nextval,'����',to_char(sysdate,'yyyy-mm-dd'),ui,2);
       insert into yesno values ( yesnoseq.nextval,decode(instr(ct2,'3'),0,'�ź�','����'),to_char(sysdate,'yyyy-mm-dd'),ui,3);
       insert into yesno values ( yesnoseq.nextval,decode(instr(ct2,'4'),0,'�ź�','����'),to_char(sysdate,'yyyy-mm-dd'),ui,4);
       insert into yesno values ( yesnoseq.nextval,decode(instr(ct2,'5'),0,'�ź�','����'),to_char(sysdate,'yyyy-mm-dd'),ui,5);
end;

--ȸ�� Ż�� ���ν���
create or replace procedure mk_flightuser_02
 (
    UI flightuser.userid%type 
 )
 is 

 begin
   delete flightuser
   where userid=ui;
 end;

 --�α��� ���ν���
 
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
        raise_application_error(-20006,'��й�ȣ�� ��ġ���� �ʽ��ϴ�.');
        end if;
        
        dbms_output.put_line('�α��ο� �����Ͽ����ϴ�');
        insert into loginhis values(ui,to_char(sysdate, 'yyyy"��" mm"��" dd"��" hh24"��" mi"��" ss"��"'));
        exception
            when no_data_found then 
            raise_application_error(-20007,'���̵� �������� �ʽ��ϴ�.');
end;


select * from user_role_privs;
exec mk_flightuser_01('user006', 'ȫ', '�浿', 'Hong', 'GilDong', 'password123', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 'Male', 'user001@example.com', '01012345678', 'Korea', '1234-5678-9012-3456',2,35);
exec mk_flightuser_02('user006');

exec mk_flightuser_03('user001','password123');
--�α׾ƿ� ���ν��� -- 
create or replace procedure mk_loginhis_01
is
begin
    delete loginhis where 1=1;
end;

exec mk_loginhis_01;
select * from loginhis;

set serveroutput on;

--���� ���� ���� ��ȸ ���ν��� (������)
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
 select to_char(s.ddate,'yy/mm/dd hh24:mi') ��߽ð�, to_char(s.adate,'yy/mm/dd hh24:mi') �����ð�, 
 to_char(to_number(to_char(s.adate , 'hh24')) -to_number(to_char(s.ddate , 'hh24')) )||'�ð�' || to_char(to_number(to_char(s.adate , 'mi')) -to_number(to_char(s.ddate , 'mi'))) || '��' �ҿ�ð�,
 substr(dairport,instr(dairport,'.')+1) ��߰���,
 substr(aairport,instr(aairport,'.')+1) ��������,
 a.FCLA_COUNT -(select count(p.renum) from scplane s,airplane a ,payrefund p,seat_num sn where s.asnum=a.asnum and s.renum=p.renum and sn.asnum=s.asnum and sn.seat_num=p.seatnumber and substr(s.dairport,1,instr(s.dairport,'.')-1)=dap and substr(s.aairport,1,instr(s.aairport,'.')-1)=aap and to_char(s.ddate,'yymmdd')=dd and sn.seat_grade='�ϵ'
) �����ϵ�� ,
a.PreCLA_COUNT -(select count(p.renum)   from scplane s,airplane a ,payrefund p,seat_num sn where s.asnum=a.asnum and s.renum=p.renum and sn.asnum=s.asnum and sn.seat_num=p.seatnumber and substr(s.dairport,1,instr(s.dairport,'.')-1)=dap and substr(s.aairport,1,instr(s.aairport,'.')-1)=aap and to_char(s.ddate,'yymmdd')=dd and sn.seat_grade='������Ƽ����'
) ����������Ƽ������ , 
a.NCLA_COUNT -(select count(p.renum)  from scplane s,airplane a ,payrefund p,seat_num sn where s.asnum=a.asnum and s.renum=p.renum and sn.asnum=s.asnum and sn.seat_num=p.seatnumber and substr(s.dairport,1,instr(s.dairport,'.')-1)=dap and substr(s.aairport,1,instr(s.aairport,'.')-1)=aap and to_char(s.ddate,'yymmdd')=dd and sn.seat_grade='�Ϲݼ�'
) �����Ϲݼ���, 
d.fare ������� from scplane s,airplane a , dfare d 
where s.asnum=a.asnum 
and substr(s.dairport,1,instr(s.dairport,'.')-1)=dap and substr(s.aairport,1,instr(s.aairport,'.')-1)=aap  and sgrade = d.sg 
and to_char(s.ddate,'yymmdd')=dd and d.peak = CASE
        WHEN to_char(s.ddate, 'yymmdd') = to_date('240101','yymmdd') THEN '������'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_date('240208','yymmdd') AND to_date('240213','yymmdd') THEN '������'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_date('240224','yymmdd') AND to_date('240302','yymmdd') THEN '������'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_date('240503','yymmdd') AND to_date('240506','yymmdd') THEN '������'
        WHEN to_char(s.ddate, 'yymmdd') = to_date('240515','yymmdd') THEN '������'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_Date('240606','yymmdd') AND to_date('240608','yymmdd') THEN '������'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_Date('240727','yymmdd') AND to_date('240824','yymmdd') THEN '������'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_Date('240913','yymmdd')AND to_Date('240919','yymmdd') THEN '������'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_Date('241003','yymmdd') AND to_Date('241005','yymmdd') THEN '������'
        WHEN to_char(s.ddate, 'yymmdd') = to_Date('241009','yymmdd') THEN '������'
        WHEN to_char(s.ddate, 'yymmdd') = to_Date('241225','yymmdd') THEN '������'
        WHEN to_char(s.ddate, 'yymmdd') = to_Date('241231','yymmdd') THEN '������'
        else '�����'
        end
    and d.discount = '����' and d.sg=sgrade and substr(d.route,1,instr(d.route,'/')-1)=dap and substr(d.route,instr(d.route,'-')+1,instr(d.route,'/',-1)-instr(d.route,'-')-1)=aap and 
      d.timezone = case when to_char( s.ddate , 'hh24mi') >= '1500' then '�Ϲ�' else '��ȣ' end  and d.wknddy  = case to_char(s.ddate , 'dy') when '��' then '����' when 'ȭ' then '����' when '��' then '����' when '��' then '����' else '�ָ�' end;
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
            dbms_output.put_line('��߽ð� :'|| rec.��߽ð� || ' �����ð� : ' ||rec.�����ð� || ' ��߰��� :'|| rec.��߰��� ||' �������� :'||rec.�������� || ' �ҿ�ð� : '|| rec.�ҿ�ð� ||' ���� ���� : ' ||rec.������� ||' ���� �ϵ ���� :'|| rec.�����ϵ�� ||' ���� ������Ƽ���� ���� :'||rec.����������Ƽ������||' ���� �Ϲݼ� ���� :'|| rec.�����Ϲݼ���  );
        end loop;
        
        exception 
            when no_data_found then
            dbms_output.put_line('�ش��ϴ� ���� ������ ������ �����ϴ�.');
            when others then
            dbms_output.put_line('�Է� �����Դϴ�.');
end;

exec mk_scplane_01 ('SEOUL','JEJU','240328',1,'�Ϲݼ�');
exec mk_scplane_01 ('SEOUL','JEJU','240323',1,'�Ϲݼ�');
exec mk_scplane_01 ('SEOUL','JEJU','240411',1,'�Ϲݼ�');
--
--���� (���� ) ��� 
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
         if  cardnumc !=1  and ppmethod = '����Ʈī��' then
         raise  nocard ;
        end if;
    select renum  into vrenum from scplane s where to_char(s.ddate ,'YYMMDDhh24mi') =pddate
    and substr(s.dairport,instr(s.dairport,'.')+1) = pdairport and  substr(s.aairport,instr(s.aairport,'.')+1) = paairport ;
    select d.fare ������� into vcost from scplane s,dfare d 
where s.renum=vrenum and d.peak = CASE
        WHEN to_char(s.ddate, 'yymmdd') = to_date('240101','yymmdd') THEN '������'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_date('240208','yymmdd') AND to_date('240213','yymmdd') THEN '������'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_date('240224','yymmdd') AND to_date('240302','yymmdd') THEN '������'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_date('240503','yymmdd') AND to_date('240506','yymmdd') THEN '������'
        WHEN to_char(s.ddate, 'yymmdd') = to_date('240515','yymmdd') THEN '������'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_Date('240606','yymmdd') AND to_date('240608','yymmdd') THEN '������'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_Date('240727','yymmdd') AND to_date('240824','yymmdd') THEN '������'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_Date('240913','yymmdd')AND to_Date('240919','yymmdd') THEN '������'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_Date('241003','yymmdd') AND to_Date('241005','yymmdd') THEN '������'
        WHEN to_char(s.ddate, 'yymmdd') = to_Date('241009','yymmdd') THEN '������'
        WHEN to_char(s.ddate, 'yymmdd') = to_Date('241225','yymmdd') THEN '������'
        WHEN to_char(s.ddate, 'yymmdd') = to_Date('241231','yymmdd') THEN '������'
        else '�����'
        end
    and d.discount = '����' and substr(d.route,instr(d.route,'/')+1,instr(d.route,'-')-instr(d.route,'/')-1)=pdairport and substr(d.route,instr(d.route,'/',-1)+1)=paairport and 
      d.timezone = case when to_char( s.ddate , 'hh24mi') >= '1500' then '�Ϲ�' else '��ȣ' end  and d.wknddy  = case to_char(s.ddate , 'dy') when '��' then '����' when 'ȭ' then '����' when '��' then '����' when '��' then '����' else '�ָ�' end;
    
     if ppmethod = '����Ʈī��' then 
      select amount into vamount from giftcard where card_num = pcardnum; 
        if vamount <vcost then 
        raise nocardamount ;
        end if;
        end if;
      
        vcost := (case when pflight = '����' then vcost*0.85 when pflight = 'Ư��' then vcost *0.55 else vcost end);
          if ppmethod = '���ϸ���' then
            select totalmile into vmile from userdetail where userid = vuserid;
            if vmile<vcost then 
                raise nomile;
                end if;
            end if ;
    insert into payrefund  values
    (mk_payrefundseq.nextval, '����', ppmethod , pflight, pseatnum ,sysdate , pnluggage ,round(vcost,-2), round(vcost*0.005,-1) ,vuserid, vrenum, pcardnum);
    dbms_output.put_line('������ �Ϸ�Ǿ����ϴ�.');
    exception
        when no_data_found then
        dbms_output.put_line('���డ���� ������ �����ϴ�');
        when occupfiederror then
         dbms_output.put_line('�ش� �¼��� �̹� ����Ǿ��ֽ��ϴ�.');
          when nocard then
         dbms_output.put_line('�Է��Ͻ� ����Ʈī�尡 �����ϴ�.');
         when nocardamount then
          dbms_output.put_line('����Ʈī�� �ܾ��� �����մϴ�.');
          when nomile then
          dbms_output.put_line('���ϸ��� �ܾ��� �����մϴ�.');
end;

exec mk_payrefund_01('2403231515','GMP','CJU','20A',1,'����','ī��',1);

select * from loginhis;
select * from adminstrator;
select * from userdetail;
select * from scplane;
SELECT * FROM GIFTCARD;
update giftcard set amount=50000 where sender = '��ö��' ;
select * from payrefund;
SELECT * FROM MTRACKING;
DELETE CARD_USE WHERE 1=1;
SELECT * FROM CARD_USE;
select to_char(ddate,'hh24mi') from scplane;
delete payrefund where 1=1;








-----------------------------���� --------------------------------------------------
-----------------------------���� --------------------------------------------------
-----------------------------���� --------------------------------------------------
-----------------------------���� --------------------------------------------------
-----------------------------���� --------------------------------------------------
-----------------------------���� --------------------------------------------------
-----------------------------���� --------------------------------------------------
-----------------------------���� --------------------------------------------------
-----------------------------���� --------------------------------------------------
-- ������ ���� ��ȸ����
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
 DBMS_OUTPUT.PUT_LINE('��ȭ��ȣ : ' || vrow.cs_call1);
 DBMS_OUTPUT.PUT_LINE('���/�ð� : ' || vrow.lang_time);
 DBMS_OUTPUT.PUT_LINE(' ');
 ELSE
 DBMS_OUTPUT.PUT_LINE(vrow.country_name||'('||vrow.cs_num||')');
 DBMS_OUTPUT.PUT_LINE('��ȭ��ȣ : ' || vrow.cs_call1 || ',' || vrow.cs_call2);
 DBMS_OUTPUT.PUT_LINE('���/�ð� : ' || vrow.lang_time);
 DBMS_OUTPUT.PUT_LINE(' ');
 END IF;
 END LOOP;
END;

EXEC SE_CSERVICE_01('�ѱ�');
EXEC SE_CSERVICE_01('���Ͼƽþ�');

-- �������� ������ ���� ���ν���
CREATE OR REPLACE PROCEDURE ye_Notice_01(
    p_Notice_num IN VARCHAR2,
    p_New_Title IN VARCHAR2
)
AS
BEGIN
    UPDATE Notice
    SET Notice_title = p_New_Title
    WHERE Notice_num = p_Notice_num;
    
    -- ������ ������ ���
    DBMS_OUTPUT.PUT_LINE('Notice_num: ' || p_Notice_num || ', Notice_title: ' || p_New_Title || ' - ������ ���������� ����Ǿ����ϴ�.');
    
    COMMIT;
END;
-- �������� ������ ���� ���ν���
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
    DBMS_OUTPUT.PUT_LINE('"���ο� ���������� �߰��Ǿ����ϴ�."');
    COMMIT;
END;


SET SERVEROUTPUT ON;
BEGIN
    ye_Notice_01('10', '���ο� ��������', '���ο� ����', '���ο� ����', 'admin003');
END;
/
SET SERVEROUTPUT ON;
DECLARE
    notice_cursor SYS_REFCURSOR;
BEGIN
    ye_Notice_02('10', notice_cursor);
END;


-- �������� ��ȸ�� ���� ���ν���
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
    DBMS_OUTPUT.PUT_LINE('"���������� ����߽��ϴ�."');
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

-- �������� ������ ���� ���ν���
CREATE OR REPLACE PROCEDURE ye_Notice_03(
    p_Notice_num IN VARCHAR2,
    p_New_Title IN VARCHAR2
)
AS
BEGIN
    UPDATE Notice
    SET Notice_title = p_New_Title
    WHERE Notice_num = p_Notice_num;
    DBMS_OUTPUT.PUT_LINE('Notice_num: ' || p_Notice_num || ', Notice_title: ' || p_New_Title || ' - ������ ���������� ����Ǿ����ϴ�.');
    COMMIT;
END;

SET SERVEROUTPUT ON;
BEGIN
    UpdateNoticeTitle('1', '�����Ű� ���� ����ٳ�����');
END;


-- �������� ������ ���� ���ν���
CREATE OR REPLACE PROCEDURE ye_Notice_04(
    p_Notice_num IN VARCHAR2
)
AS
BEGIN
    DELETE FROM Notice
    WHERE Notice_num = p_Notice_num;
    DBMS_OUTPUT.PUT_LINE('"���������� �����Ǿ����ϴ�."');
    COMMIT;
END;

SET SERVEROUTPUT ON;
BEGIN
    ye_Notice_04('3');
END;

--������ �⺻���� �ۼ� ����
--EXEC  up_createifare('ICN', 'FUK', '�Ϲݼ�', 150000, 110000, 20300, 21000, 'admin004');
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
    -- ������ ���� Ȯ��
    SELECT COUNT(*)
    INTO v_admin_count
    FROM Adminstrator
    WHERE AdminID = p_adminid;

    IF v_admin_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('�ش� �����ڴ� ������ �����ϴ�.');
        RETURN;
    END IF;

    -- KEYNUM �� �Ѱ��� ����
    SELECT NVL(MAX(keynum), 0) + 1 INTO v_keynum FROM ifare;

    -- ���� ���� �ۼ�
    INSERT INTO ifare (keynum, starta, arrive, sg, fare, redis, tax, fuelch, adminid)
    VALUES (v_keynum, p_starta, p_arrive, p_sg, p_fare, p_redis, p_tax, p_fuelch, p_adminid);
    DBMS_OUTPUT.PUT_LINE('���� ������ ���������� �߰��Ǿ����ϴ�.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('�ش��ϴ� �����ڰ� �����ϴ�.');
END;

------------------------------------------------------------------------------
SELECT *
FROM ifare;
EXEC up_updateifare(3, NULL, NULL, '���', NULL, NULL, NULL, NULL, 'admin005');

--������ ���� ���̺� ��������
--EXEC up_updateifare(3, 'IC', 'FU', '�ݼ�', 333333, 333333, 33333, 33333, 'admin001');
--                   (keynum, starta, arrive, sg, fare, redis, tax, fuelch, adminid)
--EXEC up_updateifare(3, NULL, NULL, '���', NULL, NULL, NULL, NULL, 'admin005');
--                  �Ϻθ� �����ϰ���������� NULL���� �ش�.
--                  ������ ��� adminid�� ����Ȯ�ο��� ����
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
    -- ������ ���� Ȯ��
    SELECT COUNT(*)
    INTO v_admin_count
    FROM Adminstrator
    WHERE AdminID = p_adminid;

    IF v_admin_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('�ش� �����ڴ� ������ �����ϴ�.');
        RETURN;
    END IF;

    -- �Ű������� NULL�� �ƴϸ� �ش� ������ ����
    UPDATE ifare
    SET starta = COALESCE(p_starta, starta),
        arrive = COALESCE(p_arrive, arrive),
        sg = COALESCE(p_sg, sg),
        fare = COALESCE(p_fare, fare),
        redis = COALESCE(p_redis, redis),
        tax = COALESCE(p_tax, tax),
        fuelch = COALESCE(p_fuelch, fuelch)
    WHERE keynum = p_keynum;
    
    DBMS_OUTPUT.PUT_LINE('���� ������ ���������� �����Ǿ����ϴ�.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('�ش��ϴ� �����ڰ� �����ϴ�.');
END;
------------------------------------------------------------------------------
--������ ���� ���̺� ���� ���ν���
--EXEC up_deleteifare(3, 'admin001');
CREATE OR REPLACE PROCEDURE up_deleteifare (
    p_keynum IN ifare.keynum%TYPE,
    p_adminid IN VARCHAR2
)
IS
    v_admin_count NUMBER;
BEGIN
    -- ������ ���� Ȯ��
    SELECT COUNT(*)
    INTO v_admin_count
    FROM Adminstrator
    WHERE AdminID = p_adminid;

    IF v_admin_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('�ش� �����ڴ� ������ �����ϴ�.');
        RETURN;
    END IF;

    -- ���� ���� ����
    DELETE FROM ifare
    WHERE keynum = p_keynum;
    DBMS_OUTPUT.PUT_LINE('���� ������ ���������� �����Ǿ����ϴ�.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('�ش��ϴ� ���� ������ �����ϴ�.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('���� ������ �����ϴ� ���� ������ �߻��߽��ϴ�.');
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

--������ �⺻���� �ۼ� ����
--EXEC  up_createifare('ICN', 'FUK', '�Ϲݼ�', 150000, 110000, 20300, 21000, '#admin003');
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
    -- ������ ���� Ȯ��
    SELECT COUNT(*)
    INTO v_admin_count
    FROM Adminstrator
    WHERE AdminID = p_adminid;

    IF v_admin_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('�ش� �����ڴ� ������ �����ϴ�.');
        RETURN;
    END IF;

    -- KEYNUM �� �Ѱ��� ����
    SELECT NVL(MAX(keynum), 0) + 1 INTO v_keynum FROM ifare;

    -- ���� ���� �ۼ�
    INSERT INTO ifare (keynum, starta, arrive, sg, fare, redis, tax, fuelch, adminid)
    VALUES (v_keynum, p_starta, p_arrive, p_sg, p_fare, p_redis, p_tax, p_fuelch, p_adminid);
    DBMS_OUTPUT.PUT_LINE('���� ������ ���������� �߰��Ǿ����ϴ�.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('�ش��ϴ� �����ڰ� �����ϴ�.');
END;

------------------------------------------------------------------------------



--������ ���� ���̺� ��������
--EXEC up_updateifare(3, 'IC', 'FU', '�ݼ�', 333333, 333333, 33333, 33333, '#admin001');
--                   (keynum, starta, arrive, sg, fare, redis, tax, fuelch, adminid)
--EXEC up_updateifare(3, NULL, NULL, '���', NULL, NULL, NULL, NULL, '#admin005');
--                  �Ϻθ� �����ϰ���������� NULL���� �ش�.
--                  ������ ��� adminid�� ����Ȯ�ο��� ����
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
    -- ������ ���� Ȯ��
    SELECT COUNT(*)
    INTO v_admin_count
    FROM Adminstrator
    WHERE AdminID = p_adminid;

    IF v_admin_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('�ش� �����ڴ� ������ �����ϴ�.');
        RETURN;
    END IF;

    -- �Ű������� NULL�� �ƴϸ� �ش� ������ ����
    UPDATE ifare
    SET starta = COALESCE(p_starta, starta),
        arrive = COALESCE(p_arrive, arrive),
        sg = COALESCE(p_sg, sg),
        fare = COALESCE(p_fare, fare),
        redis = COALESCE(p_redis, redis),
        tax = COALESCE(p_tax, tax),
        fuelch = COALESCE(p_fuelch, fuelch)
    WHERE keynum = p_keynum;
    
    DBMS_OUTPUT.PUT_LINE('���� ������ ���������� �����Ǿ����ϴ�.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('�ش��ϴ� �����ڰ� �����ϴ�.');
END;
------------------------------------------------------------------------------
--������ ���� ���̺� ���� ���ν���
--EXEC up_deleteifare(3, '#admin001');
--EXEC up_deleteifare('3~5', '#admin001');
--EXEC up_deleteifare('4,8', '#admin001');
--�Ѱ��� �ุ ���ﶧ���� ���ڸ� �Ű������� �ް�
--�ΰ��̻� Ȥ�� ������ ���� ���ﶧ���� ,�� ~�� �Է��� ���ڿ��� �Ű������� �� �� �ִ�.
CREATE OR REPLACE PROCEDURE up_deleteifare (
    p_range_or_nums IN VARCHAR2,
    p_adminid IN VARCHAR2
)
IS
    v_admin_count NUMBER;
    v_deleted_count NUMBER := 0;
BEGIN
    -- ������ ���� Ȯ��
    SELECT COUNT(*)
    INTO v_admin_count
    FROM Adminstrator
    WHERE AdminID = p_adminid;

    IF v_admin_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('�ش� �����ڴ� ������ �����ϴ�.');
        RETURN;
    END IF;

    -- ��ǥ�� ���е� Ű�ѵ� �Ľ��Ͽ� ����
    IF INSTR(p_range_or_nums, '~') > 0 THEN -- ���� ���·� ���� ���
        FOR i IN (
            SELECT TO_NUMBER(REGEXP_SUBSTR(p_range_or_nums, '\d+', 1, 1)) AS start_keynum,
                   TO_NUMBER(REGEXP_SUBSTR(p_range_or_nums, '\d+', 1, 2)) AS end_keynum
            FROM dual
        ) LOOP
            FOR j IN i.start_keynum..i.end_keynum LOOP
                DELETE FROM ifare -- ifare ���̺�� ����
                WHERE keynum = j;
                v_deleted_count := v_deleted_count + SQL%ROWCOUNT;
            END LOOP;
        END LOOP;
    ELSE -- ��ǥ�� ���е� Ű�ѵ��� ���� ��� �Ǵ� ���� Ű���� ���� ���
        FOR i IN (
            SELECT TO_NUMBER(REGEXP_SUBSTR(p_range_or_nums, '\d+', 1, LEVEL)) AS keynum
            FROM dual
            CONNECT BY LEVEL <= REGEXP_COUNT(p_range_or_nums, '\d+')
        ) LOOP
            DELETE FROM ifare -- ifare ���̺�� ����
            WHERE keynum = i.keynum;
            v_deleted_count := v_deleted_count + SQL%ROWCOUNT;
        END LOOP;
    END IF;

    -- ������ �� ���� 0�̸� �ش��ϴ� ���� ������ ���ٰ� ���
    IF v_deleted_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('�ش��ϴ� ���� ������ �����ϴ�.');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_deleted_count || '���� ���� ������ ���������� �����Ǿ����ϴ�.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('���� ������ �����ϴ� ���� ������ �߻��߽��ϴ�.');
END;















SELECT *
FROM Adminstrator;
DELETE FROM Adminstrator
WHERE adminid IN (#admin001,#admin002,#admin003,#admin004,#admin005) ;
--------------------------------------------------------------------------------------------------------
--������ �⺻���� �ۼ� ����
EXEC up_createdfare('������', 'Ư��', '��ȣ', '�Ϲݼ�', '����/����', 50000, 1000, '#admin005', '�ָ�');
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
    -- ������ ���� Ȯ��
    SELECT COUNT(*)
    INTO v_admin_count
    FROM Adminstrator
    WHERE AdminID = p_adminid;

    IF v_admin_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('�ش� �����ڴ� ������ �����ϴ�.');
        RETURN;
    END IF;

    -- KEYNUM �� ����
    SELECT NVL(MAX(keynum), 0) + 1 INTO v_keynum FROM dfare;

    -- ���� ���� �ۼ�
    INSERT INTO dfare (keynum, peak, discount, timezone, sg, route, fare, redis, adminid, wknddy)
    VALUES (v_keynum, p_peak, p_discount, p_timezone, p_sg, p_route, p_fare, p_redis, p_adminid, p_wknddy);

    DBMS_OUTPUT.PUT_LINE('���� ������ ���������� �߰��Ǿ����ϴ�.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('�ش��ϴ� �����ڰ� �����ϴ�.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('���� ������ �߰��ϴ� ���� ������ �߻��߽��ϴ�.');
END;



--------------------------------------------------------------------------------------------------------

--������ ���� ���� ���ν���
--EXEC up_updatedfare(4, NULL, NULL, NULL, NULL, NULL, 888500, NULL, '#admin001', 'ȣ������');
--                  (keynum, peak, discount, timezone, sg, route, fare, redis, adminid, wknddy)
--                  �Ű������� �����ϰ���� ���� �ְų�, NULL�� �Է��Ͽ� ������ ���� ������� �ʰ� �� �� �ִ�.

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
    -- ������ ���� Ȯ��
    SELECT COUNT(*)
    INTO v_admin_count
    FROM Adminstrator
    WHERE AdminID = p_adminid;

    IF v_admin_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('�ش� �����ڴ� ������ �����ϴ�.');
        RETURN;
    END IF;

    -- ���� ���� ����
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

    DBMS_OUTPUT.PUT_LINE('���� ������ ���������� �����Ǿ����ϴ�.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('�ش��ϴ� ���� ������ �����ϴ�.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('���� ������ �����ϴ� ���� ������ �߻��߽��ϴ�.');
END;


--------------------------------------------------------------------------------------------------------
--������ �������� ���� ���ν���
--EXEC up_deletedfare(13, '#admin001');
--keynum���� ������ID�� �Ű������� �޾� �ش� ���� ������ ����
--EXEC up_deletedfare('9~13', '#admin001');
--                  ���ڿ��� ���ڿ� ���� ���̿� '~' �� �Է��� ���� �ָ� �ټ����� ������ ����
--EXEC up_deletedfare('9,13,4,7', '#admin001');
--                  ','�� �ָ� �ش��ϴ� ��ȣ�� ��� ���� ����
CREATE OR REPLACE PROCEDURE up_deletedfare (
    p_range_or_nums IN VARCHAR2,
    p_adminid IN VARCHAR2
)
IS
    v_admin_count NUMBER;
    v_deleted_count NUMBER := 0;
BEGIN
    -- ������ ���� Ȯ��
    SELECT COUNT(*)
    INTO v_admin_count
    FROM Adminstrator
    WHERE AdminID = p_adminid;

    IF v_admin_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('�ش� �����ڴ� ������ �����ϴ�.');
        RETURN;
    END IF;

    -- ��ǥ�� ���е� Ű�ѵ� �Ľ��Ͽ� ����
   IF INSTR(p_range_or_nums, '~') > 0 THEN -- ���� ���·� ���� ���
    FOR i IN (
        SELECT TO_NUMBER(REGEXP_SUBSTR(p_range_or_nums, '\d+', 1, 1)) AS start_keynum,
               TO_NUMBER(REGEXP_SUBSTR(p_range_or_nums, '\d+', 1, 2)) AS end_keynum
        FROM dual
    ) LOOP
        FOR j IN i.start_keynum..i.end_keynum LOOP
            DELETE FROM dfare -- dfare ���̺�� ����
            WHERE keynum = j;
            v_deleted_count := v_deleted_count + SQL%ROWCOUNT;
        END LOOP;
    END LOOP;
ELSE -- ��ǥ�� ���е� Ű�ѵ��� ���� ��� �Ǵ� ���� Ű���� ���� ���
    FOR i IN (
        SELECT TO_NUMBER(REGEXP_SUBSTR(p_range_or_nums, '\d+', 1, LEVEL)) AS keynum
        FROM dual
        CONNECT BY LEVEL <= REGEXP_COUNT(p_range_or_nums, '\d+')
    ) LOOP
        DELETE FROM dfare -- dfare ���̺�� ����
        WHERE keynum = i.keynum;
        v_deleted_count := v_deleted_count + SQL%ROWCOUNT;
    END LOOP;
END IF;

    -- ������ �� ���� 0�̸� �ش��ϴ� ���� ������ ���ٰ� ���
    IF v_deleted_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('�ش��ϴ� ���� ������ �����ϴ�.');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_deleted_count || '���� ���� ������ ���������� �����Ǿ����ϴ�.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('���� ������ �����ϴ� ���� ������ �߻��߽��ϴ�.');
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
--    -- ������ ���� Ȯ��
--    SELECT COUNT(*)
--    INTO v_admin_count
--    FROM Adminstrator
--    WHERE AdminID = p_adminid;
--
--    IF v_admin_count = 0 THEN
--        DBMS_OUTPUT.PUT_LINE('�ش� �����ڴ� ������ �����ϴ�.');
--        RETURN;
--    END IF;
--
--    -- ���� ���� ����
--    DELETE FROM dfare
--    WHERE keynum = p_keynum;
--
--    -- ������ �� �� Ȯ��
--    v_deleted_count := SQL%ROWCOUNT;
--
--    IF v_deleted_count = 0 THEN
--        DBMS_OUTPUT.PUT_LINE('�ش��ϴ� ���� ������ �����ϴ�.');
--    ELSE
--        DBMS_OUTPUT.PUT_LINE('���� ������ ���������� �����Ǿ����ϴ�.');
--    END IF;
--EXCEPTION
--    WHEN OTHERS THEN
--        DBMS_OUTPUT.PUT_LINE('���� ������ �����ϴ� ���� ������ �߻��߽��ϴ�.');
--END;

----------------------------------------------------------------------------------------------------------------

--SELECT *
--FROM ifare
--WHERE starta = 'ICN'
--AND arrive = 'PEK'
--AND sg = '�Ϲݼ�';
--DESC dfare;
--DESC ifare;
--
--
----������ �������� ��ȸ ���ν���
----�Ű����� �����, ������, �¼����
----EXEC up_ifareinfo( 'ICN', 'PEK', '�Ϲݼ�' );
----�ش��ϴ� ������ �ΰ� �̻��� ��� ��� ��µǵ��� ����
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
--        DBMS_OUTPUT.PUT_LINE('�˻��Ͻ� ' || p_starta || '���� ����Ͽ� ' ||  p_arrive || '���� ����Ǵ� ' ||  p_sg || ' �¼��� ���� �����Դϴ�' );
--        DBMS_OUTPUT.PUT_LINE('���� : ' || v_fare || '��');
--        DBMS_OUTPUT.PUT_LINE('ȯ�Ҿ� : ' || v_redis|| '��');
--        DBMS_OUTPUT.PUT_LINE('���� : ' || v_tax|| '��');
--        DBMS_OUTPUT.PUT_LINE('�������� : ' || v_fuelch|| '��');
--        DBMS_OUTPUT.PUT_LINE('-------------------------------------');
--        
--        v_row_count := v_row_count + 1;
--    END LOOP;
--    CLOSE fare_cursor;
--
--    IF v_row_count = 0 THEN
--        DBMS_OUTPUT.PUT_LINE('�ش��ϴ� ������ �������� �ʽ��ϴ�.');
--    END IF;
--EXCEPTION
--    WHEN OTHERS THEN
--        DBMS_OUTPUT.PUT_LINE('���� �߻�');
--END;
------------------------------------------------------------------------------------------------------------
SELECT *
FROM movie;



--���̺� ����
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
--��ȭ ���� �ۼ� ���ν���
EXEC up_create_movie('� ������', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '��ť���͸�', '(��ť���͸�) �泲 ������ ��� �Ѿ��, �װ����� 60�� ���� �Ѿ���� ��Ų �Ѿ�� ������ ������ �ִ�. �� ����� ��ȸ�� ȯ���ϰ� ���ͺ� �� �� ���� �ʰ� ���� �̵��� ����鼭�� �ڽ��� �� �� �� ������ ���� �ʴ� �׸� ��������.', '�ѱ���');
EXEC up_create_movie('����Ƹǰ� �ν�Ʈ ŷ��', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '�׼�', '������ ����� ������ �������� �տ� ���� �� ��Ÿ�� �ƹ����� ���� ���� ����Ƹ��� ���ʶ߸��� �Ѵ�.', '����, �����ξ�');
EXEC up_create_movie('ȭ��', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '���', '(���) ���ƹ����� �ݺ��Ǵ� �������� ���� ���� ��� ������ ���� �״������ ������ ���� ������ ����� �ҳ� ����. ��� �� ������ ��Ű�� ���� �ο��� ���̰� �ǰ� ���Ǳ��� �ʿ��� ���Կ��� ������ �߰� ���� ġ���� ������ �ش�.', '�ѱ���');
EXEC up_create_movie('���� �������͸�', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '�θǽ�', '(�θǽ�) ���ι�ȣ 2537�� �ֳ��� 7��° ���� ��, ��Ӵ��� �ΰ�� 3�ϰ��� �ް��� ����ȴ�. ��ʽĿ� ���� ���� ź �þ�Ʋ�� ������ �ѱ���� ź ���� ���� ������. ���� ���� ���� ã�ư��ڴٸ� �ֳ����� ������ �ð踦 ä���ش�.', '�ѱ���');
EXEC up_create_movie('30��', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '�ڹ̵�', '(�ڹ̵�) ������ �ܸ�, �����Ա��� Ÿ�� ������ �ɷ°� Ŀ����, �ʱ���� Ÿ�� ����� ��ȭ���� ����� ������ ������ �����԰� �ʱ⸦ �ߵ�� ���� ��ħ�� ��ȥ�� ����Ѵ�. �׷��� ��ȥ�� 30�� �յ� ���� ���� ������ ���Ѵ�.', '�ѱ���');
EXEC up_create_movie('�Ź���', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '�ڹ̵�', '(�ڹ̵�) �������̾��� ������ ����, ����� ���տ� �ô޸��� �谨���� �Կ��� ���� ��ȭ �Ź����� ���ο� �ḻ�� ���� ���� ��ĥ° �ٰ� �ִ�. �״�θ� ������ Ʋ������ ������ �ȴٴ� ������ �� ��Ʋ���� �߰� �Կ��� �޲۴�.', '�ѱ���');
EXEC up_create_movie('õ�ڻ� �� ������: ������ ���', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '���', '(��Ÿ��) ���� ������ ���� �� ������ ��������� ���� �ͽ��� ���� �ʴ� ��¥ �𸶻� õ�ڻ�� ����� ������ ��մ� ���������� ��¥ �𸶸� �ϸ�, �Ƿڹ��� ��ǵ��� �ذ��Ѵ�. �Ƿ��� ������ ã�ƿ� �����ϱ� ���� ������ �Ѵ�.', '�ѱ���');
EXEC up_create_movie('����', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '���', '�̱۸� ������� �Ƶ��� �ൿ�� �̻������� �б��� ã�ư� �����԰� ����� �ϴµ�, �׳� ���� �����԰� �л����� �����Ⱑ �ɻ�ġ �ʰ� �帣�� �����Ѵ�.', '�Ϻ���');
EXEC up_create_movie('�ؽ�Ʈ �� ����', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '���', '2001�� FIFA �����ſ��� 31 �� 0���� �й��� ������ �Ǹ� ���� �Ƹ޸�ĭ���� ������ǥ���� �� ���� ���Ӱ� ������ ������ ������ ������ ���� ��ȭ�� ���� ��ȭ.', '����');
EXEC up_create_movie('�������̸�', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '���', '���� ������ ������ �������̸��� ���� �׸� ��ȭ. ������ ��������, �ı������� �𸣴� �������̸��� �̾߱⸦ ��Ҵ�.', '����');
EXEC up_create_movie('1947 ������', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '���', '(���) 1936�� ������ �ø��� ������ �ݸ޴޸���Ʈ �ձ����� �û�뿡�� ������ �� ����⸦ ���� ������ ź������ �� �̻� �޸� �� ���� �ȴ�. ���� ���� �˸��޴� ������� �������� ������ ������ ������ ��ȸ�� �����ڰ� �����Ѵ�.', '�ѱ���');
EXEC up_create_movie('��Ű���: �뷡�ϴ� ���� ���� �߶��', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '�׼�', '��Ű��� 10ȸ�� �¾� �������� ���Ե��� ������ ��� �׷����� ���䰡 �ǰ�, ���� �� ���̿��� ���ɰ� �ο��.', '����');
EXEC up_create_movie('���˵���3', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '����', '(����) ��Ʈ�� ��ġ ���ع� �˰� �� 7�� ��, �������� ���� ������� ��Ź�Ǿ� ���ο� ������� �Բ� ���λ���� �����Ѵ�. ��� ���� �� ������ ���� ���� ����� ����Ǿ����� �˰� �ǰ� ���縦 Ȯ���Ѵ�.', '�ѱ���');
EXEC up_create_movie('Ʈ��: ��� ���Դ�', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '�ִϸ��̼�', '������ ����ģ������ �ְ��� ���̵� �׷� ������� ������� �귣ġ�� ��ġ���� ���� ������ ���ϱ� ���� ����� �ִ� ����� ������� �ҷ� ������.', '�ѱ���');
EXEC up_create_movie('Ʈ��', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '�ִϸ��̼�', '��ΰ� �ູ�� Ʈ�� �ձ��� ��� ������ ������ �ĵ��´�. ���� ���� ���Ǵ� ��ġ�� ģ������ ���ϱ� ���� ������ ģ�� �귣ġ�� ����õ���� ������ ������.', '�ѱ���');
EXEC up_create_movie('�ٿ�ư �ֺ� 2', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '���', '�� ���������� �α� �ִ� TV �ø��� "�ٿ�ư �ֺ�"�� ��ȭ�� ���� ��ǰ.', '����');
EXEC up_create_movie('���긮�� ���긮���� �� �� ����', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '�׼�', '�������� ��ϴ� �߱��� �̱��� �������� ������ ��ȥ �䱸�� �����ϴ� ���� ���� ȥ���� �����µ�, ��� �� ��Ƽ���� �ȿ��� ��ư��� ���� ���� �ڽ��� �߰��ϰ� �ȴ�.', '����');
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
    DBMS_OUTPUT.PUT_LINE('��ȭ ������ ���������� �߰��Ǿ����ϴ�. MovieID: ' || v_MovieID);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('��ȭ ������ �߰��ϴ� ���� ������ �߻��߽��ϴ�: ' || SQLERRM);
        ROLLBACK;
END;
------------------------------------------------------------------------------------------------------------

--��ȭ ���� ���� ���ν���
--EXEC up_update_movie(0001,'��', TO_DATE('2024-06-30', 'YYYY-MM-DD'),'��','��','��');
--�Ű������� �⺻Ű�� ������ �����ϰ��� �ϴ� ������ ���ڿ��� ����
--
--EXEC up_update_movie(0001,'��',TO_DATE,NULL,'��',NULL);
--NULL�� �ָ� ���� ������ �ʴ´�.
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
        DBMS_OUTPUT.PUT_LINE('�ش��ϴ� ���� ���̵��� ��ȭ�� ã�� �� �����ϴ�.');
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('��ȭ ������ ���������� ������Ʈ�Ǿ����ϴ�.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('��ȭ ������ ������Ʈ�ϴ� ���� ������ �߻��߽��ϴ�: ' || SQLERRM);
        ROLLBACK;
END;
------------------------------------------------------------------------------------------------------------

--��ȭ ���� ���� ���ν���

SELECT *
FROM movie;
EXEC up_delete_movie('7');
EXEC up_delete_movie('18,27,30');
EXEC up_delete_movie('6~10');
CREATE OR REPLACE PROCEDURE up_delete_movie (
    p_MovieID IN VARCHAR2
)
IS
    v_deleted_count NUMBER := 0; -- ������ �� ���� �����ϱ� ���� ����
BEGIN
    IF INSTR(p_MovieID, '~') > 0 THEN -- ���� ���·� ���� ���
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
    ELSE -- ��ǥ�� ���е� Ű�ѵ��� ���� ��� �Ǵ� ���� Ű���� ���� ���
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
        DBMS_OUTPUT.PUT_LINE('�ش��ϴ� ���� ���̵��� ��ȭ�� ã�� �� �����ϴ�.');
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('��ȭ ������ ���������� �����Ǿ����ϴ�.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('��ȭ ������ �����ϴ� ���� ������ �߻��߽��ϴ�: ' || SQLERRM);
        ROLLBACK;
END;
------------------------------------------------------------------------------------------------------------
--��ȭ ���� ��ȸ ���ν���
--EXEC up_movieinfo(202404);
--������ ���� �����ڸ� ���ڷ� �Է¹޾� �ش� ���� ��û ������ ��ȭ ���� ��ȸ
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
        DBMS_OUTPUT.PUT_LINE('����: ' || movieinfo.Title);
        DBMS_OUTPUT.PUT_LINE('��û��������: ' || TO_CHAR(movieinfo.Duration, 'YYYY-MM-DD'));
        DBMS_OUTPUT.PUT_LINE('�帣: ' || movieinfo.Category);
        DBMS_OUTPUT.PUT_LINE('�ٰŸ�: ' || movieinfo.Content);
        DBMS_OUTPUT.PUT_LINE('���: ' || movieinfo.Lang);
        DBMS_OUTPUT.PUT_LINE('---------------------------------------');
    END LOOP;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('�ش� ���� ��û ������ �������� �����ϴ�.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('������ ��ȸ �� ������ �߻��߽��ϴ�: ' || SQLERRM);
END;
----------------------------------------------------------------------------------------------------

--EXEC up_create_TV('���� �Һ� ����1 (1-2)', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '���', '��2�� ������� �� ��ġ�κ��� ���� ����ũ�� ������ ������ ���� �߶��� �� ���� ������ �̾߱⸦ ���� ���.');
--EXEC up_create_TV('�������� ����7 (1-5)', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '���', '������� ������ ���� ģ������ 1950���� ���� �ȴ�.');
--EXEC up_create_TV('1923 ����1 (1-5)', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '���', '20���� �ʹ�, ������� ������ ���Ȳ ������ ����� ���� �ָ���ġ�� ���� ��ƿ��� �������ϴ� ��ư ������ �̾߱⸦ �׸� ���.');
--EXEC up_create_TV('�� �� ���� ����������� ����24 (1-5)', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '���', '�ø���� ������ �̲��� ����� ������������� �̾߱⸦ �׸� ���.');
--EXEC up_create_TV('���� ����6 (1-5)', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '���', '������ �ӹ��� �����ϴ� �� �ر� Ư���δ������ �̾߱⸦ �׸� ���.');
--EXEC up_create_TV('KBS ��� ����� 2023 (1-3)', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '���', '�پ��ϰ� �ϼ��� �ִ� �̾߱�� ���۵� ���� ��󸶸� ���� ���α׷�.');
--EXEC up_create_TV('����ھ� ����ȥ��', TO_DATE('2024-03-31', 'YYYY-MM-DD'), '���', '������ �پ�Ѿ� 2023�� ���ѹα��� �絵�� 19���� ���� �� �ڿ���� 21���� ������ ���ǿ� �������� ���ʰ��� ��� ��ȥ ���丮.');
--EXEC up_create_TV('���� ����Ŀ ����1 (1-3)', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '���', 'ȭ������ ���� ���۰��� ���� ������ �� ���踦 ���� ���ο� ������ �������� �ϼ��� ������.');
--EXEC up_create_TV('���Ŭ�� ����-���� ����8 (1-5)', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '���', '���� ����ũ ���Ÿ�� ��Ģ������ ���� ȦƮ�� �ִ� ���Ŭ�� 99 ���� �������� �̾߱⸦ �׸� ���.');
--EXEC up_create_TV('�Ž� �� ��ũ�����̼� ����7 (1-5)', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '���', '�ε�ֳ��� ���Ͻ��� �����޾�ο��� ���ϴ� ������ �������� ������ ���ø� ���� �� ��հ� ����� ���� ���Ӿ��� ����ϸ� �������� �̾߱�.');
--EXEC up_create_TV('������ ����10 (1-5)', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '��Ʈ��', '���忡 ��� ���� û����� ���̳��� �� �ϻ��� �׸� ��Ʈ��.');
--EXEC up_create_TV('�¾ �迡 �������� 3 (1-2)', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '����', '�¾ �迡 �ڽ��� ��Ŷ����Ʈ�� �̷ﳪ���� ���84, �̹��� ������ �ٴٷ� ���Ѵ�! ������ �ڿ��� ǰ�� ����� ��, ���ٰ���ī��! �ٴ�� �� ������ ã�� �� Ÿ�� ������ "�°�����" �� ��° ����!');
--EXEC up_create_TV('���ѵ���', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '12�� �̻� ������', '���ѹα� ��� �������� ��ó�ϴ� ���ڵ��� ���� ���ο� ��Ȳ �ӿ��� ��ġ�� ����쵹 ������.');
--EXEC up_create_TV('�ν�Ż�� ������ ������ �翬 �ִϸ��̼� by YOUTOO (1-4)', TO_DATE('2024-04-30', 'YYYY-MM-DD'), '12�� �̻� ������', '���� �α⸦ �ڶ��ϴ� �ν�Ż�� ������ ������ �翬! �ڹ̵�� ���±հ� �����찡 �Ұ��ϴ� û���ڵ��� ����ʿ� ������� �ִϸ��̼ǰ� ������!');
--TV���̺� �ۼ� ���ν���
--EXEC up_create_TV(TV���α׷�,�Ⱓ,�帣,�ٰŸ��׼���);
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
    DBMS_OUTPUT.PUT_LINE('��ȭ ������ ���������� �߰��Ǿ����ϴ�. MovieID: ' || v_MovieID);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('��ȭ ������ �߰��ϴ� ���� ������ �߻��߽��ϴ�: ' || SQLERRM);
        ROLLBACK;
END;
----------------------------------------------------------------------------------------------------
--TV ���̺� ���� ���ν���
--EXEC up_update_TV(13,NULL,TO_DATE('2024-04-20', 'YYYY-MM-DD'),NULL,NULL);
--EXEC up_update_TV(14,NULL,TO_DATE('2024-10-20', 'YYYY-MM-DD'),'���Է�',NULL);
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
        DBMS_OUTPUT.PUT_LINE('�ش��ϴ� TV ���̵��� ���α׷��� ã�� �� �����ϴ�.');
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('TV ���α׷� ������ ���������� ������Ʈ�Ǿ����ϴ�.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('TV ���α׷� ������ ������Ʈ�ϴ� ���� ������ �߻��߽��ϴ�: ' || SQLERRM);
        ROLLBACK;
END;


----------------------------------------------------------------------------------------------------


--TV ���̺� ���� ���ν���
--EXEC up_delete_TV(13);
--EXEC up_delete_TV('1~16');
--EXEC up_delete_TV('6,7,8,10');

CREATE OR REPLACE PROCEDURE up_delete_TV (
    p_TVIDs IN VARCHAR2
)
IS
    v_deleted_count NUMBER := 0;
BEGIN
    IF INSTR(p_TVIDs, '~') > 0 THEN  -- ~�� ���е� ���ڿ����ڸ� ���� ���
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
    ELSE -- ��ǥ�� ���е� TVID���� ���� ��� �Ǵ� ���� TVID�� ���� ���
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
        DBMS_OUTPUT.PUT_LINE('�ش��ϴ� TV ���̵��� ���α׷��� ã�� �� �����ϴ�.');
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('���α׷��� ���������� �����Ǿ����ϴ�.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('���α׷��� �����ϴ� ���� ������ �߻��߽��ϴ�: ' || SQLERRM);
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
        DBMS_OUTPUT.PUT_LINE('����: ' || tvinfo.Title);
        DBMS_OUTPUT.PUT_LINE('��û���ɱⰣ: ' || TO_CHAR(tvinfo.duration, 'YYYY-MM-DD'));
        DBMS_OUTPUT.PUT_LINE('�帣: ' || tvinfo.cate);
        DBMS_OUTPUT.PUT_LINE('����: ' || tvinfo.content);
        DBMS_OUTPUT.PUT_LINE('---------------------------------------');
    END LOOP;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('�ش� ���� ��û ������ TV �������� �����ϴ�.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('TV ������ ��ȸ �� ������ �߻��߽��ϴ�: ' || SQLERRM);
END;
----------------------------------------------------------------------------------------------------


--���� ���̺� �ۼ� ���ν���
--EXEC up_create_music('�������ڶ�', TO_DATE('2024-03-31', 'YYYY-MM-DD'), 'Ŭ����', 'JTBC ?���ҽ̾�2? ���� ����� �Ÿ��� �������ڶ��� �뷡 ������.');
--EXEC up_create_music('A Symphonic Celebration - ��Ʃ��� ���긮 �ִϸ��̼� ����', TO_DATE('2024-03-31', 'YYYY-MM-DD'), 'Ŭ����', '�����긮 ������ â���ڡ�, �Ϻ��� ��ǥ�ϴ� ���ǰ���, �����̽� ���� ���ο� ���긮 OST �ٹ����� ���ƿԴ�.');
--EXEC up_create_music('Bach, Bologne, Previn, Vivaldi, Williams', TO_DATE('2024-03-31', 'YYYY-MM-DD'), 'Ŭ����', 'Anne-Sophie Mutter & Mutter''s Virtuosi �� �ӻ�� ���ְ� ''Bach, Bologne, Previn, Vivaldi, Williams');
--EXEC up_create_music('Tchaikovsky: Ballet Suites - Swan Lake; Sleeping Beauty; The Nutcracker', TO_DATE('2024-03-31', 'YYYY-MM-DD'), 'Ŭ����', '�� ���ϸ�� �����Ǵ��� ''Tchaikovsky: Ballet Suites');
--EXEC up_create_music('ǳ����: Ŭ������ ��� ��ſ���', TO_DATE('2024-03-31', 'YYYY-MM-DD'), 'Ŭ����', 'Ŭ������ ó�� ���ϴ� �Թ��ں��� Ŭ������ ���������� ����� �翡 � ����� ���� ���� �𸣴� ����� ����, �� ������ �� Ŭ���� ��� 25���� ��Ҵ�.');
--EXEC up_create_music('���帶�ϳ���, ���÷���(Rachmaninoff, A Reflection)', TO_DATE('2024-04-30', 'YYYY-MM-DD'), 'Ŭ����', '�� Ŭ���̹� ���� ���� �ѱ��� ���� ����� ���쿹���� ��ī ���̺� �� ��° ��Ʃ��� �ٹ� [���帶�ϳ���, ���÷���].');
--EXEC up_create_music('Inspired By Bach: The Cello Suites (Remastered)', TO_DATE('2024-04-30', 'YYYY-MM-DD'), 'Ŭ����', '��丶�� ������ 6���� ÿ�� �������� �������� ���� �������� ���� Ʈ�� �ٹ�.');
--EXEC up_create_music('���帶�ϳ���: �ǾƳ� ���ְ� ��ǰ��ȣ 1 & 2', TO_DATE('2024-04-30', 'YYYY-MM-DD'), 'Ŭ����', '���ڵ� �ô��� ���� ������ �ǾƴϽ�Ʈ ���帶�ϳ����� ''�ǾƳ� ���ְ� ��ǰ��ȣ 1 & 2');
--EXEC up_create_music('The World of Hans Zimmer - A Symphonic Celebration (Live)', TO_DATE('2024-04-30', 'YYYY-MM-DD'), 'Ŭ����', '��ȭ ���ǰ� ���� �ѽ� ������ "A Symphonic Celebration (Live)"');
--EXEC up_create_music('�������� ���亥 ��Ȳ���� ���� ��Ȳ ����', TO_DATE('2024-04-30', 'YYYY-MM-DD'), 'Ŭ����', '�� Ŭ���̹� �ǾƳ� ���� �ֿ��� ����� �������� ���ְ�.');
--EXEC up_create_music('��� ���ƿ� �������� �ź�', TO_DATE('2024-04-30', 'YYYY-MM-DD'), 'Ŭ����', '�������� ù �ٷ�ũ �ٹ� ''� ������Ʈ''');

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
    
    DBMS_OUTPUT.PUT_LINE('���� ������ ���������� �߰��Ǿ����ϴ�. MusicID: ' || v_MusicID);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('���� ������ �߰��ϴ� ���� ������ �߻��߽��ϴ�: ' || SQLERRM);
        ROLLBACK;
END;


----------------------------------------------------------------------------------------------------
--���� ���̺� ���� ���ν���

--EXEC up_update_music(1,'������',NULL,NULL,NULL);
--EXEC up_update_music(2,'������',TO_DATE('2024-05-31', 'YYYY-MM-DD'),'������','������');

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
        DBMS_OUTPUT.PUT_LINE('�ش��ϴ� ���� ���̵��� ���α׷��� ã�� �� �����ϴ�.');
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('���� ������ ���������� ������Ʈ�Ǿ����ϴ�.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('���� ������ ������Ʈ�ϴ� ���� ������ �߻��߽��ϴ�: ' || SQLERRM);
        ROLLBACK;
END;
----------------------------------------------------------------------------------------------------
--���� ���̺� ���� ���ν���
--EXEC up_delete_music(1);
--EXEC up_delete_music('2,5');
--EXEC up_delete_music('1~11');
CREATE OR REPLACE PROCEDURE up_delete_music (
    p_MusicIDs IN VARCHAR2
)
IS
    v_deleted_count NUMBER := 0;
BEGIN
    IF INSTR(p_MusicIDs, '~') > 0 THEN  -- ~�� ���е� ���ڿ����ڸ� ���� ���
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
    ELSE -- ��ǥ�� ���е� MusicID���� ���� ��� �Ǵ� ���� MusicID�� ���� ���
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
        DBMS_OUTPUT.PUT_LINE('�ش��ϴ� ���� ���̵��� ������ ã�� �� �����ϴ�.');
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('������ ���������� �����Ǿ����ϴ�.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('������ �����ϴ� ���� ������ �߻��߽��ϴ�: ' || SQLERRM);
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
        DBMS_OUTPUT.PUT_LINE('����: ' || musicinfo.Title);
        DBMS_OUTPUT.PUT_LINE('���󰡴ɱⰣ: ' || TO_CHAR(musicinfo.Duration, 'YYYY-MM-DD'));
        DBMS_OUTPUT.PUT_LINE('�帣: ' || musicinfo.cate);
        DBMS_OUTPUT.PUT_LINE('����: ' || musicinfo.content);
        DBMS_OUTPUT.PUT_LINE('---------------------------------------');
    END LOOP;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('�ش� ���� ���� ������ ���� �������� �����ϴ�.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('���� ������ ��ȸ �� ������ �߻��߽��ϴ�: ' || SQLERRM);
END;

----------------------------------------------------------------------------------------------------





INSERT INTO dfare (Keynum, peak, discount, timezone, sg, route, fare, redis, AdminID, wknddy)
VALUES (1, '�����', '����', '��ȣ', '�Ϲݼ�', 'SEOUL/GMP-JEJU/CJU', 101000, 3000, '#admin001', '����');
INSERT INTO dfare (Keynum, peak, discount, timezone, sg, route, fare, redis, AdminID, wknddy)
VALUES (2, '�����', '����', '�Ϲ�', '�Ϲݼ�', 'SEOUL/GMP-JEJU/CJU', 97000 , 3000, '#admin001', '����');
INSERT INTO dfare (Keynum, peak, discount, timezone, sg, route, fare, redis, AdminID, wknddy)
VALUES (3, '�����', '����', '��ȣ', '�Ϲݼ�', 'SEOUL/GMP-JEJU/CJU', 115000, 3000, '#admin001', '�ָ�');
INSERT INTO dfare (Keynum, peak, discount, timezone, sg, route, fare, redis, AdminID, wknddy)
VALUES (4, '�����', '����', '�Ϲ�', '�Ϲݼ�', 'SEOUL/GMP-JEJU/CJU', 110000, 3000, '#admin001', '�ָ�');
INSERT INTO dfare (Keynum, peak, discount, timezone, sg, route, fare, redis, AdminID, wknddy)
VALUES (5, '������', '����', '������', '�Ϲݼ�', 'SEOUL/GMP-JEJU/CJU', 132000, 3000, '#admin001', '������');

INSERT INTO dfare (Keynum, peak, discount, timezone, sg, route, fare, redis, AdminID, wknddy)
VALUES (6, '�����', '����', '��ȣ', '������Ƽ����', 'SEOUL/GMP-JEJU/CJU', 161000, 3000, '#admin001', '����');
INSERT INTO dfare (Keynum, peak, discount, timezone, sg, route, fare, redis, AdminID, wknddy)
VALUES (7, '�����', '����', '�Ϲ�', '������Ƽ����', 'SEOUL/GMP-JEJU/CJU', 157000, 3000, '#admin001', '����');
INSERT INTO dfare (Keynum, peak, discount, timezone, sg, route, fare, redis, AdminID, wknddy)
VALUES (8, '�����', '����', '��ȣ', '������Ƽ����', 'SEOUL/GMP-JEJU/CJU', 175000, 3000, '#admin001', '�ָ�');
INSERT INTO dfare (Keynum, peak, discount, timezone, sg, route, fare, redis, AdminID, wknddy)
VALUES (9, '�����', '����', '�Ϲ�', '������Ƽ����', 'SEOUL/GMP-JEJU/CJU', 170000, 3000, '#admin001', '�ָ�');
INSERT INTO dfare (Keynum, peak, discount, timezone, sg, route, fare, redis, AdminID, wknddy)
VALUES (10, '������', '����', '������', '������Ƽ����', 'SEOUL/GMP-JEJU/CJU', 192000, 3000, '#admin001', '������');
--��¥�� �ð��뿡 ���� ���ӱ���
--exec mk_scplane_01 ('202404190640','202404190750','korea','korea','#admin001','SEOUL.GMP','JEJU.CJU');    2
--exec mk_scplane_01 ('202404190730','202404190840','korea','korea','#admin001','SEOUL.GMP','JEJU.CJU');    2
--exec mk_scplane_01 ('202404190730','202404190840','korea','korea','#admin001','SEOUL.GMP','JEJU.CJU');    2
--exec mk_scplane_01 ('202404191330','202404191440','korea','korea','#admin001','SEOUL.GMP','JEJU.CJU');    1
--exec mk_scplane_01  ('202404191900','202404192010','korea','korea','#admin001','SEOUL.GMP','JEJU.CJU');   2
--exec mk_scplane_01  ('202404192030','202404192140','korea','korea','#admin001','SEOUL.GMP','JEJU.CJU');   2



INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (1, 'ICN', 'FUK', '�ϵ', 807600, 593500, 18450, 35000, 'admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (2, 'ICN', 'FUK', '������Ƽ����', 588850, 432000, 18450, 35000, 'admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (3, 'ICN', 'FUK', '�Ϲݼ�A(����)', 235000, 172300, 18450, 35000, 'admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (4, 'ICN', 'FUK', '�Ϲݼ�B(Ư��/����)', 150000, 110000, 11770, 21000, 'admin001');
--exec mk_scplane_01  ('202404050800','202404050925','korea','JAPAN','#admin001','SEOUL.ICN','FUK.FUK');
--exec mk_scplane_01  ('202404051355','202404051525','korea','JAPAN','#admin001','SEOUL.ICN','FUK.FUK');
--exec mk_scplane_01  ('202404051835','202404052000','korea','JAPAN','#admin001','SEOUL.ICN','FUK.FUK');


INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (5, 'ICN', 'PEK', '�ϵ', 667000, 489500,  22,350, 35000, 'admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (6, 'ICN', 'PEK', '������Ƽ����', 506000,  370800,  22350, 35000, 'admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (7, 'ICN', 'PEK', '�Ϲݼ�A(����)', 361500, 265200, 22350, 35000, 'admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (8, 'ICN', 'PEK', '�Ϲݼ�B(Ư��/����)', 235000, 171000, 20300, 21000, 'admin001');
--exec mk_scplane_01  ('202404200815','202404200940','korea','CHINA','#admin001','SEOUL.ICN','BEIJING.PEK');
--exec mk_scplane_01  ('202404200905','202404201025','korea','CHINA','#admin002','SEOUL.ICN','BEIJING.PEK');
--exec mk_scplane_01  ('202404201840','202404202005','korea','CHINA','#admin002','SEOUL.ICN','BEIJING.PEK');



INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (9, 'ICN', 'JFK', '�ϵ', 6412000,  4743000, 62300, 161000, 'admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (10, 'ICN', 'JFK', '������Ƽ����', 4511000, 3336000, 62300, 161000, 'admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (11, 'ICN', 'JFK', '�Ϲݼ�A(����)', 2384000, 1763000, 62300, 161000, 'admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (12, 'ICN', 'JFK', '�Ϲݼ�B(Ư��/����)', 1450000, 1073000, 62300, 161000, 'admin001');
--exec mk_scplane_01  ('202404201000','202404210020','korea','USA','#admin002','SEOUL.ICN','NYC.JFK');
--exec mk_scplane_01  ('202404201930','202404210930','korea','USA','#admin002','SEOUL.ICN','NYC.JFK');


INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (13, 'ICN', 'BOS', '�ϵ', 6412200, 4735028, 62300, 161000, 'admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (14, 'ICN', 'BOS', '������Ƽ����', 4511000, 3334140, 62300, 161000, 'admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (15, 'ICN', 'BOS', '�Ϲݼ�A(����)', 2384500, 1759230, 62300, 161000, 'admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (16, 'ICN', 'BOS', '�Ϲݼ�B(Ư��/����)', 1450000, 1073000, 62300, 161000, 'admin001');
--exec mk_scplane_01  ('202405100930','202405102330','korea','USA','#admin002','SEOUL.ICN','BOS.BOS');
--exec mk_scplane_01  ('202405100920','202405110340','korea','USA','#admin002','SEOUL.ICN','BOS.BOS');

INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (17, 'ICN', 'LAS', '�ϵ', 11033900, 4082543,  124600, 260400, 'admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (18, 'ICN', 'LAS', '������Ƽ����', 7755600, 2869572 , 124600, 260400, 'admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (19, 'ICN', 'LAS', '�Ϲݼ�A(����)', 3656100, 1352757, 124600, 260400, 'admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (20, 'ICN', 'LAS', '�Ϲݼ�B(Ư��/����)', 2400000, 888000, 124600, 260400, 'admin001');
exec mk_scplane_01  ('202403271600','202403280633','korea','USA','#admin002','SEOUL.ICN','LAS.LAS');
exec mk_scplane_01  ('202403271430','202403280631','korea','USA','#admin002','SEOUL.ICN','LAS.LAS');
exec mk_scplane_01  ('202403271940','202403281200','korea','USA','#admin002','SEOUL.ICN','LAS.LAS');
