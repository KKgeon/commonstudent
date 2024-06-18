-- SYS
SELECT *
FROM dba_tables
WHERE owner = UPPER('scott');

SELECT*
FROM arirang;

FROM scott.emp;

--SYNONYM ARIRANG이(가) 생성되었습니다.
CREATE PUBLIC SYNONYM arirang
FOR scott.emp;

DROP PUBLIC SYNONYM arirang;


SELECT*
FROM all_synonyms
WHERE synonym_name LIKE 'ARI%';
--PUBLIC	ARIRANG	SCOTT	EMP	


