--SCOTT
--[SET ���� ������]
--1) ������(UNION, UNION ALL)
SELECT name, city, buseo
FROM insa 
WHERE buseo = '���ߺ�' --14
--UNION--6���� �ߺ��ȴ�
UNION ALL --23��
SELECT name, city, buseo
FROM insa 
WHERE city= '��õ'; --9��

--2) ������(MINUS)
SELECT name, city, buseo
FROM insa 
WHERE buseo = '���ߺ�' --14
MINUS
SELECT name, city, buseo
FROM insa 
WHERE city= '��õ'; --9��

--3) ������(INTERSECT)
--[2]
SELECT name, city, buseo
FROM insa 
WHERE buseo = '���ߺ�' --14
INTERSECT
SELECT name, city, buseo
FROM insa 
WHERE city= '��õ'; --9��

--[1]
SELECT name, city, buseo
FROM insa
WHERE buseo = '���ߺ�' AND city = '��õ';


--(SET (����) �����ڸ� ����� �� ������ ��)

--ORA-01790: expression must have same datatype as corresponding expression
--ORA-01789: query block has incorrect number of result columns
SELECT name, city, buseo
FROM insa 
WHERE buseo = '���ߺ�' --14
UNION ALL --23��
SELECT name, city  --, basicpay
FROM insa 
WHERE city= '��õ'; --9��
-- insa ���̺��� ��� ���� + emp ���̺��� ��� ������ ��� ���
SELECT buseo, num, name, ibsadate, basicpay, sudang
FROM insa
UNION ALL
SELECT TO_CHAR(deptno), empno, ename, hiredate, sal,comm
FROM emp;



--MULTIST
--MULTIST
--MULTIST

--[������ ���� ������]
--PRIOR CONNECT_BY_ROOT

--[���� ������] ||

--[��� ������] + - / *
--              ������ ���ϴ� �����ڴ� ����
--              ������ ���ϴ� �Լ� MOD(5,3) = 5/3�� ������ **** 5-3*FLOOR(5/3)
--              ������ ���ϴ� �Լ� REMINDER(5,3) = 5/3�� ������ 5-3*ROUND(5/3)
SELECT 
    --  10/0 --ORA-01476: divisor is equal to zero
    --  'A'/2--ORA-01722: invalid number
    MOD(10,0)
FROM dual;





--����Ŭ �Լ�
-- 1. ������ �������� �����ϰ� ���ְ� ���̤��� ���� �����ϴµ� ���Ǵ� ��.
-- 2. ���� : ������ �Լ�, ������ �Լ�

SELECT LOWER (ename)
FROM emp;

SELECT COUNT(*)
FROM emp;

--(���� �Լ�)--
--1) ROUND(numver) ���ڰ��� Ư�� ��ġ���� (�ݿø�)�Ͽ� �����Ѵ�
SELECT 3.141592
    , ROUND(3.141592) a    --�Ҽ��� ù ��° �ڸ����� �ݿø�...
    , ROUND(3.141592, 0) b --n�� ������ ���� ����
    , ROUND(3.141592, 2) c --�Ҽ��� �� ��° �ڸ����� �ݿø�...
    , ROUND(1234.5678, 2) d
    , ROUND(1234.5678, -1) e
    , ROUND(1234.5678, -2) f
    , ROUND(1234.5678, -3) g
FROM dual;


-- [����] emp ���̺��� pay, ��ձ޿�, �ѱ޿�����, ����� ���
-- ORA-00937: not a single-group group function
SELECT emp.* 
    , sal+NVL(comm,0) pay
--    , COUNT(*)
    , (SELECT COUNT(*)
       FROM emp) total_cnt
    , (SELECT SUM (sal + NVL(comm,0))
       FROM emp ) total_pay
    , (SELECT ROUND(AVG (sal + NVL(comm,0)),2)
       FROM emp ) avg_pay   --��ձ޿� ����ؼ� �Ҽ��� 2�ڸ����� ���
