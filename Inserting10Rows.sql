-- Creating Raw Values up to 10 rows for each Table
-- BusOperator Table
INSERT INTO BusOperator (name, contact_number) VALUES
('City Express', '9876543210'),
('Urban Movers', '8765432109'),
('Metro Transit', '9988776655'),
('Highway Lines', '8899001122'),
('Skyline Transport', '7788992233'),
('Prime Movers', '6677883344'),
('EcoRide', '5566774455'),
('QuickWay Buses', '4455667788'),
('Royal Express', '3344558899'),
('National Coaches', '2233445566');

-- Bus Table

INSERT INTO Bus (bus_number, capacity, operator_id) VALUES
('BUS101', 40, 1),
('BUS202', 50, 2),
('BUS303', 30, 3),
('BUS404', 45, 3),
('BUS505', 35, 5),
('BUS606', 55, 6),
('BUS707', 40, 1),
('BUS808', 60, 3),
('BUS909', 50, 9),
('BUS010', 25, 3);

-- Route Table
INSERT INTO Route (origin, destination) VALUES
('New York', 'Boston'),
('San Francisco', 'Los Angeles'),
('Chicago', 'Houston'),
('Miami', 'Orlando'),
('Seattle', 'Portland'),
('Austin', 'Dallas'),
('Las Vegas', 'Phoenix'),
('Atlanta', 'Charlotte'),
('Denver', 'Salt Lake City'),
('Philadelphia', 'Washington');

-- Station Table
INSERT INTO Station (station_name, city) VALUES
('Central Station', 'New York'),
('Bay Station', 'San Francisco'),
('Union Station', 'Chicago'),
('Downtown Terminal', 'Miami'),
('King Street Station', 'Seattle'),
('North Terminal', 'Austin'),
('Strip Station', 'Las Vegas'),
('Main Hub', 'Atlanta'),
('Capitol Station', 'Denver'),
('Liberty Terminal', 'Philadelphia');

-- Trip Table
INSERT INTO Trip (route_id, bus_id, date, departure_time, arrival_time) VALUES
(1, 1, '2024-10-20', '09:00:00', '13:00:00'),
(2, 2, '2024-10-21', '11:00:00', '15:00:00'),
(3, 3, '2024-10-22', '08:00:00', '12:30:00'),
(4, 4, '2024-10-23', '10:30:00', '13:30:00'),
(5, 5, '2024-10-24', '14:00:00', '18:00:00'),
(6, 6, '2024-10-25', '07:45:00', '10:45:00'),
(7, 7, '2024-10-26', '09:15:00', '12:15:00'),
(8, 8, '2024-10-27', '13:30:00', '16:30:00'),
(9, 9, '2024-10-28', '06:00:00', '10:00:00'),
(10, 10, '2024-10-29', '16:15:00', '19:45:00');

-- Customer Table
INSERT INTO Customer (email, name, phone_number) VALUES
('john@example.com', 'John Doe', '1234567890'),
('jane@example.com', 'Jane Smith', '0987654321'),
('david@example.com', 'David Johnson', '1122334455'),
('emma@example.com', 'Emma Brown', '6677889900'),
('liam@example.com', 'Liam Wilson', '2233445566'),
('olivia@example.com', 'Olivia Davis', '9988776655'),
('mason@example.com', 'Mason Miller', '4433221100'),
('sophia@example.com', 'Sophia Anderson', '5566778899'),
('jack@example.com', 'Jack Thomas', '3344556677'),
('ava@example.com', 'Ava Harris', '4455667788');

-- Reservation Table
INSERT INTO Reservation (customer_id, trip_id, reservation_number, reservation_state, reservation_date, travel_date, origin, destination, total_seats, total_charge) VALUES
(1, 1, 'R001', 'New York', '2024-10-15', '2024-10-20', 'New York', 'Boston', 2, 80),
(2, 2, 'R002', 'California', '2024-10-17', '2024-10-21', 'San Francisco', 'Los Angeles', 1, 50),
(3, 3, 'R003', 'Texas', '2024-10-18', '2024-10-22', 'Chicago', 'Houston', 3, 90),
(4, 4, 'R004', 'Florida', '2024-10-19', '2024-10-23', 'Miami', 'Orlando', 2, 60),
(6, 5, 'R005', 'Washington', '2024-10-20', '2024-10-24', 'Seattle', 'Portland', 1, 45),
(6, 6, 'R006', 'Texas', '2024-10-21', '2024-10-25', 'Austin', 'Dallas', 2, 70),
(2, 7, 'R007', 'Nevada', '2024-10-22', '2024-10-26', 'Las Vegas', 'Phoenix', 3, 120),
(8, 8, 'R008', 'Georgia', '2024-10-23', '2024-10-27', 'Atlanta', 'Charlotte', 1, 55),
(2, 10, 'R009', 'Colorado', '2024-10-24', '2024-10-28', 'Denver', 'Salt Lake City', 2, 75),
(10, 10, 'R010', 'Pennsylvania', '2024-10-25', '2024-10-29', 'Philadelphia', 'Washington', 4, 100);

-- Booking Table
INSERT INTO Booking (reservation_id, number_of_seats, total_price) VALUES
(1, 2, 80),
(2, 1, 50),
(3, 3, 90),
(4, 2, 60),
(5, 1, 45),
(6, 2, 70),
(7, 3, 120),
(8, 1, 55),
(9, 2, 75),
(10, 4, 100);

-- FareCode Table
INSERT INTO FareCode (fare_code, description, price) VALUES
('FC01', 'Standard Fare', 40),
('FC02', 'Student Fare', 50),
('FC03', 'Senior Citizen Fare', 30),
('FC04', 'Group Fare', 35),
('FC05', 'Express Fare', 60),
('FC06', 'Economy Fare', 25),
('FC07', 'Weekend Fare', 45),
('FC08', 'Holiday Fare', 55),
('FC09', 'Promotional Fare', 20),
('FC10', 'VIP Fare', 100);

-- Ticket Table
INSERT INTO Ticket (booking_id, fare_code, status) VALUES
(1, 'FC01', 'Confirmed'),
(2, 'FC02', 'Confirmed'),
(3, 'FC03', 'Pending'),
(4, 'FC04', 'Confirmed'),
(5, 'FC05', 'Cancelled'),
(6, 'FC06', 'Confirmed'),
(7, 'FC07', 'Pending'),
(8, 'FC08', 'Confirmed'),
(9, 'FC09', 'Cancelled'),
(10, 'FC10', 'Confirmed');

select * from Bus;