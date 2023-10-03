-- Evan Putnam
-- 10/21/2022

spool 325lab9-out.txt;

prompt Evan Putnam

prompt =========
prompt  Query 1
prompt =========

SELECT *
FROM dept
ORDER BY dept_loc;


prompt =========
prompt  Query 2
prompt =========

SELECT *
FROM dept
ORDER BY dept_name;


prompt =========
prompt  Query 3
prompt =========

SELECT empl_last_name, dept_name, salary, hiredate
FROM empl, dept
WHERE empl.dept_num = dept.dept_num
ORDER BY dept_name, hiredate;


prompt =========
prompt  Query 4
prompt =========

SELECT empl_last_name, dept_name, salary, hiredate
FROM empl, dept
WHERE empl.dept_num = dept.dept_num
ORDER BY salary DESC, hiredate ASC;


prompt =========
prompt  Query 5
prompt =========

SELECT mgr, min(hiredate)
FROM empl
GROUP BY mgr;


prompt =========
prompt  Query 6
prompt =========

SELECT mgr, min(hiredate)
FROM empl
GROUP BY mgr
HAVING min(hiredate) > '01-JAN-15';


prompt =========
prompt  Query 7
prompt =========

SELECT dept_name, COUNT(*)
FROM empl, dept
WHERE empl.dept_num = dept.dept_num
GROUP BY dept.dept_name
ORDER BY COUNT(*);


prompt =========
prompt  Query 8
prompt =========

SELECT dept.dept_name, COUNT(*)
FROM empl, dept
WHERE empl.dept_num = dept.dept_num
GROUP BY dept.dept_name
HAVING avg(salary) < 2000
ORDER BY COUNT(*);

prompt =========
prompt  Query 9
prompt =========

SELECT empl_last_name, job_title, commission
FROM empl
ORDER BY commission ASC;


spool off;
