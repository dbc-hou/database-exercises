use david;

select * from employees
where first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya'
and gender = 'M';

select * from employees
where last_name like 'E%' or last_name like '%E';

select first_name,last_name from employees
where last_name like 'E%' and last_name like '%E'
order by hire_date;

select * from employees
where last_name like '%q%';

select * from employees
where last_name like '%q%' and last_name not like '%qu%';