use david;

-- three different joins between roles and users:
-- 1. regular join query will lack entries for users with no role
select users.name as user_name, roles.name as role_name
from users
join roles on users.role_id = roles.id;

-- 2. left join query will show users that do not have roles
select users.name as user_name, roles.name as role_name
from users
left join roles on users.role_id = roles.id;

-- 3. right join query will show roles that do not have users
select users.name as user_name, roles.name as role_name
from users
right join roles on users.role_id = roles.id;

-- show all department names and their managers, using the dept_manager
-- table as an associative table
-- i.e., employees join departments via dept_emp
select d.dept_name as 'Department Name',
    concat(e.first_name,' ',e.last_name) as 'Department Manager'
from employees as e
    join dept_manager as dm on dm.emp_no = e.emp_no
    join departments as d on d.dept_no = dm.dept_no
where dm.to_date > now()
    and e.gender = 'F'
order by 'Department Name';

# find the current titles of employees currently working in the
# customer service department, and the count of each title therein.
# this involves four tables!
# titles join employees, employees join departments via dept_manager.
select t.title as Title, count(e.emp_no) as Total
from titles as t
    join employees as e on t.emp_no = e.emp_no
    join dept_emp as de on e.emp_no = de.emp_no
    join departments as d on d.dept_no = de.dept_no
where d.dept_name = 'Customer Service'
    and t.to_date > now()
    and de.to_date > now()
group by Title
order by Total desc;

# find the current salary of all current managers
# (meaning that the to_date fields in both the salary
# and dept_manager tables must both later than now)
# this involves four tables!
# employees join salaries, employees join departments via dept_manager.
select d.dept_name as 'Department Name',
    concat(e.first_name,' ',e.last_name) as 'Department Manager',
    s.salary as 'Salary'
from employees as e
    join salaries as s on e.emp_no = s.emp_no
    join dept_manager as dm on dm.emp_no = e.emp_no
    join departments as d on d.dept_no = dm.dept_no
where dm.to_date > now()
    and s.to_date > now()
order by 'Department Name';

# BONUS: Employees full names and their department managers'
# full names
select concat(e.first_name, ' ', e.last_name) as 'Employee Name',
       d.dept_name as 'Department Name',
       concat(e2.first_name, ' ', e2.last_name) as 'Manager Name'
from employees as e
join dept_emp de on e.emp_no = de.emp_no
join departments d on de.dept_no = d.dept_no
join dept_manager dm on d.dept_no = dm.dept_no
join employees as e2 on e2.emp_no = dm.emp_no
where dm.to_date > now()
and de.to_date > now()
order by d.dept_name;