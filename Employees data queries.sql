-- List the employee number, last name, first name, sex, and salary of each employee (2 points)

SELECT em.emp_no, em.last_name, em.first_name, em.sex, sa.salary 
	FROM Employees em 
	LEFT JOIN Salaries sa
	ON em.emp_no = sa.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
SELECT em.first_name, em.last_name, em.hire_date AS "Hire Date: 1986" 
	FROM Employees em
	WHERE em.hire_date BETWEEN '1986-01-01' AND '1986-12-31'

--List the manager of each department along with their department number, department name, employee 
--number, last name, and first name (2 points)

SELECT e.emp_no, e.last_name, e.first_name, d.dept_no, d.dept_name
	FROM Departments d
	LEFT JOIN Dept_manager dm 
		ON d.dept_no = dm.dept_no
	LEFT JOIN Employees e 
		ON dm.emp_no = e.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, 
--first name, and department name (2 points)

SELECT dp.dept_no, em.emp_no, em.last_name, em.first_name, dp.dept_name
	FROM Departments dp
	LEFT JOIN Dept_emp de
		ON de.dept_no = de.dept_no
	LEFT JOIN Employees em 
		ON de.emp_no = em.emp_no;
		
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name 
--begins with the letter B (2 points)

SELECT em.first_name, em.last_name, em.hire_date 
	FROM Employees em
	WHERE em.first_name = 'Hercules' AND em.last_name LIKE '%B%';
	
--List each employee in the Sales department, including their employee number, last name, and first name (2 points)

SELECT dp.dept_no, em.emp_no, em.last_name, em.first_name, dp.dept_name
	FROM Departments dp
	LEFT JOIN Dept_emp de
		ON de.dept_no = dp.dept_no
	LEFT JOIN Employees em 
		ON de.emp_no = em.emp_no
	WHERE de.dept_no = 'd007';

--List each employee in the Sales and Development departments, including their employee number, last name, 
--first name, and department name (4 points)

SELECT dp.dept_no, em.emp_no, em.last_name, em.first_name, dp.dept_name
	FROM Departments dp
	LEFT JOIN Dept_emp de
		ON de.dept_no = dp.dept_no
	LEFT JOIN Employees em 
		ON de.emp_no = em.emp_no
	WHERE de.dept_no = 'd007' OR de.dept_no ='d005'
	ORDER BY de.dept_no;

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees 
--share each last name) (4 points)

SELECT em.last_name, COUNT(em.last_name) as "Last names frequency"
	FROM Employees em
	GROUP BY em.last_name
	ORDER BY "Last names frequency" DESC;

