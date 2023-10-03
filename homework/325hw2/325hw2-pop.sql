-- Evan Putnam
-- CS 325 HW2 Question 11
-- 9/16/2022
-- 325hw2-pop.sql

/*===========
 In case this is re-run (to get a "fresh" set of initial
 contents), delete any current contents
===========*/

delete from rental;
delete from video;
delete from client;

prompt ===============================
prompt CS 325 Homework 2 - Question 11
prompt ===============================

prompt Populating Client...

insert into Client
values
('000A', 'Alpha', 'Ann', '000-0001');

insert into Client
values
('111B', 'Beta', 'Bob', '111-1112');

insert into Client
values
('222B', 'Beta', 'Ann', '222-2223');

insert into Client
values
('333C', 'Carlos', 'David', '333-3334');

insert into Client
values
('444D', 'Delta', 'Edie', '111-1112');


prompt Populating Video...

insert into Video
values
('00000D', 'DVD', '10-JAN-2020', 1.99, 73);

insert into Video 
values 
('11111H', 'HD-DVD', '20-FEB-2021', 4.99, 91);

insert into Video 
values 
('22222B', 'BluRay', '30-MAR-2019', 1.99, 105);

insert into Video 
values 
('33333H', 'HD-DVD', '20-FEB-2021', 3.99, 69);

insert into Video 
values 
('44444B', 'BluRay', '04-APR-2017', 0.99, 91);


prompt Populating Rental...

insert into Rental
values
('111B', '11111H');

insert into Rental
values
('222B', '00000D');

insert into Rental
values
('222B', '22222B');

insert into Rental
values
('333C', '22222B');

insert into Rental
values
('333C', '00000D');

insert into Rental
values
('333C', '11111H');

insert into Rental
values
('000A', '44444B');

prompt ===============================
prompt CS 325 Homework 2 - Question 12
prompt ===============================

prompt Adding new Client, Video, and Rental...

insert into Client
values
('128E', 'Evan', 'Putnam', '888-8889');

insert into Video
values
('55555L', 'LaserDisc', '09-SEP-2022', 2.99, 120);

insert into Rental
values
('128E', '55555L');
