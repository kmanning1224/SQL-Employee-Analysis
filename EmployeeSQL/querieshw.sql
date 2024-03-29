select employees.emp_no, employees.last_name,
	employees.first_name, employees.sex,
	salaries.salary
from employees
left join salaries on
employees.emp_no = salaries.emp_no

select employees.emp_no, employees.first_name, employees.last_name
from employees
where employees.hire_data >= '1985-12-31'
and employees.hire_data < '1987-01-01'

select * from titles

select titles.emp_title_id, titles.title,
	employees.first_name, employees.last_name, employees.emp_no
from employees
left join titles on 
employees.emp_title_id = titles.emp_title_id
where titles.title = 'Manager'



select employees.emp_no, employees.first_name, employees.last_name,
	departments.dept_name
from employees
inner join dept_manager on
employees.emp_no = dept_manager.emp_no
inner join departments on
dept_manager.dept_no = departments.dept_no;

select employees.first_name, employees.last_name, employees.sex
from employees
where employees.first_name = 'Hercules'
and employees.last_name like 'B%'

select employees.emp_no, employees.last_name, employees.first_name,
	departments.dept_name
from employees
inner join dept_manager on
employees.emp_no = dept_manager.emp_no
inner join departments on 
dept_manager.dept_no = departments.dept_no
where dept_name = 'Sales'

select employees.emp_no, employees.last_name, employees.first_name,
	departments.dept_name
from employees
inner join dept_manager on
employees.emp_no = dept_manager.emp_no
inner join departments on 
dept_manager.dept_no = departments.dept_no
where dept_name = 'Sales''Development'


SELECT employees.last_name, count (*)
FROM employees
group by employees.last_name
order by employees.last_name, count (*) DESC


