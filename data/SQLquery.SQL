Create table titles (
	title_id VARCHAR not null,
	title VARCHAR not null,
	PRIMARY KEY (title_id)
)

SELECT * FROM titles

create table employees (
	emp_no INT not null,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id),
	PRIMARY KEY (emp_no)
	
)

SELECT * FROM employees

CREATE TABLE salaries ( 
	emp_no INT NOT NULL,
	dept_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
)

SELECT * FROM salaries

CREATE TABLE departments (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no)
)

SELECT * FROM departments

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
)

SELECT * FROM dept_emp

CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no)
)

SELECT * FROM dept_manager


drop table dept_manager
