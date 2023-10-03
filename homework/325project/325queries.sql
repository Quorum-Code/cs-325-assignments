-- Evan Putnam
-- CS 325 Project
-- 12/8/2022

spool 325query-results.txt;

prompt =======
prompt Query 1
prompt =======
prompt Selects all events occurring this month...
SELECT *
FROM event
WHERE extract(month from event_date) = extract(month from sysdate);

prompt =======
prompt Query 2
prompt =======
prompt Selects all events occuring on Saturday or Sunday...
SELECT *
FROM event
WHERE to_char(event_date, 'DY') = 'SAT' OR to_char(event_date, 'DY') = 'SUN';

prompt =======
prompt Query 3
prompt =======
prompt Selects locations ordered by number of bird sightings (Descending)...
SELECT loc_name, COUNT(sight_id) "No. Sighting"
FROM location, sighting
WHERE location.loc_id = sighting.loc_id
GROUP BY loc_name
ORDER BY COUNT(sight_id) DESC;

prompt =======
prompt Query 4
prompt =======
prompt Selects locations ordered by number of bird sightings (Ascending)...
SELECT loc_name, count(bird_id) "No. Sighting"
FROM sighting, location
WHERE sighting.loc_id = location.loc_id
GROUP BY loc_name
ORDER BY COUNT(bird_id);

prompt =======
prompt Query 5
prompt =======
prompt Selects all sightings at South Jetty...
SELECT loc_name, bird_name
FROM location, sighting, bird
WHERE location.loc_id = sighting.loc_id AND sighting.bird_id = bird.bird_id AND location.loc_id = 7;

prompt =======
prompt Query 6
prompt =======
prompt Selects Birders sorted by number of sightings...
SELECT brdr_name, COUNT(sight_id)
FROM birder, sighting
WHERE birder.brdr_id = sighting.brdr_id
GROUP BY brdr_name
ORDER BY COUNT(sight_id) DESC;

prompt =======
prompt Query 7
prompt =======
prompt Selects Birders sorted by date joined (Ascending)...
SELECT *
FROM birder
ORDER BY date_joined;

prompt =======
prompt Query 8
prompt =======
prompt Selects Birders whose date_joined is less than the average date_joined...
SELECT brdr_name, date_joined
FROM birder
WHERE date_joined < (SELECT TO_DATE(ROUND(AVG(TO_NUMBER(TO_CHAR(date_joined, 'J')))), 'J')
		     FROM birder)
ORDER BY date_joined ASC;

spool off;
