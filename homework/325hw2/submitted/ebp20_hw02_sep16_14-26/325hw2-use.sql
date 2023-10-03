-- Evan Putnam
-- CS 325 Homework 2 - Use Tables
-- 9/16/2022
-- 325hw2-use.sql

spool '325hw2-out.txt';

prompt ===============================
prompt CS 325 Homework 2 - Question 13
prompt ===============================

prompt Evan Putnam
prompt The following indicates the status of 'Client' table

describe Client;

select *
from Client;

prompt The following indicates the status of 'Video' table

describe Video;

select *
from Video;

prompt The following indicates the status of 'Rental' table

describe Rental

select *
from Rental;

spool off;
