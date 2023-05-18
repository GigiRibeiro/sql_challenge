SELECT employees.emp_no, last_name, first_name, sex, salary FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

SELECT first_name, last_name, hire_date FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

SELECT dept_manager.dept_no, dept_name, employees.emp_no, last_name, first_name FROM dept_manager
JOIN departments ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;

SELECT dept_emp.dept_no, employees.emp_no, last_name, first_name, dept_no FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no;

SELECT first_name, last_name, sex FROM employees
WHERE first_name = 'Hercules' AND last_name Like 'B%';

SELECT emp_no, last_name, first_name FROM employees
WHERE emp_no IN (
	SELECT emp_no FROM dept_emp
	WHERE dept_no = 'd007'
	);

SELECT employees.emp_no, last_name, first_name, dept_name FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_no = 'd007' OR departments.dept_no = 'd005';

SELECT last_name, COUNT(last_name) AS last_name_count FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;