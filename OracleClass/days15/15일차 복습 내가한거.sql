-- SCOTT 
-- 문제1) 번호,이름,국,영,수,총점,평균,등수,등급을 관리하는 tbl_score 테이블 생성
--       (num, name, kor, eng, mat, tot, avg, rank, grade ) 
CREATE TABLE tbl_score(
num NUMBER(4) PRIMARY KEY
, name VARCHAR2(20)
, kor NUMBER(3)
, eng NUMBER(3)
, mat NUMBER(3)
, tot NUMBER(3)
, avg NUMBER(5,2)
, rank NUMBER(4)
, grade CHAR(1 CHAR)
);
-- 문제2) 번호를 기본키로 설정
ALTER TABLE tbl_score ADD CONSTRAINT pk_num PRIMARY KEY (num);

-- 문제3) seq_tblscore 시퀀스 생성
CREATE SEQUENCE seq_tblscore;
SELECT *
FROM user_sequences;
-- 문제4) 학생 추가하는 저장 프로시저 생성
--EXEC up_insertscore(1001, '홍길동', 89,44,55 );
--EXEC up_insertscore(1002, '윤재민', 49,55,95 );
--EXEC up_insertscore(1003, '김도균', 90,94,95 );
CREATE OR REPLACE PROCEDURE up_insertscore
(
pnum NUMBER
, pname VARCHAR2
, pkor NUMBER
, peng NUMBER
, pmat tbl_score.mat%TYPE
)
IS
    vtot NUMBER(3);
    vavg NUMBER(5,2);
    vgrade CHAR(1 CHAR);
BEGIN
vtot := pkor+peng+pmat;
vavg := vtot /3;
--vrank 등수처리x
IF vavg >= 90 THEN 
vgrade := 'A';
ELSIF vavg >= 80 THEN 
vgrade := 'B';
ELSIF vavg >= 70 THEN 
vgrade := 'C';
ELSIF vavg >= 60 THEN 
vgrade := 'D';
ELSE
vgrade := 'F';
END IF;

INSERT INTO tbl_score (num, name, kor, eng, mat, tot, avg, rank, grade) 
VALUES (pnum, pname, pkor, peng, pmat, vtot, vavg, 1, vgrade);
--입력받은 모든 학생들의 등수를 처리하는 UPDATE
UPDATE tbl_score a
SET rank = (SELECT COUNT(*)+1 FROM tbl_score WHERE tot>a.tot);
COMMIT;
--EXCEPTION
--ROLLBACK;
END;
SELECT *
FROM tbl_score;

-- 문제5) 학생 수정하는 저장 프로시저 생성
--EXEC up_updateScore( 1001, 100, 100, 100 );
--EXEC up_updateScore( 1001, pkor =>34 );
--EXEC up_updateScore( 1001, pkor =>34, pmat => 90 );
--EXEC up_updateScore( 1001, peng =>45, pmat => 90 );

CREATE OR REPLACE PROCEDURE up_updateScore (
     pnum   NUMBER  
   , pkor   NUMBER := NULL
   , peng   NUMBER := NULL 
   , pmat   tbl_score.mat%TYPE  := NULL

)
IS
    vtot NUMBER(3);
    vavg NUMBER(5,2);
    vgrade CHAR(1);
    vkor tbl_score.kor%TYPE;
    veng tbl_score.eng%TYPE;
    vmat tbl_score.mat%TYPE;
BEGIN
    SELECT NVL(kor, 0), NVL(eng, 0), NVL(mat, 0)
    INTO vkor, veng, vmat
    FROM tbl_score
    WHERE num = pnum;

    vtot := NVL(pkor, vkor) + NVL(peng, veng) + NVL(pmat, vmat);
    vavg := vtot / 3;

    IF vavg >= 90 THEN 
        vgrade := 'A';
    ELSIF vavg >= 80 THEN 
        vgrade := 'B';
    ELSIF vavg >= 70 THEN 
        vgrade := 'C';
    ELSIF vavg >= 60 THEN 
        vgrade := 'D';
    ELSE
        vgrade := 'F';
    END IF;

    UPDATE tbl_score
    SET kor = NVL(pkor, vkor),
        eng = NVL(peng, veng),
        mat = NVL(pmat, vmat),
        tot = vtot,
        avg = vavg,
        grade = vgrade
    WHERE num = pnum;

    UPDATE tbl_score a
    SET rank = (SELECT COUNT(*) + 1 FROM tbl_score b WHERE b.tot > a.tot);

    COMMIT;
END;
-- 문제6) 학생 삭제하는 저장 프로시저 생성
-- EXEC UP_DELETESCORE( 1002 ); 

-- 문제7) 모든 학생 출력하는 저장 프로시저 생성( 명시적 커서 사용 )
-- EXEC UP_SELECTSCORE;

-- 문제8) 학생 검색하는 저장 프로시저 생성
-- EXEC UP_SEARCHSCORE(1001);