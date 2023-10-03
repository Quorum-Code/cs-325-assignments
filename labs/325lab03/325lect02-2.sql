
--========

spool 325lect02-2-out.txt

-- demo of the SQL*Plus prompt command:

prompt
prompt Howdy there CS 325
prompt


select *
from   stuff;

prompt hey about to demo forward slash

-- and typing a forward slash redoes the previous SQL statement:

/

-- playing with some of the column types discussed today

drop table parts cascade constraints;

create table parts
(part_num         integer,
 part_name        varchar2(25) unique not null,
 quantity_on_hand smallint,
 price            decimal(6, 2), -- max price allowed is 9999.99
 level_code       char(3),       -- MUST be exactly 3 characters
 last_inspected   date,
 primary key      (part_num)
);

drop table part_orders cascade constraints;

create table part_orders
(order_num     char(6),
 cust_num      char(8)   not null,
 part_num      integer   not null,
 order_date    date, 
 quantity      integer   default 1 not null,
 order_code    char(1)   check(order_code in ('B', 'I', 'G')),
 delivery_code char(1)   check(delivery_code in ('U', 'F', 'P')) not null,
 primary key (order_num),
 foreign key (part_num) references parts
);

prompt *** describe parts: ***

describe parts

prompt *** describe part_orders: ***

describe part_orders

-- let's add a few parts

insert into parts
values
(10603, 'hexagonal wrench', 13, 9.99, 'XXX', '15-Aug-2021');

-- sysdate returns the current date (when this this SQL script is run!)

insert into parts
values
(10604, 'tire', 287, 39.99, 'MMM', sysdate);

insert into parts(price, part_name, part_num)
values
(876.54, 'bubble gum', 10605);

-- this FAILS, part_name is too long for varchar2(25)

prompt ========
prompt Look at error message you get when you put a too-long string for 
prompt a varchar2 column:
prompt ========

insert into parts
values
(10602, '5/8 in lug nut from Argentina or Brazil', 1000, 0.02, '00X', sysdate);

insert into part_orders
values
('111111', '11111111', 10603, sysdate, 3, 'B', 'U');

prompt ========
prompt Look at error message you get when you try to insert a row
prompt with a foreign key value NOT in the referenced (parent) table:
prompt ========

insert into part_orders
values
('222222', '22222222', 10609, '1-sep-2020', 4, 'I', 'P');

insert into part_orders
values
('222222', '22222222', 10604, '1-sep-2020', 4, 'I', 'P');

select *
from   parts;

select *
from   part_orders;

spool off
