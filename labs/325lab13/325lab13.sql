-- Evan Putnam
-- 11/18/2022

spool 325lab13-out.sql;

prompt ===========
prompt Evan Putnam
prompt ===========


prompt =============
prompt Lab Problem 1
prompt =============

SELECT dept_name, salary
FROM dept, empl
WHERE empl.dept_num = dept.dept_num
ORDER BY dept_name;

prompt =============
prompt Lab Problem 2
prompt =============

set pagesize 50;
set feedback 0;
/

prompt =============
prompt Lab Problem 3
prompt =============
col dept_name heading Department format a10
/

prompt =============
prompt Lab Problem 4
prompt =============

col salary heading "Dept|Salaries" format $99,999.99
/

prompt =============
prompt Lab Problem 5 
prompt =============
break on dept_name skip 1
/

prompt =============
prompt Lab Problem 6
prompt =============
compute avg of salary on dept_name
/

prompt =============
prompt Lab Problem 7
prompt =============
ttitle "Department Salaries and Averages"
/

prompt =============
prompt Lab Problem 8
prompt =============
ttitle "Deptartment Location, Job Title, and Commission"

col dept_loc heading "Dept Location" format a14
col job_title heading "Job" format a10
col commission heading "Commission Cost" format $999,999.99

compute count LABEL "Empl at Loc" of job_title on dept_loc 

break on dept_loc skip 1

SELECT dept_loc, job_title, commission
FROM empl, dept
WHERE empl.dept_num = dept.dept_num
ORDER BY dept_loc, commission DESC;



prompt =============
prompt Lab Problem 9
prompt =============

clear breaks computes columns

ttitle off

set pagesize 14
set feedback 6
set linesize 80
set space 1

spool off;
