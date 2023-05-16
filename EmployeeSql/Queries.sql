SELECT Employees.emp_no, last_name, first_name, sex, salary FROM Employees
JOIN Salaries ON Employees.emp_no = Salaries.emp_no;

SELECT first_name, last_name, hire_date FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

SELECT department_manager.dept_no, dept_name, employees.emp_no, last_name, first_name FROM department_manager
JOIN departments ON departments.dept_no = department_manager.dept_no
JOIN employees ON department_manager.emp_no = employees.emp_no;

SELECT department_employee.dept_no, employees.emp_no, last_name, first_name, dept_no FROM department_employee
JOIN employees ON department_employee.emp_no = employees.emp_no;

SELECT first_name, last_name, sex FROM employees
WHERE first_name = 'Hercules' AND last_name Like 'B%';

SELECT emp_no, last_name, first_name FROM employees
WHERE emp_no IN (
	SELECT emp_no FROM department_employee
	WHERE dept_no = 'd007'
	);

SELECT employees.emp_no, last_name, first_name, dept_name FROM employees
JOIN department_employee ON employees.emp_no = department_employee.emp_no
JOIN departments ON department_employee.dept_no = departments.dept_no
WHERE departments.dept_no = 'd007' OR departments.dept_no = 'd005';

SELECT last_name, COUNT(last_name) AS last_name_count FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;