
SELECT *
FROM (
SELECT ROWNUM no , t.*
FROM (
    SELECT seq, title, writer, email, writedate, readed
    FROM TBL_CSTVSBOARD
    ORDER BY seq DESC
    ) t
) b
WHERE no BETWEEN 1 AND 10;


SELECT *
FROM TBL_CSTVSBOARD;