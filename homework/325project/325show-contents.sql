-- Evan Putnam
-- CS 325 - Fall 2022
-- 12/5/2022

spool 325result-contents.txt;

SET TRUNCATE OFF;

prompt =================
prompt Displaying Birder
prompt =================
COLUMN brdr_id FORMAT A7;
COLUMN brdr_name FORMAT A20;
COLUMN favBird FORMAT A7;
COLUMN date_joined FORMAT A11;
SELECT * FROM birder;

prompt ===============
prompt Displaying Bird
prompt ===============
COLUMN bird_id FORMAT A7;
SELECT * FROM bird;

prompt ===================
prompt Displaying Location
prompt ===================
SELECT * FROM location;

prompt ================
prompt Displaying Event
prompt ================
COLUMN event_id FORMAT A8;
COLUMN host_id FORMAT A7;
COLUMN event_date FORMAT A10;
SELECT * FROM event;

prompt =================================
prompt Displaying Birder_attending_event
prompt =================================
SELECT * FROM birder_attending_event;

prompt ===================
prompt Displaying Sighting
prompt ===================
COLUMN sight_id FORMAT A8;
SELECT * FROM sighting;





spool off;
