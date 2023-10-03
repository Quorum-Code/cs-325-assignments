-- Evan Putnam
-- CS 325 Homework 2 - Create tables
-- 9/16/2022
-- 325hw2-create.sql

prompt ===============================
prompt CS 325 Homework 2 - Question 10 
prompt ===============================

prompt
prompt Creating tables for Video Store
prompt

drop table Client cascade constraints;
drop table Video  cascade constraints;
drop table Rental cascade constraints;

create table Client
(Cli_id			varchar2(4),
 Cli_lname		varchar2(25),
 Cli_fname		varchar2(25),
 Cli_phone		varchar2(10),
 primary key (Cli_id));

create table Video
(Vid_id			varchar2(6),
 Vid_format		varchar2(10),
 Vid_purchase_date	date,
 Vid_rental_price	number(7,2),
 Vid_length		number(5,0),
 primary key (Vid_id));

create table Rental
(Cli_id			varchar2(4),
 Vid_id			varchar2(6),
 foreign key		(Cli_id) references Client,
 foreign key 		(Vid_id) references Video);
