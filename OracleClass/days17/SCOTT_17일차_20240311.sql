-- SCOTT  
--(��) : Ʈ�����, ��ȣȭ, �����ٷ�
--Ʈ����� ó��
--��)������ü
----------A          X -> ���        ����  ����
----------B          Y <- �Ա�        ����  ����


--DML(I,U,D) + LOCK(���) -> �ݵ�� ������� (COMMIT, ROLLBACK)
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