FROM emp;
--GROUP BY ;



--�����Լ�

SELECT COUNT(*)
      , COUNT(empno)
      , COUNT(deptno)
      , COUNT(sal)
      , COUNT(hiredate)      
      , COUNT(comm)
FROM emp;

-- ��� Ŀ�̼� ? 
SELECT AVG(comm)--550
FROM emp;

SELECT SUM(comm)/COUNT(*) --183.333333333333333333333333333333333333
    , SUM(comm)/COUNT(comm)
FROM emp;


-- TRUNC(��¥+����), FLOOR(����) �����ϴ� 2���� �Լ�
-- ������ : 
--        TRUNC(��¥+����)�� Ư�� ��ġ���� ���� ����
--        FLOOR(����)�� �Ҽ��� ù��° �ڸ����� ���踸 ����
SELECT 3.141592
    ,TRUNC(3.141592)
    ,TRUNC(3.141592, 0)
    ,FLOOR(3.141592)
    ,TRUNC(3.141592, 3)
    ,FLOOR(3.141592*1000 ) /1000
    ,TRUNC(3.141592, -1)
FROM dual;



-- CELL () ���ڰ��� �Ҽ��� ù°�ڸ����� �����Ͽ� �������� �����Ѵ�.
SELECT CEIL(3.14), CEIL(3.54)
FROM dual;

--3.141592�� �Ҽ��� �� ��° �ڸ����� �ø�����
SELECT CEIL(3.141592*100)/100
FROM dual;



--�� ������ ���� ����� �� �ø��Լ� ���
--�ѰԽñ�(���)�� : 
-- �� �������� ����� �Խñ�(���)��:
SELECT COUNT(*) FROM emp;
SELECT CEIL (( SELECT COUNT(*) FROM emp)/5) ����������
FROM dual;


SELECT *
FROM emp
ORDER BY sal+NVL(comm,0) DESC;


-- ABS() ���� ���ϴ� �Լ�
SELECT ABS(100), ABS(-100)
FROM dual;

-- SIGN() ���ڰ��� ��ȣ�� ���� 1,0,-1�� ������ �����Ѵ�.
SELECT SIGN(100), SIGN(0), SIGN(-100)
FROM dual;

--[����] emp ���̺��� ��� �޿��� ���ؼ�
-- �� ����� �޿��� ��ձ޿����� ������ "��ձ޿����� ����"��� ����ϰ�
--                            ������ "��ձ޿����� ����" ��� ���



--2260.416666666666666666666666666666666667
--[��� �޿�]
SELECT AVG(sal+NVL(comm,0)) avg_pay
FROM emp;

--[2]
SELECT ename, sal+NVL(comm,0)pay
        ,(SELECT AVG(sal+NVL(comm,0)) avg_pay FROM emp) avg_pay
        , SIGN( sal+NVL(comm,0-(SELECT AVG(sal+NVL(comm,0)) avg_pay FROM emp) ))
FROM emp;


-- [1]
SELECT s.*, '����'
FROM emp s
WHERE sal+NVL(comm,0) < (SELECT AVG(sal+NVL(comm,0)) avg_pay
                        FROM emp)
UNION
SELECT s.*, '����'
FROM emp s
WHERE sal+NVL(comm,0) > (SELECT AVG(sal+NVL(comm,0)) avg_pay
                        FROM emp);
                        
                        
                        
--POWER(), SQRT()
SELECT power(2,3), power(2,-3)
    , SQRT(2)
FROM dual;


--

--[���� �Լ�]--
--INSTR() == JAVA indexOf(), lastIndexof()�Լ��� ��� ����
SELECT instr('corea','e')
FROM dual;




select instr('corporate floor','or',3,2) 
from dual;

SELECT
    INSTR('corporate floor', 'or')      --2
    , INSTR('corporate floor', 'or',3,2) --14
    , INSTR('corporate floor', 'or',-3,2) --2       �ڿ��� 3��°���� 2��° ���� or ���� (���������ϳ�..)
