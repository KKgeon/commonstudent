--------------------------------------------------------
--  파일이 생성됨 - 월요일-3월-04-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table T_MEMBER
--------------------------------------------------------

  CREATE TABLE "SCOTT"."T_MEMBER" 
   (	"MEMBERSEQ" NUMBER(4,0), 
	"MEMBERID" VARCHAR2(20 BYTE), 
	"MEMBERPASSWD" VARCHAR2(20 BYTE), 
	"MEMBERNAME" VARCHAR2(20 BYTE), 
	"MEMBERPHONE" VARCHAR2(20 BYTE), 
	"MEMBERADDRESS" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SCOTT"."T_MEMBER"."MEMBERSEQ" IS '회원SEQ';
   COMMENT ON COLUMN "SCOTT"."T_MEMBER"."MEMBERID" IS '회원아이디';
   COMMENT ON COLUMN "SCOTT"."T_MEMBER"."MEMBERPASSWD" IS '비밀번호';
   COMMENT ON COLUMN "SCOTT"."T_MEMBER"."MEMBERNAME" IS '회원명';
   COMMENT ON COLUMN "SCOTT"."T_MEMBER"."MEMBERPHONE" IS '휴대폰';
   COMMENT ON COLUMN "SCOTT"."T_MEMBER"."MEMBERADDRESS" IS '주소';
   COMMENT ON TABLE "SCOTT"."T_MEMBER"  IS '회원';
--------------------------------------------------------
--  DDL for Table T_POLLSUB
--------------------------------------------------------

  CREATE TABLE "SCOTT"."T_POLLSUB" 
   (	"POLLSUBSEQ" NUMBER(38,0), 
	"ANSWER" VARCHAR2(100 BYTE), 
	"ACOUNT" NUMBER(4,0), 
	"POLLSEQ" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SCOTT"."T_POLLSUB"."POLLSUBSEQ" IS '답변항목SEQ';
   COMMENT ON COLUMN "SCOTT"."T_POLLSUB"."ANSWER" IS '답변항목';
   COMMENT ON COLUMN "SCOTT"."T_POLLSUB"."ACOUNT" IS '답변항목선택수';
   COMMENT ON COLUMN "SCOTT"."T_POLLSUB"."POLLSEQ" IS '설문SEQ';
   COMMENT ON TABLE "SCOTT"."T_POLLSUB"  IS '설문항목';
--------------------------------------------------------
--  DDL for Table T_POLL
--------------------------------------------------------

  CREATE TABLE "SCOTT"."T_POLL" 
   (	"POLLSEQ" NUMBER(4,0), 
	"QUESTION" VARCHAR2(256 BYTE), 
	"SDATE" DATE, 
	"EDATE" DATE, 
	"ITEMCOUNT" NUMBER(1,0) DEFAULT 1, 
	"POLLTOTAL" NUMBER(4,0), 
	"REGDATE" DATE DEFAULT sysdate, 
	"MEMBERSEQ" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SCOTT"."T_POLL"."POLLSEQ" IS '설문SEQ';
   COMMENT ON COLUMN "SCOTT"."T_POLL"."QUESTION" IS '질문';
   COMMENT ON COLUMN "SCOTT"."T_POLL"."SDATE" IS '시작일';
   COMMENT ON COLUMN "SCOTT"."T_POLL"."EDATE" IS '종료일';
   COMMENT ON COLUMN "SCOTT"."T_POLL"."ITEMCOUNT" IS '답변항목수';
   COMMENT ON COLUMN "SCOTT"."T_POLL"."POLLTOTAL" IS '총참여수';
   COMMENT ON COLUMN "SCOTT"."T_POLL"."REGDATE" IS '작성일';
   COMMENT ON COLUMN "SCOTT"."T_POLL"."MEMBERSEQ" IS '작성자(회원SEQ)';
   COMMENT ON TABLE "SCOTT"."T_POLL"  IS '설문조사';
--------------------------------------------------------
--  DDL for Table T_VOTER
--------------------------------------------------------

  CREATE TABLE "SCOTT"."T_VOTER" 
   (	"VECTORSEQ" NUMBER, 
	"USERNAME" VARCHAR2(20 BYTE), 
	"REGDATE" DATE, 
	"POLLSEQ" NUMBER(4,0), 
	"POLLSUBSEQ" NUMBER(38,0), 
	"MEMBERSEQ" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SCOTT"."T_VOTER"."VECTORSEQ" IS '투표SEQ';
   COMMENT ON COLUMN "SCOTT"."T_VOTER"."USERNAME" IS '사용자이름';
   COMMENT ON COLUMN "SCOTT"."T_VOTER"."REGDATE" IS '투표일';
   COMMENT ON COLUMN "SCOTT"."T_VOTER"."POLLSEQ" IS '설문SEQ';
   COMMENT ON COLUMN "SCOTT"."T_VOTER"."POLLSUBSEQ" IS '답변항목SEQ';
   COMMENT ON COLUMN "SCOTT"."T_VOTER"."MEMBERSEQ" IS '회원SEQ';
   COMMENT ON TABLE "SCOTT"."T_VOTER"  IS '투표자';
--------------------------------------------------------
--  DDL for Index PK_T_MEMBER
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."PK_T_MEMBER" ON "SCOTT"."T_MEMBER" ("MEMBERSEQ") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_T_POLLSUB
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."PK_T_POLLSUB" ON "SCOTT"."T_POLLSUB" ("POLLSUBSEQ") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_T_POLL
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."PK_T_POLL" ON "SCOTT"."T_POLL" ("POLLSEQ") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_T_VOTER
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."PK_T_VOTER" ON "SCOTT"."T_VOTER" ("VECTORSEQ") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table T_MEMBER
--------------------------------------------------------

  ALTER TABLE "SCOTT"."T_MEMBER" ADD CONSTRAINT "PK_T_MEMBER" PRIMARY KEY ("MEMBERSEQ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "SCOTT"."T_MEMBER" MODIFY ("MEMBERID" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."T_MEMBER" MODIFY ("MEMBERSEQ" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_POLLSUB
--------------------------------------------------------

  ALTER TABLE "SCOTT"."T_POLLSUB" ADD CONSTRAINT "PK_T_POLLSUB" PRIMARY KEY ("POLLSUBSEQ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "SCOTT"."T_POLLSUB" MODIFY ("POLLSEQ" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."T_POLLSUB" MODIFY ("ANSWER" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."T_POLLSUB" MODIFY ("POLLSUBSEQ" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_POLL
--------------------------------------------------------

  ALTER TABLE "SCOTT"."T_POLL" ADD CONSTRAINT "PK_T_POLL" PRIMARY KEY ("POLLSEQ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "SCOTT"."T_POLL" MODIFY ("REGDATE" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."T_POLL" MODIFY ("ITEMCOUNT" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."T_POLL" MODIFY ("EDATE" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."T_POLL" MODIFY ("SDATE" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."T_POLL" MODIFY ("QUESTION" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."T_POLL" MODIFY ("POLLSEQ" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_VOTER
--------------------------------------------------------

  ALTER TABLE "SCOTT"."T_VOTER" ADD CONSTRAINT "PK_T_VOTER" PRIMARY KEY ("VECTORSEQ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "SCOTT"."T_VOTER" MODIFY ("VECTORSEQ" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table T_POLLSUB
--------------------------------------------------------

  ALTER TABLE "SCOTT"."T_POLLSUB" ADD CONSTRAINT "FK_T_POLL_TO_T_POLLSUB" FOREIGN KEY ("POLLSEQ")
	  REFERENCES "SCOTT"."T_POLL" ("POLLSEQ") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table T_POLL
--------------------------------------------------------

  ALTER TABLE "SCOTT"."T_POLL" ADD CONSTRAINT "FK_T_MEMBER_TO_T_POLL" FOREIGN KEY ("MEMBERSEQ")
	  REFERENCES "SCOTT"."T_MEMBER" ("MEMBERSEQ") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table T_VOTER
--------------------------------------------------------

  ALTER TABLE "SCOTT"."T_VOTER" ADD CONSTRAINT "FK_T_MEMBER_TO_T_VOTER" FOREIGN KEY ("MEMBERSEQ")
	  REFERENCES "SCOTT"."T_MEMBER" ("MEMBERSEQ") ENABLE;
  ALTER TABLE "SCOTT"."T_VOTER" ADD CONSTRAINT "FK_T_POLLSUB_TO_T_VOTER" FOREIGN KEY ("POLLSUBSEQ")
	  REFERENCES "SCOTT"."T_POLLSUB" ("POLLSUBSEQ") ENABLE;
  ALTER TABLE "SCOTT"."T_VOTER" ADD CONSTRAINT "FK_T_POLL_TO_T_VOTER" FOREIGN KEY ("POLLSEQ")
	  REFERENCES "SCOTT"."T_POLL" ("POLLSEQ") ENABLE;
