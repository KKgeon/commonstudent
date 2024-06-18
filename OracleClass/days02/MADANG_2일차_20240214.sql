-- MADANG
SELECT *
FROM tabs;
--
DESC IMPORTED_BOOK;
DESC BOOK;
SELECT  *
FROM imported_book;
FROM book;

--
SELECT name "이름", phone "전화번호"
      , NVL(phone, '연락처 없음') "전화번호"
      , NVL(phone, 0) "전화번호"
FROM customer;









