-- Evan Putnam
-- 10/14/2022

spool 325lab8-out.txt;

prompt =========
prompt  Query 1
prompt =========

SELECT dept_name
FROM dept
WHERE EXISTS (SELECT 'a'
              FROM empl
              WHERE empl.dept_num = dept.dept_num AND salary >= 3000);

prompt =========
prompt  Query 2
prompt =========

SELECT empl_last_name
FROM empl
WHERE job_title = 'Sales' AND NOT EXISTS (SELECT 'a'
                  FROM customer
                  WHERE empl_rep = empl_num);

prompt =========
prompt  Query 3
prompt =========

SELECT empl_last_name, job_title
FROM empl, dept
WHERE &dept_name = dept_name AND dept.dept_num = empl.dept_num;

prompt =========
prompt  Query 4
prompt =========

SELECT (empl_last_name || ' - $' || salary) "Employee Salaries"
FROM empl;

prompt =========
prompt  Query 5
prompt =========

SELECT empl_last_name
FROM empl
WHERE empl_num IN (SELECT mgr
                   FROM empl
                   WHERE job_title = 'Clerk' AND salary IN (SELECT max(salary) 
                                                            FROM empl
                                                            WHERE job_title = 'Clerk'));

prompt =========
prompt  Query 6
prompt =========

SELECT '35'
FROM empl
WHERE job_title = 'Manager';

prompt =========
prompt  Query 7
prompt =========

SELECT empl_rep
FROM customer
UNION
SELECT empl_num
FROM empl
WHERE job_title = 'Analyst';


spool off;
