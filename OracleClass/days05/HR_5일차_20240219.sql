-- HR


select commission_pct
from employees;

--IS [NOT] NAN    not a Number
select count(*)
from employees 
where commission_pct IS NOT NAN;

--
SELECT count(*)
from employees 
where commission_pct IS NOT NULL;


--[����] employees ���̺��� salary �� 1000 ���� ���� �� 1���� ����ϴ� ���� �ۼ�.
SELECT last_name
    , salary
    , salary/1000
    , salary/1000+1
    , RPAD(' ', ROUND(salary/1000)+1, '*') "Salary"
FROM employees
WHERE department_id = 80
ORDER BY last_name, "Salary";

--RTRIM(), LTRIM(), TRIM()
--����) RTRIM()
SELECT ' admin '
    ,   '['|| ' admin ' || ']'
    ,   '['||RTRIM( ' admin ' )|| ']'
    ,   '['||LTRIM( ' admin ' )|| ']'
    ,   '['||TRIM( ' admin ' )|| ']'
FROM dual;


SELECT RTRIM('BROWINGyxXxy','xy') a
    , RTRIM('BROWINGyxXxyxyxy','xy') b
    , LTRIM('xyBROWINGyxXxyxyxy','xy') c
--    , TRIM('xyBROWINGyxXxyxyxy','xy') d --ORA-00907: missing right parenthesis
    , RTRIM(LTRIM('xyBROWINGyxXxyxyxy','xy'), 'xy') e
FROM dual;




SELECT last_name, employee_id
    , hire_date
    , EXTRACT(year FROM hire_date)
FROM employees
WHERE EXTRACT(year FROM hire_date)>1998
ORDER BY hire_date;


