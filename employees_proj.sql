/* CREATE THE DATABASE

create table department (
	dept_no VARCHAR(10) NOT NULL,
	dept_name VARCHAR(30) NOT NULL)

create table dept_emp (
	emp_no VARCHAR(10) NOT NULL,
	dept_no VARCHAR(10) NOT NULL,
	from_date VARCHAR(20) NOT NULL,
	to_date VARCHAR(20) NOT NULL)
	
create table dept_manager (
	dept_no VARCHAR(10) NOT NULL,
	emp_no VARCHAR(10) NOT NULL,
	from_date VARCHAR(20) NOT NULL,
	to_date VARCHAR(20) NOT NULL)
	
create table employees (
	emp_no VARCHAR(10) NOT NULL,
	birth_date VARCHAR(20) NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	gender VARCHAR(30) NOT NULL,
	hire_date VARCHAR(20) NOT NULL)
	
create table salaries (
	emp_no VARCHAR(10) NOT NULL,
	salary INT,
	from_date VARCHAR(20) NOT NULL,
	to_date VARCHAR(20) NOT NULL)
	
create table titles (
	emp_no VARCHAR(10) NOT NULL,
	title VARCHAR(30) NOT NULL,
	from_date VARCHAR(20) NOT NULL,
	to_date VARCHAR(20) NOT NULL)

----------------------------------------------------------------------------------------------------------

1. List the following details of each employee: employee number, last name, first name, gender, and salary.
select 
	employees.emp_no,
	last_name,
	first_name,
	gender,
	salary
from employees join salaries on employees.emp_no=salaries.emp_no;

----------------------------------------------------------------------------------------------------------

2. List employees who were hired in 1986.
SELECT 
	employees.emp_no,
	last_name,
	first_name,
	from_date
from employees join dept_emp on employees.emp_no=dept_emp.emp_no
where from_date like '1986%';

----------------------------------------------------------------------------------------------------------
3. List the manager of each department with the following information: department number, department name, 
the manager's employee number, last name, first name, and start and end employment dates.
SELECT
	dept_manager.emp_no,
	dept_manager.dept_no,
	dept_name,
	last_name,
	first_name,
	from_date,
	to_date
from dept_manager join department on dept_manager.dept_no=department.dept_no
				  join employees on dept_manager.emp_no=employees.emp_no
order by dept_manager.dept_no ASC;

----------------------------------------------------------------------------------------------------------
4. List the department of each employee with the following information: 
employee number, last name, first name, and department name.
SELECT 
	dept_name,
	employees.emp_no,
	last_name,
	first_name
from dept_emp join department on dept_emp.dept_no=department.dept_no
			  join employees on dept_emp.emp_no=employees.emp_no
order by department.dept_no ASC;
----------------------------------------------------------------------------------------------------------
5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT 
	first_name,
	last_name
from employees
where first_name='Hercules' and last_name like 'B%';
----------------------------------------------------------------------------------------------------------
6. List all employees in the Sales department, including their employee number, 
last name, first name, and department name.

SELECT 
	employees.emp_no,
	last_name,
	first_name,
	dept_name
from dept_emp join department on dept_emp.dept_no=department.dept_no
			  join employees on dept_emp.emp_no=employees.emp_no
where dept_name='Sales'
order by employees.emp_no ASC;
----------------------------------------------------------------------------------------------------------
7. List all employees in the Sales and Development departments, including their 
employee number, last name, first name, and department name.

SELECT 
	employees.emp_no,
	last_name,
	first_name,
	dept_name
from dept_emp join department on dept_emp.dept_no=department.dept_no
			  join employees on dept_emp.emp_no=employees.emp_no
where dept_name='Sales' or dept_name='Development'
order by employees.emp_no ASC;
----------------------------------------------------------------------------------------------------------

8. In descending order, list the frequency count of employee last names, i.e., 
how many employees share each last name.

SELECT 
	COUNT(last_name),
	last_name
from employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;











