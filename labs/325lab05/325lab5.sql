-- Evan Putnam

spool 325lab5-out.txt

prompt Evan Putnam

prompt lab query 1
select empl_last_name
from empl
where mgr is NULL;

prompt lab query 2
select empl_last_name, hiredate
from empl
where job_title = 'Sales';

prompt lab query 3
select dept_name, salary
from empl, dept
where mgr = '7839' AND empl.dept_num = dept.dept_num;

prompt lab query 4
select DISTINCT job_title, mgr
from empl;

prompt lab query 5
select *
from dept
where dept_loc IN ('Dallas', 'Boston', 'New York');

prompt lab query 6
select empl_last_name, job_title, salary
from empl
where salary > '3000' OR salary < 1000;

prompt lab query 7
select *
from empl
where hiredate BETWEEN '1-SEP-2018' and '30-SEP-2018';

prompt lab query 8
select *
from empl
where empl_last_name LIKE 'M%';

spool off;
