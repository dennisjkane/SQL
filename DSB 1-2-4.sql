-- What was the hottest day in our data set? Where was that? 
SELECT zip, 
       maxtemperaturef, 
       date 
FROM   weather 
ORDER  BY maxtemperaturef DESC; 


-- Looks like 134 degrees Farenheit  2015-11-17 in the zip 94063 - Redwood City 
-- How many trips started at each station? 
SELECT start_station, 
       Count(trip_id) AS station_starts 
FROM   trips 
GROUP  BY start_station; 


-- What's the shortest trip that happened? 
SELECT duration, 
       trip_id, 
       start_date, 
       start_station, 
       end_station 
FROM   trips 
ORDER  BY duration ASC; 


-- Looks like numerous trips were about an hour 
-- What is the average trip duration, by end station? 
SELECT end_station, 
       Avg(duration) AS avg_dur 
FROM   trips 
GROUP  BY end_station;