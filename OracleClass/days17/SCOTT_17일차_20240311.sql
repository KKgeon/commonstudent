-- SCOTT  
--(월) : 트랜잭션, 암호화, 스케줄러
--트랜잭션 처리
--예)계좌이체
----------A          X -> 출금        실패  성공
----------B          Y <- 입금        성공  실패


--DML(I,U,D) + LOCK(잠금) -> 반드시 잠금해제 (COMMIT, ROLLBACK)
-- SCOTT  
SELECT USERENV('SESSIONID')
FROM dual;
--
SELECT *
FROM emp
WHERE ename = 'MILLER';

UPDATE emp
SET job = 'MANAGER'
WHERE ename = 'MILLER';

ROLLBACK;