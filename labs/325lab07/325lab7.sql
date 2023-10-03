-- Evan Putnam
-- CS 325
-- 10/7/2022
-- Lab 7

spool 325lab7-out.txt

prompt =============
prompt  Evan Putnam
prompt =============

prompt =============
prompt  Lab Query 1
prompt =============


SELECT empl_last_name, hiredate
FROM empl
WHERE job_title = 'Manager' AND salary > (
	SELECT avg(salary)
	FROM empl
	WHERE job_title = 'Manager'
);


prompt =============
prompt  Lab Query 2
prompt =============

SELECT hiredate
FROM empl
WHERE dept_num IN (
	SELECT dept_num
	FROM dept
	WHERE dept_loc = 'New York'
);


prompt =============
prompt  Lab Query 3
prompt =============

SELECT empl_last_name, hiredate
FROM empl
WHERE hiredate > (
	SELECT max(hiredate)
	FROM empl
	WHERE job_title = 'Manager'
);


prompt =============
prompt  Lab Query 4
prompt =============

SELECT empl_last_name "Employee", (dept_name || ' (' || dept_loc || ')') AS "Deptartment (Location)"
FROM empl, dept
WHERE empl.dept_num = dept.dept_num;


prompt =============
prompt  Lab Query 5
prompt =============

SELECT empl_last_name, job_title, hiredate
FROM empl
WHERE hiredate > '01-JAN-2018'
UNION
SELECT empl_last_name, job_title, hiredate
FROM empl, dept
WHERE empl.dept_num = dept.dept_num AND dept_loc = 'Dallas';


prompt =============
prompt  Lab Query 6
prompt =============

SELECT empl_last_name
FROM empl
WHERE hiredate > (
	SELECT max(hiredate)
	FROM empl
	WHERE job_title = 'Manager'
);


spool off;
