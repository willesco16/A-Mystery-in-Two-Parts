CREATE TABLE "departments" (
    "dept_no" VARCHAR(30)   NOT NULL,
    "dept_name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(30)   NOT NULL,
    "from_date" VARCHAR(30)   NOT NULL,
    "to_date" VARCHAR(30)   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(30)   NOT NULL,
    "emp_no" INT   NOT NULL,
    "from_date" VARCHAR(30)   NOT NULL,
    "to_date" VARCHAR(30)   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" VARCHAR(30)   NOT NULL,
    "birth_date" VARCHAR(30)   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "gender" VARCHAR(2)   NOT NULL,
    "hire_date" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY 
        "emp_no"
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    "from_date" VARCHAR(30)   NOT NULL,
    "to_date" VARCHAR(30)   NOT NULL
);


--List the following details of each employee: employee number, last name, first name, gender, and salary

select employees.emp_no, employees.first_name, employees.last_name,  employees.gender, salaries.salary
FROM employees, salaries
WHERE employees.emp_no = salaries.emp_no;

--List employees who were hired in 1986

select employees.first_name, employees.last_name
from employees
where hire_date LIKE '1986%';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates

select 
departments.dept_no, 
departments.dept_name, 
dept_manager.emp_no, 
employees.last_name, 
employees.first_name, 
dept_manager.from_date, 
dept_manager.to_date
 
from 
dept_manager
inner join departments on departments.dept_no = dept_manager.dept_no
join employees on employees.emp_no = dept_manager.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name

SELECT
dept_manager.emp_no, 
employees.first_name, 
employees.last_name,
departments.dept_name

from dept_manager

join employees 
on employees.emp_no = dept_manager.emp_no
join departments 
on dept_manager.dept_no = departments.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B." 

select * from employees 
where last_name like 'B%' and first_name LIKE 'Hercules';

--List all employees in the Sales department, including their employee number, last name, first name, and department name. 

select 
employees.emp_no, 
employees.first_name, 
employees.last_name, 
departments.dept_name

from dept_manager

join employees on employees.emp_no = dept_manager.emp_no

inner join departments on departments.dept_no = dept_manager.dept_no

where departments.dept_name = 'Sales';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name

SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;