-- Evan Putnam
-- CS 325 - Homework 4 - Problem 2
-- Last Modified [10/31/2022]

start movies-create.sql;
start movies-pop.sql;

spool 325hw4-out.txt;

prompt ======================
prompt  Homework 4 Problem 2
prompt ======================
prompt
prompt  Evan Putnam
prompt ======================
prompt 
prompt =============
prompt  Problem 2-1
prompt =============

SELECT vid_id, vid_format
FROM video
WHERE vid_rental_price < (SELECT avg(vid_rental_price)
		      	  FROM video);
prompt =============
prompt  Problem 2-2
prompt =============

SELECT client_lname, client_fname
FROM client
WHERE client_num IN (SELECT client_num
		     FROM rental
		     WHERE vid_id = '130012');
prompt =============
prompt  Problem 2-3
prompt =============

SELECT ( movie_title || ' (' || movie_yr_released || ')' ) "Movies", movie_director_lname "Directors"
FROM movie;

prompt =============
prompt  Problem 2-4
prompt =============

SELECT client_lname, client_fname, client_phone
FROM client
WHERE EXISTS (SELECT 'a'
	      FROM rental
	      WHERE client.client_num = rental.client_num AND date_returned IS NULL);


prompt =============
prompt  Problem 2-5
prompt =============

SELECT movie_title
FROM movie
WHERE NOT EXISTS (SELECT 'a'
		  FROM video
		  WHERE video.movie_num = movie.movie_num AND vid_format = 'Blu-Ray');

prompt =============
prompt  Problem 2-6
prompt =============

SELECT movie_title, movie_yr_released
FROM movie
WHERE movie_director_lname = '&director';

prompt =============
prompt  Problem 2-7
prompt =============

prompt 2-7 query 1:
SELECT *
FROM client
ORDER BY client_credit_rtg ASC;

prompt 2-7 query 2:
SELECT *
FROM client
ORDER BY client_credit_rtg DESC;

prompt =============
prompt  Problem 2-8
prompt =============

SELECT category_name, movie_title, movie_rating
FROM movie_category, movie
WHERE movie_category.category_code = movie.category_code
ORDER BY movie_rating, category_name DESC;

prompt =============
prompt  Problem 2-9
prompt =============

SELECT client_lname, client_phone, client_credit_rtg
FROM client
WHERE client_credit_rtg <= (SELECT avg(client_credit_rtg)
			      FROM client)
ORDER BY client_credit_rtg DESC;

prompt ==============
prompt  Problem 2-10
prompt ==============

SELECT vid_format, count (*) "QTY", avg(vid_rental_price) "AVG RENTAL PRICE"
FROM video
GROUP BY vid_format
ORDER BY 'QTY' DESC;

prompt ==============
prompt  Problem 2-11
prompt ==============

SELECT vid_rental_price, count(*) "QUANTITY"
FROM video
GROUP BY vid_rental_price
ORDER BY vid_rental_price DESC;

prompt ==============
prompt  Problem 2-12
prompt ==============

SELECT vid_rental_price, count(*) "QUANTITY"
FROM video
GROUP BY vid_rental_price
HAVING count(*) >= 5
ORDER BY vid_rental_price DESC;


spool off;
