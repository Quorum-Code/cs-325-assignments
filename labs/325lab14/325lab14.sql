-- Evan Putnam
-- CS 325 - Lab 14
-- 12/2/2022

spool 325lab14-out.txt

prompt "==========="
prompt "Evan Putnam"
prompt "==========="
prompt ""

prompt "============="
prompt "Lab Problem 1"
prompt "============="

SELECT empl_last_name "Last Name", to_char(hiredate, 'Day') "Day of Week"
FROM empl;

prompt "============="
prompt "Lab Problem 2"
prompt "============="

SELECT upper(substr(empl_last_name, 1, 4)) "First Four"
FROM empl;

prompt "============="
prompt "Lab Problem 3"
prompt "============="

SELECT empl_last_name, hiredate, add_months(hiredate, 6) "ELIG_DATE"
FROM empl;

prompt "============="
prompt "Lab Problem 4"
prompt "============="

SELECT empl_last_name, months_between(sysdate, hiredate) "Months Hired", to_char(hiredate, 'YY') "YY"
FROM empl;

SELECT lower(cust_state) "State", substr(cust_city, 1, 3) "First 3 of City"
FROM customer;

spool off;
