-- Evan Putnam CS325 Lab02 9/2/2022

spool '325lab2-out.txt';

prompt;
prompt Evan Putnam;
prompt;

-- Parts Table

drop table part_order;
drop table parts;
create table parts
  (part_num integer,
   part_name varchar2(25),
   quantity integer,
   price integer,
   primary key (part_num));

describe parts;
prompt;

insert into parts
values
(8438, 'Screw', 123, 20);

insert into parts
values
(6547, 'Nail', 90000, 12);

insert into parts
values
(7987, 'Bolt', 789, 15);

insert into parts
values
(6548, 'Rebar', 985, 600);

insert into parts
values
(9999, 'Nut', 639, 17);

insert into parts
values
(0000, 'QA', 0, 99999999);


select * from parts;


-- Part_Orders table

--drop table part_orders;
create table part_orders
  (order_num integer,
   cust_num integer,
   part_num integer,
   order_date varchar2(25),
   primary key (order_num),
   foreign key (part_num) references parts (part_num));

describe part_orders;

insert into part_orders
values
(0001, 985, 7987, '12/25/00');

insert into part_orders
values
(0002, 654, 6548, '08/11/17');

insert into part_orders
values
(0003, 321, 9999, '06/06/06');

insert into part_orders
values
(0004, 123, 0000, 'example date');


select * from part_orders;

spool off;
