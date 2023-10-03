-- Evan Putnam, 8/26/2022

-- Single line comment

-- Multiplies 3 by 4
select 3*4
  from dual;

-- Divides 10 by 2
select 10/12
  from dual;



-- Create new table
--drop table student;

create table student
 (StudentID integer,
  FirstName varchar2(25),
  LastName varchar2(25),  
  primary key (StudentID));


-- Insert some rows

insert into student
values
(001,'First', 'Last');

insert into student
values
(999,'name', 'lastname');


-- Select all from table

select * from student;