FROM dual;



SELECT '02-123-5678' tel 
    , INSTR('02-1234-5678', '-') "ù��° - ��ġ"  -- 3
    , INSTR('02-1234-5678', '-', -1 ) "�ι�° - ��ġ" -- 8
    , SUBSTR('02-1234-5678', 1, INSTR('02-1234-5678', '-')-1) a  -- 010
    , SUBSTR('02-1234-5678', INSTR('02-1234-5678', '-')+1
         , INSTR('02-1234-5678', '-', -1 )-1 - (INSTR('02-1234-5678', '-')+1)     ) b -- 1234
    , SUBSTR('02-1234-5678', INSTR('02-1234-5678', '-',-1)+1,4) c -- 5678
FROM dual;




DESC tbl_tel;


SELECT*
FROM tbl_tel;


INSERT INTO tbl_tel (tel, name) VALUES ('063)469-4567', 'ū����');
INSERT INTO tbl_tel (tel, name) VALUES ('052)1456-2367', '��°����');
COMMIT;
-- ������ȣ / ���ڸ� ��ȭ��ȣ/ ���ڸ� ��ȭ��ȣ

SELECT name, tel
    , INSTR (tel, ')') ")��ġ"
    , INSTR (tel, '-') "-��ġ"
    , SUBSTR(tel, 1, INSTR (tel, ')')-1) "������ȣ )-1"
    , SUBSTR(tel, INSTR (tel, ')')+1, INSTR (tel, '-')-INSTR (tel, ')')-1 ) "���ڸ�"
    , SUBSTR(tel, INSTR (tel, '-')+1) "���ڸ�"
FROM tbl_tel;


--

SELECT ename, pay
    , RPAD (pay,10,'*')
    , LPAD (pay,10)
    , LPAD (pay,10,'*')
FROM (
        SELECT ename, sal + NVL(comm,0)pay
        FROM emp
        ) t;



--ASCII()
SELECT ename
    , SUBSTR(ename,1,1)
    , ASCII( SUBSTR(ename,1,1) )
    , CHR ( ASCII( SUBSTR(ename,1,1) ) )
FROM emp;


--
SELECT ASCII('A'), ASCII('a'), ASCII('0')
FROM dual;

-- GREATEST(), LEAST() ������ ����, ���� �B���� ���� ū, ���� ���� �����ϴ� �Լ�

SELECT GREATEST(3, 5, 2, 4, 1)
     , GREATEST('R', 'A', 'Z', 'X' )
     , LEAST(3, 5, 2, 4, 1)
     , LEAST('R', 'A', 'Z', 'X' )
FROM dual;
--VSIZE()

SELECT ename
    , VSIZE(ename)
    , VSIZE('ȫ�浿') --9 byte
    , VSIZE('a')
    , VSIZE('��')
FROM emp;


--���� �Լ�
--���� �Լ�
--��¥ �Լ�

SELECT SYSDATE -- '24/02/19'        ��
    , ROUND(SYSDATE) a -- �� �ݿø� / ������ �������� ��¥ �ݿø��� �ȴ�.
    , ROUND(SYSDATE, 'DD') b -- �� �ݿø� / ������ �������� ��¥ �ݿø��� �ȴ�.
    , ROUND(SYSDATE, 'MONTH') c -- �� �ݿø� / �� ���� 15�� �������� �̻�
    , ROUND(SYSDATE, 'YEAR') d -- �� �ݿø�
FROM dual;

-- ��¥�� �����Լ� : TRUNC()
SELECT SYSDATE
    , TO_CHAR(SYSDATE, 'YYYY.MM.DD HH.MI.SS') a --2024.02.19 03.38.43
    , TRUNC( SYSDATE )
    , TO_CHAR(TRUNC( SYSDATE ), 'YYYY.MM.DD HH.MI.SS') b
FROM dual;


SELECT ename
    ,hiredate
    ,SYSDATE
    ,TRUNC(SYSDATE+1) - TRUNC(hiredate)
