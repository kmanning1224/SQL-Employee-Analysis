# sql-challenge

## Questions answered with schema and queries

* List the following details of each employee: employee number, last name, first name, sex, and salary.
```
select employees.emp_no, employees.last_name,
	employees.first_name, employees.sex,
	salaries.salary
from employees
left join salaries on
employees.emp_no = salaries.emp_no
```

* List first name, last name, and hire date for employees who were hired in 1986.

```
select employees.emp_no, employees.first_name, employees.last_name
from employees
where employees.hire_data >= '1985-12-31'
and employees.hire_data < '1987-01-01'
```

* List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

```
select titles.emp_title_id, titles.title,
	employees.first_name, employees.last_name, employees.emp_no
from employees
left join titles on 
employees.emp_title_id = titles.emp_title_id
where titles.title = 'Manager'
```

* List the department of each employee with the following information: employee number, last name, first name, and department name.
```
select employees.emp_no, employees.first_name, employees.last_name,
	departments.dept_name
from employees
inner join dept_manager on
employees.emp_no = dept_manager.emp_no
inner join departments on
dept_manager.dept_no = departments.dept_no;
```

* List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

```
select employees.first_name, employees.last_name, employees.sex
from employees
where employees.first_name = 'Hercules'
and employees.last_name like 'B%'
```

* List all employees in the Sales department, including their employee number, last name, first name, and department name.

```
select employees.emp_no, employees.last_name, employees.first_name,
	departments.dept_name
from employees
inner join dept_manager on
employees.emp_no = dept_manager.emp_no
inner join departments on 
dept_manager.dept_no = departments.dept_no
where dept_name = 'Sales'
```

* List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

```
select employees.emp_no, employees.last_name, employees.first_name,
	departments.dept_name
from employees
inner join dept_manager on
employees.emp_no = dept_manager.emp_no
inner join departments on 
dept_manager.dept_no = departments.dept_no
where dept_name = 'Sales''Development'
```

* In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
```
SELECT employees.last_name, count (*)
FROM employees
group by employees.last_name
order by employees.last_name, count (*) DESC
```

## Bonus
* Create a histogram to visualize the most common salary ranges for employees.
![histogram](https://github.com/kmanning1224/sql-challenge/blob/master/EmployeeSQL/histogram_averages.png)

* Create a bar chart of average salary by title.
![barplot](https://github.com/kmanning1224/sql-challenge/blob/master/EmployeeSQL/barplot_salary_average.png)
