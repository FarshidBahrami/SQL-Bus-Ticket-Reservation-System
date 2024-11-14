-- Query 1: to call all th reservations made from origins:
-- starting with N, 
-- or have second character as a
-- or last character as e
-- or ending with n
-- while having the total price between 50 to 90
SELECT b.booking_id, b.reservation_id, b.total_price, r.origin
FROM booking b
INNER JOIN reservation r ON b.reservation_id = r.reservation_id
WHERE (r.origin LIKE 'N%' 
   OR r.origin LIKE '_a%' 
   OR r.origin LIKE '%e'
   OR r.origin LIKE '%n')
   and b.total_price between 50 and 90;


select * from reservation;

-- Query 2: to call all customers with their id where they have booked reservation:
-- Done: between 19 to 22 October 2024
-- Done: the fare for each ticket is between 30 to 45

select c.customer_id, c.name,
		r.reservation_id ,r.reservation_date,
	   ROUND((r.total_charge/r.total_seats), 2) as fare
	   
from reservation r
inner join customer c on r.customer_id = c.customer_id
where (r.total_charge/r.total_seats) between 30 and 45
  AND reservation_date between '2024/10/19' and '2024/10/22';

-- Query 3: continue query 2 and order them based on the number of reservations (descending)
SELECT c.customer_id, c.name,
       COUNT(r.reservation_id) AS reservation_count,
       ROUND(AVG(r.total_charge / r.total_seats), 2) AS fare
FROM reservation r
INNER JOIN customer c ON r.customer_id = c.customer_id
WHERE (r.total_charge / r.total_seats) BETWEEN 30 AND 45
  AND r.reservation_date BETWEEN '2024/10/19' AND '2024/10/22'
GROUP BY c.customer_id, c.name
ORDER BY reservation_count DESC;