-- What's the most expensive listing? 
-- What else can you tell me about the listing? 
WITH firstjoin AS (WITH maxpad AS 
( 
         SELECT   * 
         FROM     sfo_listings 
         ORDER BY price DESC limit 1) 
SELECT DISTINCT * 
FROM            maxpad m 
JOIN            sfo_reviews r 
ON              m.id = r.listing_id) 
SELECT DISTINCT * 
FROM            firstjoin f 
JOIN            sfo_calendar c 
ON              f.listing_id = c.listing_id; 


-- What neighborhoods seem to be the most popular?
SELECT   Count(id), 
         neighbourhood 
FROM     sfo_listings 
GROUP BY neighbourhood 
ORDER BY count DESC; 


--What time of year is the cheapest time to go to San Francisco?
WITH nonulls AS 
( 
       SELECT * 
       FROM   sfo_calendar 
       WHERE  NOT price IS NULL ) 
SELECT   Round(Avg(To_number(price, 'L9G999g999.99')),2), 
         Extract (month FROM calender_date) 
FROM     nonulls 
GROUP BY date_part 
ORDER BY round ASC ; 


--What about the busiest?
SELECT   Count(available), 
         Extract (month FROM calender_date) 
FROM     sfo_calendar 
WHERE    available = 'f' 
GROUP BY date_part 
ORDER BY count DESC ;