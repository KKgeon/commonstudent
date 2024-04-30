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

--30번 부서의 최고 급여보다 많이 받는 사원들의 정보를 조회


--EXIST 질의 4-16

--AVG평균SUM합MAX가장큰값MIN가장작은값
SELECT SUM(saleprice), AVG(saleprice), MAX(saleprice),MIN(saleprice)
FROM ORDERS;

--모든 고객들의 총 판매금액(118000)
SELECT SUM(saleprice)
FROM ORDERS;

--대한민국 고객 체크 ? address 칼럼에 대한민국 문자열 포함

SELECT *
FROM customer
WHERE address LIKE '%대한민국%';

-- 대한민국 고객들의 총 판매금액 조회
SELECT custid,saleprice --SUM(saleprice)
FROm Orders
WHERE custid IN (2,3,5);