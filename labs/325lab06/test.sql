--5
SELECT job_title, commission, commission * 1.2 "Plus 20%"
FROM empl
WHERE commission IS NOT NULL;

--7
SELECT empl_last_name, dept_loc
FROM empl e, dept d
WHERE e.dept_num = d.dept_num;

--9
SELECT count(*) "# Salary > 2000"
FROM empl
WHERE salary > 2000;

--11
SELECT count(*), sum(commission), avg(commission)
FROM empl
WHERE job_title = 'Sales';

--13
SELECT min(hiredate)
FROM empl
WHERE job_title = 'Clerk';