FROM emp;


SELECT SYSDATE
    , TO_CHAR(SYSDATE, 'YYYY.MM.DD HH24.MI.SS')
    , SYSDATE + 2/24 -- 2�ð�
    , TO_CHAR(SYSDATE + 2/24, 'YYYY.MM.DD HH24.MI.SS')
FROM dual;

--[����] 24�� 2�� ������ ��¥ �� �� ���� ?

SELECT SYSDATE -- 24/02/19
    --,  TRUNC ( SYSDATE, 'DD' ) �ð�, ��, �� ����
    , TRUNC (SYSDATE, 'MONTH' ) b
    ,TO_CHAR(ADD_MONTHS(TRUNC (SYSDATE, 'MONTH' ),1)-1,'DD')
FROM dual;
--[����] 24�� 2�� ������ ��¥ �� �ϱ��� ? 
-- [2] LAST_DAY() �Լ�
SELECT SYSDATE
    -- �Ű����� ��¥�� ������ ��¥�� ��ȯ�ϴ� �Լ�
    ,LAST_DAY(SYSDATE) -- 24/02/29
    ,TO_CHAR(LAST_DAY(SYSDATE),'DD')
FROM dual;



--[����] �����Ϸκ��� ���ó�¥���� �ϼ�?
-- 2023.12.29

--[����] �����ϱ��� ���ó�¥���� ���� �ϼ�?
-- 2024.06.14
SELECT SYSDATE
        , TO_DATE('2023-12-29', 'YYYY-MM-DD')
        , CEIL(SYSDATE - TO_DATE('2023-12-29', 'YYYY-MM-DD'))
        , ABS( CEIL(SYSDATE-TO_DATE('2024-06-14', 'YYYY-MM-DD')))
FROM dual;

--NEXT_DAY() �Լ�
SELECT SYSDATE
    , TO_CHAR(SYSDATE, 'YYYY/MM/DD (DY)') a
    , TO_CHAR(SYSDATE, 'YYYY/MM/DD (DAY)') b
    -- ���� ����� �ݿ��ϳ� �������
    , NEXT_DAY(SYSDATE, '��')
    , NEXT_DAY(SYSDATE, '��')
FROM dual;

--[����] 4�� ù ��° ȭ���� ������ (���)
SELECT TO_DATE('2024.04.01') ��
   -- ,NEXT_DAY(TO_DATE('2024.04.01'),'ȭ')
    , NEXT_DAY(TO_DATE('2024.04.01')-1,'��') ��
FROM dual;

-- MONTH_BETWEEN() �� ��¥������ ������ ��ȯ�ϴ� �Լ�
SELECT ename
    , hiredate
    , SYSDATE
    , CEIL(ABS(hiredate - SYSDATE)) �ٹ��ϼ�
    , MONTHS_BETWEEN(SYSDATE, hiredate) �ٹ������� --���� ������ ����ǥ���� ����ʵ�!!!!!!!!!!!!
FROM emp;


-- [��ȯ�Լ�]
-- 1) TO_NUMBER() : ����->���ڷ� ��ȯ
SELECT '12'
        , TO_NUMBER('12')
        , 100-'12'
        , '100' - '12'
FROM dual;

-- 2) TO_CHAR (��¥, ����)
-- [����] insa ���̺��� pay�� ���ڸ����� �޸��� ����ϰ� �տ� ��ȭ��ȣ�� ������
SELECT num, name
    , basicpay, sudang
    , basicpay + sudang pay
    , TO_CHAR(basicpay+ sudang, 'L9,999,999')
FROM insa;

SELECT 12345
    , TO_CHAR(12345) -- '12345'
    , TO_CHAR(12345, '9,999') -- #####
    , TO_CHAR(12345, '99,999') -- '12345'
    , TO_CHAR(12345, '99,999.00') -- '12345'
    , TO_CHAR(12345, '99,999.99') -- '12345'
    , TO_CHAR(12345.123, '99,999.00') -- '12345'
FROM dual;

