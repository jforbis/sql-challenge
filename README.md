# sql-challenge

In this project, I designed the SQL database tables to hold the data from the original 6 CSVs I was provided. To do this I completed the following:<br>
**Data Engineering Steps**
* Created an ERD (that included data types, primary keys, foreign keys and even one composite key) of what my SQL database tables needed to look like.
* Imported that ERD into PGAdmin to create the data base structure.
* Imported the CSVs into my SQL database tables.

**Data Analysis Steps**
Completed SQL database queries as follows:

1. List the following details of each employee: employee number, last name, first name, sex, and salary.

2. List first name, last name, and hire date for employees who were hired in 1986.

3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

4. List the department of each employee with the following information: employee number, last name, first name, and department name.

5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

After querying the database I started to look at the data even further to determine if it was fake. To do this I took the following steps:
* Read in my database information into Jupyter Notebook using Pandas to creat a dataframe that consisted of all the data from my employees, salaries and titles tables - I did this using Inner Joins.
* Then I looked at all of the salaries by position and created a histogram to see what titles held the most salaried positions. 

From this histogram it was determined that of the 300k+ employees in my database, 158,465 employees fall in the $40k salary range (the largest collection of employees per salary range).
