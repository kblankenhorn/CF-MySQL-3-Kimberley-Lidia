-- this is to find how many employees are named mark

SELECT COUNT(first_name) FROM `employees` WHERE (first_name='mark')

-- to find a last name with the letter "a"

SELECT COUNT(last_name) FROM `employees` WHERE last_name LIKE 'A%'

-- to find an employee with the first name eric and last name starting with "a"

SELECT COUNT(first_name), (last_name) FROM `employees` WHERE (first_name='Eric') AND last_name LIKE 'A%'

-- or this will give the list

SELECT * FROM `employees` WHERE (first_name='Eric') AND last_name LIKE 'A%'

-- looking up a range of dates..."hired from x date"

SELECT hire_date FROM `employees` WHERE employees.hire_date>'1985-01-01'

-- looking for ranges of dates

SELECT hire_date FROM `employees` WHERE employees.hire_date BETWEEN'1990-01-01'AND '1997-01-01'

-- to look for salaries higher than 70k

select distinct employees.emp_no, employees.first_name, employees.last_name
from employees
INNER JOIN salaries
on salaries.emp_no = employees.emp_no
WHERE salary > 70000
ORDER BY `employees`.`emp_no` ASC

-- To find employees who work in research since 1992


SELECT employees.first_name, employees.last_name, employees.emp_no
FROM employees
INNER JOIN dept_emp ON dept_emp.emp_no=employees.emp_no
INNER JOIN departments ON departments.dept_no=dept_emp.dept_no
WHERE dept_emp.dept_no='d008' AND hire_date>'1992-01-01' AND
dept_emp.to_date>CURRENT_DATE()

-- or you can use a subquery

SELECT employees.first_name, employees.last_name FROM employees WHERE employees.hire_date>'1992-01-01' AND(SELECT emp_no FROM departments WHERE departments.dept_name='Research')

-- finding employees in finance who make more than 75k working since 85

SELECT employees.first_name, employees.last_name, employees.emp_no
FROM employees
INNER JOIN dept_emp ON dept_emp.emp_no=employees.emp_no
INNER JOIN salaries ON salaries.salary=employees.emp_no
INNER JOIN departments ON departments.dept_no=dept_emp.dept_no
WHERE dept_emp.dept_no='d002' AND hire_date>'1985-01-01' AND
dept_emp.to_date>CURRENT_DATE() AND salaries.salary>75000

-- finding all employee info with salaries and titles
SELECT employees.first_name, employees.last_name, employees.birth_date,
employees.gender, employees .hire_date, titles.title, salaries.salary 
FROM employees AS employees 
INNER JOIN salaries ON salaries.emp_no = employees.emp_no 
INNER JOIN titles ON titles.emp_no = employees.emp_no 
WHERE salaries.to_date = '9999-01-01'


-- finding department managers

SELECT employees.first_name, employees.last_name, employees.birth_date, 
employees.gender, employees.hire_date, titles.title, salaries.salary,
departments.dept_name 
FROM employees  
INNER JOIN salaries ON salaries.emp_no = employees.emp_no 
INNER JOIN titles ON titles.emp_no = employees.emp_no 
INNER JOIN dept_manager ON dept_manager.emp_no = employees.emp_no 
INNER JOIN departments ON departments.dept_no = dept_manager.dept_no 
WHERE salaries.to_date = '9999-01-01' AND titles.title = 'Manager'


















