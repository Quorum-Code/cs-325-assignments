-- Evan Putnam
-- CS 325 - Homework 5 - Problem 2
-- 11/13/2022

-- ===
-- 3-1
-- ===
start movies-pop.sql;

spool 325hw5-out.txt;

prompt =================================
prompt Homework 5 Problem 2
prompt Evan Putnam
prompt =================================


prompt ===========
prompt Problem 2-1
prompt ===========

DROP VIEW counter_client_info;
CREATE VIEW counter_client_info AS
	SELECT client_lname, category_name "fave_category"
	FROM client, movie_category
	WHERE client.client_fave_cat = movie_category.category_code;

prompt ===========
prompt Problem 2-2
prompt ===========

SELECT *
FROM counter_client_info
ORDER BY client_lname;

SELECT "fave_category", client_lname
FROM counter_client_info
ORDER BY "fave_category";

prompt ===========
prompt Problem 2-3
prompt ===========

DROP VIEW movie_list;
CREATE VIEW movie_list AS
	SELECT category_name, movie_rating, movie_title
	FROM movie, movie_category
	WHERE movie_category.category_code = movie.category_code;

prompt ===========
prompt Problem 2-4
prompt ===========

SELECT *
FROM movie_list
ORDER BY category_name, movie_rating, movie_title;

prompt ===========
prompt Problem 2-5
prompt ===========

SELECT category_name, count(*) "CATEGORY_QUANT"
FROM movie_list
GROUP BY category_name
ORDER BY "CATEGORY_QUANT" DESC;

prompt ===========
prompt Problem 2-6
prompt ===========

SELECT client_lname, category_name, client_credit_rtg
FROM client, movie_category
WHERE client.client_fave_cat = movie_category.category_code AND client_credit_rtg > (SELECT avg(client_credit_rtg) FROM client);



prompt ======================
prompt Homework 5 - Problem 3
prompt Evan Putnam
prompt ======================


prompt ===========
prompt Problem 3-2
prompt ===========

SELECT movie_title
FROM movie
MINUS
SELECT movie_title
FROM movie
WHERE movie_title IN
       (SELECT movie_title
	FROM movie, video, rental
	WHERE movie.movie_num = video.movie_num AND video.vid_id = rental.vid_id)
ORDER BY movie_title DESC;

prompt ===========
prompt Problem 3-3
prompt ===========

SELECT vid_id, vid_rental_price
FROM video
WHERE vid_format = 'HD-DVD'
UNION
SELECT vid_id, vid_rental_price
FROM video
WHERE vid_id NOT IN (
	SELECT vid_id
	FROM rental)
ORDER BY vid_rental_price DESC;

prompt ===========
prompt Problem 3-4
prompt ===========

SELECT video.vid_id, count(rental.vid_id) "COUNT"
FROM video, rental
WHERE video.vid_id = rental.vid_id
GROUP BY video.vid_id
UNION 
SELECT video.vid_id, 0 "COUNT"
FROM video
WHERE video.vid_id NOT IN
       (SELECT vid_id
	FROM rental)
GROUP BY video.vid_id
ORDER BY "COUNT" DESC;

prompt ===========
propmt Problem 3-5
prompt ===========

SELECT client_lname, client_credit_rtg
FROM client
ORDER BY client_credit_rtg;

UPDATE Client
SET client_credit_rtg = client_credit_rtg * 1.1
WHERE client_credit_rtg < 4.0 AND client_credit_rtg > (SELECT avg(client_credit_rtg) FROM client);

SELECT client_lname, client_credit_rtg
FROM client
ORDER BY client_credit_rtg;

prompt ===========
prompt Problem 3-6
prompt ===========

SELECT count(*)
FROM video;

DELETE FROM video
WHERE vid_id NOT IN
       (SELECT vid_id
	FROM rental);

SELECT *
FROM video;

rollback;

spool off;
