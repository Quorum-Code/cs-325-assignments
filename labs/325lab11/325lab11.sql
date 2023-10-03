-- Evan Putnam
-- CS 325
-- 11/4/2022

spool 325lab11-out.txt

prompt Evan Putnam

prompt ===============
prompt  Lab Problem 1
prompt ===============

DROP view empl_salaries;
CREATE view empl_salaries as
	SELECT empl_last_name, salary
	FROM empl;

prompt ===============
prompt  Lab Problem 2
prompt ===============

SELECT *
FROM empl_salaries;

prompt ===============
prompt  Lab Problem 3
prompt ===============

SELECT max(salary)
FROM empl_salaries;

prompt ===============
prompt  Lab Problem 4
prompt ===============

DROP VIEW earliest_hires;
CREATE VIEW earliest_hires(job_title, min_hiredate) as
	SELECT job_title, min(hiredate)
	FROM empl
	GROUP BY job_title;


prompt ===============
prompt  Lab Problem 5
prompt ===============

SELECT *
FROM earliest_hires;


prompt ===============
prompt  Lab Problem 6
prompt ===============

SELECT max(min_hiredate)
FROM earliest_hires;

prompt ===============
prompt  Lab Problem 7
prompt ===============

DROP VIEW cust_reps;
CREATE VIEW cust_reps AS 
	SELECT (cust_lname || ', ' || cust_fname) "CUSTOMER", empl_last_name "REPD_BY", dept_loc
	FROM customer, dept, empl
	WHERE customer.empl_rep = empl.empl_num AND empl.dept_num = dept.dept_num;

prompt ===============
prompt  Lab Problem 8
prompt ===============

SELECT *
FROM cust_reps;

prompt ===============
prompt  Lab Problem 9
prompt ===============

DROP VIEW earliest_dept_hire;
CREATE VIEW earliest_dept_hire(dept_name, min_hiredate) AS
	SELECT dept_name, min(hiredate)
	FROM empl, dept
	WHERE empl.dept_num = dept.dept_num
	GROUP BY dept_name;


SELECT *
FROM earliest_dept_hire;

SELECT e.dept_name, min_hiredate, dept_loc
FROM earliest_dept_hire e, dept
WHERE dept.dept_name = e.dept_name;

spool off;
