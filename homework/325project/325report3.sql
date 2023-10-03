-- Evan Putnam
-- CS 325 - Fall 2022
-- 12/8/2022

spool 325report3.txt;

prompt ========
prompt Report 3
prompt ========

prompt
prompt Data oriented report...
prompt Calculates number of birds sighted by each user, 
prompt calculates number of birders attending each event,
prompt calculates users percentage of total birds sighted.
prompt 

SET PAGESIZE 50;

TTITLE "= User Report on Bird Sightings ="
BREAK ON brdr_name SKIP 2;
COMPUTE SUM LABEL 'No. Birds' OF num_birds ON brdr_name
SELECT brdr_name, br.brdr_id, b.bird_name, num_birds
FROM birder br, sighting s, bird b
WHERE br.brdr_id = s.brdr_id AND s.bird_id = b.bird_id
ORDER BY brdr_name;


TTITLE "= Event Report ="
BTITLE "= END OF REPORT ="
BREAK ON event_title SKIP 2;
COMPUTE NUM LABEL 'No. Birders Attending' OF brdr_name ON event_title;
SELECT e.event_title, br.brdr_name, br.brdr_id
FROM birder br, birder_attending_event ba, event e 
WHERE br.brdr_id = ba.brdr_id AND ba.event_id = e.event_id
ORDER BY event_title;

COL CLEAR brdr_name;
COL "Percent" FORMAT 9.99;
TTITLE "= Birder Percent of Total Sightings ="
SELECT br.brdr_name, COUNT(br.brdr_name) / (SELECT COUNT(*) FROM sighting) as "Percent"
FROM birder br, sighting s
WHERE br.brdr_id = s.brdr_id
GROUP BY br.brdr_name
UNION
SELECT br.brdr_name, 0.00
FROM birder br
WHERE br.brdr_id NOT IN (SELECT brdr_id
		  	 FROM sighting)
ORDER BY "Percent" DESC;

spool off;
