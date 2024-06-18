-- HR
DESC employees;

SELECT *
FROM employees;

-- 550p 巩力 [1]
SELECT LAST_NAME || FIRST_NAME AS name, job_id AS job, salary
    ,salary*12+100 AS "Increased Ann_salary"
    ,(salary+100)*12 AS "Increased salary"
FROM employees;

-- 550p 巩力 [2]
SELECT LAST_NAME || ':'|| ' 1 Year Salary = $' || TO_CHAR(salary*12) AS "1 Year Salary "
FROM employees;

-- 550p 巩力 [3]
SELECT DISTINCT DEPARTMENT_ID, JOB_ID 
FROM employees;


--551p 巩力 [1]
SELECT last_name
FROM employees
WHERE last_name LIKE '%e%' AND last_name LIKE '%o%' ;