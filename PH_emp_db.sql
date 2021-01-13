-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/2ZIEFA
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Table Schemata

DROP TABLE departments CASCADE;
DROP TABLE dept_emp CASCADE;
DROP TABLE dept_manager CASCADE;
DROP TABLE employees CASCADE;
DROP TABLE salaries CASCADE;
DROP TABLE titles CASCADE;

CREATE TABLE "employees" (
    "emp_no" Integer   NOT NULL,
    "emp_title_id" Varchar   NOT NULL,
    "birth_date" Date   NOT NULL,
    "first_name" Varchar   NOT NULL,
    "last_name" Varchar   NOT NULL,
    "sex" Varchar   NOT NULL,
    "hire_date" Date   NOT NULL,
   	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

CREATE TABLE "dept_emp" (
    "emp_no" Integer   NOT NULL,
    "dept_no" Varchar   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE "salaries" (
    "emp_no" Integer   NOT NULL,
    "salary" Integer   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE "dept_manager" (
    "dept_no" Varchar   NOT NULL,
    "emp_no" Integer   NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE "titles" (
    "title_id" Varchar   NOT NULL,
    "title" Varchar   NOT NULL,
	PRIMARY KEY (title_id)
);

CREATE TABLE "departments" (
    "dept_no" Varchar   NOT NULL,
    "dept_name" Varchar   NOT NULL,
	PRIMARY KEY (dept_no)
);

SELECT * FROM departments
SELECT * FROM dept_emp
SELECT * FROM dept_manager
SELECT * FROM employees
SELECT * FROM salaries
SELECT * FROM titles

-- Queries
-- Query #1. List the following details of each employee: 
-- 			 employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex,
s.salary
FROM employees e
INNER JOIN salaries s ON
e.emp_no = s.emp_no;

-- Query #2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT last_name, first_name, hire_date FROM employees
WHERE hire_date >= '1986-1-1' AND hire_date <= '1986/12/31';

-- Query #3. List the manager of each department with the following information: 
-- 			 department number, department name, the manager's employee number, 
-- 			 last name, first name.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager dm
INNER JOIN departments d ON
dm.dept_no = d.dept_no
INNER JOIN employees e ON
dm.emp_no = e.emp_no;

-- Query #4. List the department of each employee with the following information: 
-- 			 employee number, last name, first name, and department name.
SELECT d.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees e
INNER JOIN dept_emp de ON
e.emp_no = de.emp_no
INNER JOIN departments d ON
de.dept_no = d.dept_no;

-- Query #5. List first name, last name, and sex for employees whose first name
-- 			 is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex FROM employees
Where first_name = 'Hercules'
AND LEFT(last_name, 1) = 'B'

-- Query #6. List all employees in the Sales department, including their 
-- 			 employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON
e.emp_no = de.emp_no
INNER JOIN departments d ON
de.dept_no = d.dept_no
WHERE dept_name = 'Sales';

-- Query #7. List all employees in the Sales and Development departments, including 
-- 			 their employee number, last name, first name, and department name.
-- (Why are there only 2 showing up??)
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON
e.emp_no = de.emp_no
INNER JOIN departments d ON
de.dept_no = d.dept_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

-- Query #8. In descending order, list the frequency count of employee last names, 
-- 			 i.e., how many employees share each last name.
SELECT last_name, COUNT (last_name)
FROM employees
GROUP BY last_name
ORDER BY last_name desc;