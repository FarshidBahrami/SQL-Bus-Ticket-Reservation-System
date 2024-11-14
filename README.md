# Step 1: Creating the Database and Tables
The first step in the setup process is to create a database and its required tables. This ensures that we have a structured database to store our data. In this case, we are creating a database called BTSdb, which will house the tables needed for our application.

You can refer to the setup_database.txt file to view the SQL commands used to create the BTSdb database and its required tables.

# Step 2: Write queries based on the questions
## Query 1: Reservations Based on Origin and Price Range
This query retrieves bookings that meet specific conditions on the origin and the total price. The criteria are:

Origins starting with 'N'
Origins where the second character is 'a'
Origins ending with 'e'
Origins ending with 'n' Additionally, it filters results to include only those bookings where the total price is between 50 and 90.

```sql
select c.customer_id, c.name,
		r.reservation_id ,r.reservation_date,
	   ROUND((r.total_charge/r.total_seats), 2) as fare
	   
from reservation r
inner join customer c on r.customer_id = c.customer_id
where (r.total_charge/r.total_seats) between 30 and 45
  AND reservation_date between '2024/10/19' and '2024/10/22';
```

## Query 2: Customer Reservations Between Specific Dates with Specific Fare
This query retrieves customers who have made reservations between October 19, 2024, and October 22, 2024. It also calculates the fare (total charge divided by total seats) and filters for fare values between 30 and 45. The query also joins the customer and reservation tables to show the customer's details along with their reservation information.
```sql
select c.customer_id, c.name,
		r.reservation_id ,r.reservation_date,
	   ROUND((r.total_charge/r.total_seats), 2) as fare
	   
from reservation r
inner join customer c on r.customer_id = c.customer_id
where (r.total_charge/r.total_seats) between 30 and 45
  AND reservation_date between '2024/10/19' and '2024/10/22';
```
## Query 3: Customer Reservations Ordered by Reservation Count
This query builds on Query 2 by adding a count of how many reservations each customer has made during the specified date range. It calculates the average fare for each customer and orders the results by the number of reservations in descending order. This gives us a list of customers who have made the most reservations within the given time frame.
```sql
SELECT c.customer_id, c.name,
       COUNT(r.reservation_id) AS reservation_count,
       ROUND(AVG(r.total_charge / r.total_seats), 2) AS fare
FROM reservation r
INNER JOIN customer c ON r.customer_id = c.customer_id
WHERE (r.total_charge / r.total_seats) BETWEEN 30 AND 45
  AND r.reservation_date BETWEEN '2024/10/19' AND '2024/10/22'
GROUP BY c.customer_id, c.name
ORDER BY reservation_count DESC;
```
