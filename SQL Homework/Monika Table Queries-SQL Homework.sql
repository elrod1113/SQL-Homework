--Questions
--1. List the following details of each employee: 
--employee number, last name, first name, gender, and salary.

select e.emp_no,e.last_name,e.first_name,e.gender,s.salary
from employees as e
inner join salaries as s
on e.emp_no = s.emp_no
order by e.last_name


--2. List employees who were hired in 1986.
select e.emp_no,e.last_name,e.first_name,e.hire_date
from employees as e
where e.hire_date between '1986-01-01' and '1986-12-31'
order by e.last_name


--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.

select d.dept_no,d.dept_name,e.emp_no,e.last_name,e.first_name,dm.from_date,dm.to_date
from dept as d
	inner join dept_mgr as dm
	on d.dept_no = dm.dept_no
		inner join employees as e
		on dm.emp_no = e.emp_no
order by d.dept_no, dm.from_date


--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

select e.emp_no,e.last_name,e.first_name,d.dept_name
from employees as e
	inner join dept_emp as de
	on e.emp_no = de.emp_no
	inner join dept as d
	on de.dept_no = d.dept_no
order by e.last_name


--5. List all employees whose first name is "Hercules" and last names begin with "B."

select e.first_name, e.last_name
from employees as e
where e.first_name = 'Hercules' and e.last_name like 'B%'
order by e.last_name


--6. List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.

select d.dept_name, e.emp_no,e.last_name,e.first_name
from employees as e
	inner join dept_emp as de
	on e.emp_no = de.emp_no
	inner join dept as d
	on de.dept_no = d.dept_no
where d.dept_name ='Sales'
order by e.last_name


--7. List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.

select d.dept_name, e.emp_no,e.last_name,e.first_name
from employees as e
	inner join dept_emp as de
	on e.emp_no = de.emp_no
	inner join dept as d
	on de.dept_no = d.dept_no
where d.dept_name in ('Sales', 'Development')
order by e.last_name


--8. In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

select distinct e.last_name, count(e.last_name)
from employees as e
group by e.last_name
order by count desc


--average salary by title.
create view avg_salary_by_title as
select distinct t.title, avg(s.salary) avg_salary
from titles as t
	inner join employees as e
	on t.emp_no = e.emp_no
	inner join salaries as s
	on e.emp_no = s.emp_no
group by t.title
order by t.title

select *
from avg_salary_by_title

--## Epilogue
--Evidence in hand, you march into your boss's office and present the visualization. 
--With a sly grin, your boss thanks you for your work. On your way out of the office, 
--you hear the words, "Search your ID number." You look down at your badge to see 
--that your employee ID number is 499942.

select e.emp_no,e.first_name,e.last_name
from employees as e
where e.emp_no = '499942'
