use david;

-- join query will lack entries for users with no role
select users.name as user_name, roles.name as role_name
from users
join roles on users.role_id = roles.id;

-- left join query will show users that do not have roles
select users.name as user_name, roles.name as role_name
from users
left join roles on users.role_id = roles.id;

-- right join query will show roles that do not have users
select users.name as user_name, roles.name as role_name
from users
right join roles on users.role_id = roles.id;

-- show all department names and their managers, using the dept_manager
-- table as an associative table
select d.dept_name as 'Department Name',
    concat(e.first_name,' ',e.last_name) as 'Department Manager',
from employees as e
    join dept_manager as dm on dm.emp_no = e.emp_no
    join departments as d on d.dept_no = dm.dept_no
where dm.to_date = '9999-01-01'
    and e.gender = 'F'
order by 'Department Name';

select t.title as Title, count(e.emp_no) as Total
from titles as t
    join employees as e on t.emp_no = e.emp_no
    join dept_emp as de on e.emp_no = de.emp_no
    join departments as d on d.dept_no = de.dept_no
where d.dept_name = 'Customer Service'
    and t.to_date = '9999-01-01'
    and de.to_date = '9999-01-01'
group by Title
order by Total desc;

select d.dept_name as 'Department Name',
    concat(e.first_name,' ',e.last_name) as 'Department Manager',
    s.salary as 'Salary'
from employees as e
    join salaries as s on e.emp_no = s.emp_no
    join dept_manager as dm on dm.emp_no = e.emp_no
    join departments as d on d.dept_no = dm.dept_no
where dm.to_date = '9999-01-01'
    and s.to_date = '9999-01-01'
order by 'Department Name';