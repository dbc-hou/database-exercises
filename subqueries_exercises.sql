use david;

-- find all the employees hired the same day as 101010 (Demos Christ)
select * from employees
where hire_date = (
    select hire_date from employees
    where emp_no = 101010
    )
order by emp_no;

-- find the titles of all 314 employees with first name "Aamod
select * from titles
where emp_no in (
    select emp_no from employees
    where first_name = 'Aamod'
);

-- find the number of distinct titles for employees with first name
-- "Aamod"
select distinct title from titles
where emp_no in (
    select emp_no from employees
    where first_name = 'Aamod'
    );

-- find all the current department managers who are female
-- (or at least designated as such in the database)
select first_name, last_name, gender from employees
where emp_no in (
    select emp_no from dept_manager
    where emp_no = employees.emp_no
    and to_date = '9999/01/01'
    )
and gender = 'F';

-- BONUS: find all the departments that currently have female managers
select dept_name from departments as d
join dept_manager dm on d.dept_no = dm.dept_no
join employees e on dm.emp_no = e.emp_no
where dm.emp_no in (
    select dm2.emp_no from dept_manager as dm2
    where dm2.emp_no = e.emp_no
      and to_date = '9999/01/01'
)
and gender = 'F';

-- BONUS: find the employee with the highest salary
select first_name, last_name from employees
join salaries s on employees.emp_no = s.emp_no
where s.salary = (
    select max(salary) from salaries
    );

-- Patrick Quilty's alternative method
SELECT first_name, last_name
FROM employees AS e
         JOIN salaries s on e.emp_no = s.emp_no
order by salary DESC limit 1