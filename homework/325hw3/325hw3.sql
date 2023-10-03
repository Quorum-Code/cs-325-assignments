-- Evan Putnam
-- CS 325 - Homework 3 - Part 2
-- 9/29/2022

spool 325hw3-out.txt

prompt Homework 3 Part 2

prompt Evan Putnam


prompt PART 2-A
SELECT *
FROM client
WHERE client.client_credit_rtg > 3.4;

prompt PART 2-B
SELECT DISTINCT movie_rating, movie_yr_released
FROM movie;

prompt PART 2-C
SELECT *
FROM client, movie_category
WHERE client.client_fave_cat = movie_category.category_code;

prompt PART 2-D
SELECT vid_id, date_out, date_due
FROM rental
WHERE date_returned IS NULL;

prompt PART 2-E
SELECT vid_id, vid_format, vid_rental_price
FROM video
WHERE vid_format != 'Blu-Ray';

prompt PART 2-F
SELECT category_name, client_lname, client_credit_rtg
FROM movie_category, client
WHERE client.client_fave_cat = movie_category.category_code;

prompt PART 2-G
SELECT *
FROM video
WHERE vid_purchase_date BETWEEN '15-JUL-2008' AND '01-DEC-2011';

prompt PART 2-H
SELECT *
FROM video
WHERE vid_rental_price >= '3.99';

prompt PART 2-I
SELECT movie_title, movie_rating
FROM movie
WHERE movie_title LIKE '%the%';

prompt PART 2-J
SELECT movie_rating, movie_title
FROM movie
WHERE movie_rating IN ('A', 'R', 'PG-13');




spool off;
