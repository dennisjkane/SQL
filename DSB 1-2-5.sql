-- What are the three longest trips on rainy days??   
SELECT DISTINCT q.trip_id, 
                q.duration, 
                q.start_station, 
                q.end_station, 
                q.start_date 
FROM   (SELECT t.duration, 
               t.trip_id, 
               t.start_station, 
               t.end_station, 
               t.start_date, 
               w.date, 
               w.events 
        FROM   trips t 
               JOIN weather w 
                 ON w.date = LEFT(t.start_date, 10) 
        WHERE  w.precipitationin > 0 
                OR w.events LIKE '%Rain%') AS q 
ORDER  BY q.duration DESC; 


-- Which station is full most often?   
SELECT Count(s.docks_available), 
       s.station_id, 
       stations.NAME 
FROM   status s 
       JOIN stations 
         ON stations.station_id = s.station_id 
WHERE  s.docks_available = 0 
GROUP  BY s.station_id, 
          stations.NAME 
ORDER  BY count DESC; 


-- Which station is full most often?   
SELECT Count(CASE WHEN s.docks_available = 0 
THEN 1 END), 
       s.station_id, 
       stations.NAME 
FROM   status s 
       JOIN stations 
         ON stations.station_id = s.station_id 
GROUP  BY s.station_id, 
          stations.NAME 
ORDER  BY count DESC; 
-- Return a list of stations with a count of number of trips  
-- starting at that station but ordered by dock count.   
SELECT Count(t.trip_id), 
       t.start_station, 
       s.NAME, 
       s.dockcount 
FROM   stations s 
       JOIN trips t 
         ON t.start_station = s.NAME 
GROUP  BY t.start_station, 
          s.NAME, 
          s.dockcount 
ORDER  BY s.dockcount ASC;


-- (Challenge) What's the length of the longest trip for each day it rains anywhere?   
SELECT DISTINCT q.date, 
                q.max, 
                q.trip_id 
FROM   (SELECT Max(t.duration), 
               w.date, 
               t.trip_id 
        FROM   trips t 
               JOIN weather w 
                 ON w.date = LEFT(t.start_date, 10) 
        WHERE  w.precipitationin > 0 
                OR w.events LIKE '%Rain%' 
        GROUP  BY w.date, 
                  t.trip_id) AS q 
ORDER  BY q.date ASC; 


-- (Challenge) What's the length of the longest trip for each day it rains anywhere?   
SELECT DISTINCT q.date, 
                q.max 
FROM   (SELECT Max(t.duration), 
               w.date 
        FROM   trips t 
               JOIN weather w 
                 ON w.date = LEFT(t.start_date, 10) 
        WHERE  w.precipitationin > 0 
                OR w.events LIKE '%Rain%' 
        GROUP  BY w.date) AS q 
ORDER  BY q.date ASC; 


-- (Challenge) What's the length of the longest trip for each day it rains anywhere?   
SELECT DISTINCT q.date, 
                q.max, 
                q.trip_id 
FROM   (SELECT Max(t.duration), 
               w.date, 
               t.trip_id 
        FROM   trips t 
               JOIN weather w 
                 ON w.date = LEFT(t.start_date, 10) 
        WHERE  w.precipitationin > 0 
                OR w.events LIKE '%Rain%' 
        GROUP  BY w.date, 
                  t.trip_id) AS q 
ORDER  BY q.date ASC; 


-- (Challenge) What's the length of the longest trip for each day it rains anywhere?   
SELECT DISTINCT q.date, 
                q.max 
FROM   (SELECT Max(t.duration), 
               w.date 
        FROM   trips t 
               JOIN weather w 
                 ON w.date = LEFT(t.start_date, 10) 
        WHERE  w.precipitationin > 0 
                OR w.events LIKE '%Rain%' 
        GROUP  BY w.date) AS q 
ORDER  BY q.date ASC;