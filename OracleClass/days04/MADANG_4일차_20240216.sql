-- MADANG
SELECT MAX(saleprice)
FROM orders
WHERE custid = 3;



SELECT orderid, custid, saleprice
FROM orders
WHERE saleprice> ALL(SELECT(saleprice)
                 FROM orders
                WHERE custid = 3);
                
WHERE saleprice>(SELECT MAX(saleprice)
                 FROM orders
                WHERE custid = 3);                

--30�� �μ��� �ְ� �޿����� ���� �޴� ������� ������ ��ȸ


--EXIST ���� 4-16

--AVG���SUM��MAX����ū��MIN����������
SELECT SUM(saleprice), AVG(saleprice), MAX(saleprice),MIN(saleprice)
FROM ORDERS;

--��� ������ �� �Ǹűݾ�(118000)
SELECT SUM(saleprice)
FROM ORDERS;

--���ѹα� �� üũ ? address Į���� ���ѹα� ���ڿ� ����

SELECT *
FROM customer
WHERE address LIKE '%���ѹα�%';

-- ���ѹα� ������ �� �Ǹűݾ� ��ȸ
SELECT custid,saleprice --SUM(saleprice)
FROm Orders
WHERE custid IN (2,3,5);