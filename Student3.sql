-- Queries Student 3

-- 1.	Display the bus with the most number of seats sold for business class.
SELECT 
    B.bus_number, 
    SUM(BK.number_of_seats) AS total_business_seats
FROM 
    Ticket T
JOIN 
    Booking BK ON T.booking_id = BK.booking_id
JOIN 
    Reservation R ON BK.reservation_id = R.reservation_id
JOIN 
    Trip TR ON R.trip_id = TR.trip_id
JOIN 
    Bus B ON TR.bus_id = B.bus_id
WHERE 
    T.fare_code = 'FC01'  -- Assuming FC01 represents business class
GROUP BY 
    B.bus_number
ORDER BY 
    total_business_seats DESC;


-- 2. List all customers’ first names and last names who did not place any reservations. Sort the records by customer id in descending order.
SELECT C.name
FROM customer C
LEFT JOIN reservation R ON C.customer_id = R.customer_id
WHERE R.customer_id IS NULL
ORDER BY C.customer_id DESC;

-- 3. Show the bus operator ID, bus operator name, and the total number of buses for each bus route.
SELECT 
    BO.operator_id, 
    BO.name AS name, 
    COUNT(B.bus_id) AS total_buses
FROM 
    busoperator BO
LEFT JOIN 
    bus B ON BO.operator_id = B.operator_id
GROUP BY 
    BO.operator_id, BO.name
ORDER BY 
    total_buses DESC;
