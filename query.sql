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






SELECT * FROM departments
SELECT * FROM dept_emp
SELECT * FROM dept_manager
SELECT * FROM employees
SELECT * FROM titles
SELECT * FROM salaries

--List the employee number, last name, first name, sex, and salary of each employee (2 points)


SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.dept_no
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no


--List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-30'


--List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)

SELECT dm.dept_no, d.dept_name, dm.emp_no,
e.last_name, e.first_name
FROM dept_manager dm
JOIN departments d ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no



--List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)

SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no,
employees.last_name,employees.first_name
FROM dept_manager
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON dept_manager.emp_no = employees.emp_no


select * from titles

--List each employee in the Sales department, including their employee number, last name, and first name (2 points)

SELECT e.emp_no, e.first_name, e.last_name
FROM employees e
INNER JOIN titles t ON e.emp_title_id = t.title_id
INNER JOIN dept_emp dept ON e.emp_no = dept.emp_no
INNER JOIN departments d ON dept.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'


--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)

SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees e
INNER JOIN dept_emp dept ON e.emp_no = dept.emp_no
INNER JOIN departments d ON dept.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development')




--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)
SELECT last_name, 
COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC
