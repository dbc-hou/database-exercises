use david;

select * from employees
where first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya'
order by last_name, first_name;

select * from employees
where last_name like 'E%' or last_name like '%E'
order by emp_no desc;

select concat(first_name, ' ', last_name) as full_name from employees
where last_name like 'E%' and last_name like '%E'
order by emp_no desc;

select * from employees
where last_name like '%q%';

select * from employees
where last_name like '%q%' and last_name not like '%qu%';

select *
from employees
where month(birth_date) = 12 and day(birth_date) = 25;

select *, DATEDIFF(now(), hire_date) as days_with_company
from employees
where month(birth_date) = 12 and day(birth_date) = 25 and year(hire_date) between 1990 and 1999
order by hire_date desc, birth_date asc;

select *, DATEDIFF(now(), hire_date)/365.25 as years_with_company
from employees
where month(birth_date) = 12 and day(birth_date) = 25 and year(hire_date) between 1990 and 1999
order by hire_date desc, birth_date asc;