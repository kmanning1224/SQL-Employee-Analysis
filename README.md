# sql-challenge
## Table set up
* Use the information you have to create a table schema for each of the six CSV files. Remember to specify data types, primary keys, foreign keys, and other constraints.

* For the primary keys check to see if the column is unique, otherwise create a composite key. Which takes to primary keys in order to uniquely identify a row.
* Be sure to create tables in the correct order to handle foreign keys.
* Import each CSV file into the corresponding SQL table. Note be sure to import the data in the same order that the tables were created and account for the headers when importing to avoid errors.
```
DROP TABLE departments IF EXISTS;
DROP TABLE employees IF EXISTS;
DROP TABLE dept_emp IF EXISTS;
DROP TABLE dept_manager IF EXISTS;
DROP TABLE salaries IF EXISTS;
DROP TABLE titles IF EXISTS;

CREATE TABLE departments(
dept_no VARCHAR(30),
dept_name VARCHAR(30),
primary key (dept_no));

-- select * from departments

CREATE TABLE employees(
emp_no INT NOT NULL,
emp_title_id VARCHAR(20),
birth_date DATE,
first_name VARCHAR(30),
last_name VARCHAR(30),
sex TEXT,
hire_data DATE,
PRIMARY KEY (emp_no));

CREATE TABLE dept_emp(
emp_no INT NOT NULL,
dept_no VARCHAR(20),
foreign key (emp_no) REFERENCES employees(emp_no));

-- select * from dept_emp

CREATE TABLE dept_manager(
dept_no VARCHAR(20),
emp_no INT NOT NULL,
foreign key (dept_no) references departments(dept_no),
foreign key (emp_no) references employees(emp_no));

-- select * from dept_manager

-- select * from employees

CREATE TABLE salaries(
emp_no INT NOT NULL,
salary INT NOT NULL,
foreign key (emp_no) references employees(emp_no));

-- select * from employees

CREATE TABLE titles(
emp_title_id VARCHAR(10),
title VARCHAR(20),
PRIMARY KEY (emp_title_id));

-- select * from titles

-- select emp_no from employees
```
## Questions answered with queries

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

### Epilogue

* Evidence in hand, you march into your boss's office and present the visualization. With a sly grin, your boss thanks you for your work. On your way out of the office, you hear the words, "Search your ID number." You look down at your badge to see that your employee ID number is 499942.

```
df_employee = combined_data_final.copy()
df_employee.loc[df_employee['emp_no'] == 499942]
```

![epiloguefind](https://i.gyazo.com/d6a51938ea4676547557d3dbe76a4da3.png)
