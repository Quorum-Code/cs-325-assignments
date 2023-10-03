-- Evan Putnam
-- CS 325 - Fall 2022
-- 12/8/2022

spool 325report2.txt;

prompt ========
prompt Report 2
prompt ========

prompt 
prompt This file reports the number of rows associated between tables...
prompt 

prompt => Event + Birder <=
SELECT COUNT(*)
FROM birder_attending_event;

prompt => Birder + Sighting <=
SELECT COUNT(*)
FROM birder, sighting
WHERE birder.brdr_id = sighting.brdr_id;

prompt => Location + Sighting <=
SELECT COUNT(*)
FROM location, sighting
WHERE location.loc_id = sighting.loc_id;

prompt => Bird + Sighting <=
SELECT COUNT(*)
FROM bird, sighting
WHERE bird.bird_id = sighting.bird_id;

spool off;
