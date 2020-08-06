-- DROP TABLE departments IF EXISTS;
-- DROP TABLE employees IF EXISTS;
-- DROP TABLE dept_emp IF EXISTS;
-- DROP TABLE dept_manager IF EXISTS;
-- DROP TABLE salaries IF EXISTS;
-- DROP TABLE titles IF EXISTS;

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
PRIMARY KEY (emp_no),
foreign key (emp_title_id) references titles (emp_title_id));

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


CREATE TABLE salaries(
emp_no INT NOT NULL,
salary INT NOT NULL,
foreign key (emp_no) references employees(emp_no));

-- select * from employees

CREATE TABLE titles(
emp_title_id VARCHAR(10),
title VARCHAR(20),
primary key (emp_title_id));

-- select * from titles

-- select emp_no from employees
