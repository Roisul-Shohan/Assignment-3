--- Query 1--------
SELECT match_id, fixture, base_ticket_price FROM Matches
WHERE tournament_category = 'Champions League' 
         AND match_status = 'Available';



-- Query 2 --------- 

SELECT user_id , full_name, email FROM  users 
WHERE full_name ILIKE  'Tanvir%' 
   OR full_name ILIKE  '%Haque%';

------ Query 3 ------------

SELECT booking_id,user_id,match_id ,
  COALESCE(payment_status,'Action Required') as systematic_status 
  FROM Bookings WHERE payment_status IS NULL;

----------- Query 4 ------------
SELECT booking_id, full_name , fixture , total_cost FROM Bookings b
JOIN Users u
  USING(user_id) 
JOIN Matches m
 USING(match_id);


---- Query 5 ---------

SELECT  user_id , full_name  , booking_id FROM Users u
LEFT JOIN Bookings b 
  USING(user_id);


---------- Query 6 ----------

SELECT booking_id , match_id , total_cost FROM bookings
WHERE total_cost > (
  SELECT AVG(total_cost) FROM Bookings
);



---------- Query 7 --------
SELECT match_id , fixTure , base_ticket_price FROM matches
 ORDER BY base_ticket_price  DESC LIMIT 2 OFFSET 1;

 