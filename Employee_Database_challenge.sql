-- Module 7 Challenge
SELECT e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- - Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no, 
rt.first_name,
rt.last_name,
rt.title
-- INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

-- Employee count by title
SELECT COUNT(u.title), u.title
INTO retiring_titles 
FROM unique_titles as u
GROUP BY u.title
ORDER BY count DESC

-- Create Mentorship Eligibility table 
SELECT Distinct On(e.emp_no) e.emp_no, e.first_name, e.last_name, 
e.birth_date,
de.from_date,
de.to_date,
t.title
INTO mentorship_eligibility
FROM employees as e
Left Join dept_emp as de
on (e.emp_no = de.emp_no)
Left Join titles as t
on (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
Order by e.emp_no;