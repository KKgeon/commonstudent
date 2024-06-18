-- HR
select last_name, salary
from employees
where last_name LIKE 'R%'
ORDER BY salary;

select last_name, salary 
from employees
where last_name LIKE 'R___'
order by salary;

--[¹®Á¦] 