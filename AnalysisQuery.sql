-- List employee number, last name, first name, sex, and salary of each employee 
Select e.emp_no, e.last_name, e.first_name, e.gender, s.salary
From employees as e
Left Join salaries as s ON
e.emp_no=s.emp_no;


-- List first name, last name and hire date for employees hired in 1986
Select e.emp_no, e.first_name, e.last_name, e.hire_date
From employees as e
Where DATE_PART('year', hire_date)=1986;


-- List manager of each department, their department number, department name, employee number, last name and first name
Select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
From dept_managers as dm
Join departments as d ON
dm.dept_no=d.dept_no
Join employees as e ON
dm.emp_no=e.emp_no;


-- List the department number for each employee along with that employee’s employee number, 
-- last name, first name, and department name
Select e.emp_no, e.last_name, e.first_name, d.dept_name
From employees as e
Join dept_emp as de ON
e.emp_no=de.emp_no
Join departments as d ON
de.dept_no=d.dept_no;


-- List first name, last name, and sex of each employee
-- whose first name is Hercules and whose last name begins with the letter B
Select e.first_name, e.last_name, e.gender from employees as e
Where first_name= 'Hercules' AND last_name LIKE 'B%'
ORDER BY e.last_name;


-- List each employee in the Sales department, including their employee number, last name, and first name
Select e.emp_no, e.last_name, e.first_name, de.dept_no, d.dept_name
From employees as e
Join dept_emp as de ON
e.emp_no=de.emp_no
Join departments as d ON
de.dept_no=d.dept_no
Where d.dept_no='d007';


-- List each employee in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name
Select e.emp_no, e.last_name, e.first_name, d.dept_name 
From employees as e 
Join dept_emp as de ON
e.emp_no=de.emp_no
Join departments as d ON
de.dept_no=d.dept_no
Where d.dept_no='d007' 
OR
d.dept_no='d005';


-- List the frequency counts, in descending order, 
-- of all the employee last names (that is, how many employees share each last name)
Select last_name,
Count(last_name) as "Frequency Count"
From employees
Group by last_name
Order by "Frequency Count" desc;