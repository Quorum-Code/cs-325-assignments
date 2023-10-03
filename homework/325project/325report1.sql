-- Evan Putnam
-- CS 325 - Fall 2022
-- 12/8/2022

spool 325report1.txt;

prompt ========
prompt Report 1
prompt ========

prompt 
prompt This file reports the number of entries found in each table associated 
prompt with "BirdBook" project for CS 325 - 2022
prompt 

prompt => Birder Table <=
SELECT COUNT(*)
FROM birder;

prompt => Event Table <=
SELECT COUNT(*)
FROM event;

prompt => Sighting Table <=
SELECT COUNT(*)
FROM sighting;

prompt => Location Table <=
SELECT COUNT(*)
FROM location;

prompt => Bird Table <=
SELECT COUNT(*)
FROM bird;

spool off;
