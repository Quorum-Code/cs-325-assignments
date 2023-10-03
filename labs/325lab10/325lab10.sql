-- Evan Putnam
-- 10/28/2022
-- CS 325
-- Lab 10

start set-up-ex-tbls.sql;

spool 325lab10-out.txt;

prompt =============
prompt  Evan Putnam
prompt =============


prompt =========
prompt  Query 1
prompt =========

SELECT job_title, mgr
FROM empl
WHERE salary < 2000
UNION
SELECT job_title, mgr
FROM empl
WHERE commission IS NOT NULL;

prompt =========
prompt  Query 2
prompt =========

SELECT job_title, mgr
FROM empl
WHERE salary < 2000
INTERSECT
SELECT job_title, mgr
FROM empl
WHERE commission IS NOT NULL;

prompt =========
prompt  Query 3
prompt =========

SELECT job_title, mgr
FROM empl
WHERE salary < 2000
MINUS
SELECT job_title, mgr
FROM empl
WHERE commission IS NOT NULL;

prompt =========
prompt  Query 4
prompt =========

SELECT empl_last_name, salary * 2 "TWICE SALARY"
FROM empl
WHERE job_title = 'Clerk'
MINUS
SELECT empl_last_name, salary * 2 "TWICE SALARY"
FROM empl
WHERE hiredate < '01-JAN-2015'
ORDER BY "TWICE SALARY" DESC;

prompt =========
prompt  Query 5
prompt =========

SELECT empl_last_name, commission
FROM empl
WHERE commission IS NOT NULL;

SELECT empl_last_name, 0
FROM empl
WHERE commission IS NULL;


SELECT empl_last_name, commission "COMM_VALUE"
FROM empl
WHERE commission IS NOT NULL
UNION
SELECT empl_last_name, 0 "COMM_VALUE"
FROM empl
WHERE commission IS NULL
ORDER BY "COMM_VALUE" DESC, empl_last_name ASC;


prompt =========
prompt  Query 6
prompt =========

SELECT empl_last_name, job_title, salary
FROM empl
WHERE job_title != 'Manager' AND salary > (SELECT min(salary)
					   FROM empl
					   WHERE job_title = 'Manager');

SELECT empl_last_name, job_title, salary
FROM empl
WHERE dept_num IN (SELECT dept_num
		   FROM dept
		   WHERE dept_loc = 'New York');

-- UNION
SELECT empl_last_name, job_title, salary
FROM empl
WHERE job_title != 'Manager' AND salary > (SELECT min(salary)
                                           FROM empl
                                           WHERE job_title = 'Manager')
UNION
SELECT empl_last_name, job_title, salary
FROM empl
WHERE dept_num IN (SELECT dept_num
                   FROM dept
                   WHERE dept_loc = 'New York')
ORDER BY salary;

prompt =========
prompt  Query 7
prompt =========

SELECT empl_last_name, job_title, salary, commission
FROM empl
WHERE commission IS NOT NULL;

UPDATE empl
SET commission = commission + 100
WHERE job_title = 'Sales' AND salary < (SELECT avg(salary)
					FROM empl
					WHERE job_title = 'Sales');

SELECT empl_last_name, job_title, salary, commission
FROM empl;

prompt =========
prompt  Query 8
prompt =========

DELETE FROM empl
WHERE salary < (SELECT min(salary)
		FROM empl
		WHERE job_title = 'Sales');

SELECT empl_last_name, job_title, salary
FROM empl;

prompt =========
prompt  Query 9
prompt =========

rollback;


spool off;
