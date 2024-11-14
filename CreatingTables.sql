
-- 1. BusOperator Table
CREATE TABLE BusOperator (
    operator_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_number VARCHAR(15)
);

-- 2. Bus Table
CREATE TABLE Bus (
    bus_id SERIAL PRIMARY KEY,
    bus_number VARCHAR(10) NOT NULL,
    capacity INT NOT NULL CHECK (capacity > 0),
    operator_id INT REFERENCES BusOperator(operator_id) ON DELETE CASCADE
);

-- 3. Route Table
CREATE TABLE Route (
    route_id SERIAL PRIMARY KEY,
    origin VARCHAR(100) NOT NULL,
    destination VARCHAR(100) NOT NULL
);

-- 4. Station Table
CREATE TABLE Station (
    station_id SERIAL PRIMARY KEY,
    station_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL
);

-- 5. Trip Table
CREATE TABLE Trip (
    trip_id SERIAL PRIMARY KEY,
    route_id INT REFERENCES Route(route_id) ON DELETE CASCADE,
    bus_id INT REFERENCES Bus(bus_id) ON DELETE CASCADE,
    date DATE NOT NULL,
    departure_time TIME NOT NULL,
    arrival_time TIME NOT NULL
);

-- 6. Customer Table
CREATE TABLE Customer (
    customer_id SERIAL PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15)
);

-- 7. Reservation Table
CREATE TABLE Reservation (
    reservation_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customer(customer_id) ON DELETE CASCADE,
    trip_id INT REFERENCES Trip(trip_id) ON DELETE CASCADE,
    reservation_number VARCHAR(10) UNIQUE NOT NULL,
    reservation_state VARCHAR(50),
    reservation_date DATE NOT NULL,
    travel_date DATE NOT NULL,
    origin VARCHAR(100) NOT NULL,
    destination VARCHAR(100) NOT NULL,
    total_seats INT NOT NULL CHECK (total_seats > 0),
    total_charge NUMERIC(10, 2) NOT NULL
);

-- 8. Booking Table
CREATE TABLE Booking (
    booking_id SERIAL PRIMARY KEY,
    reservation_id INT REFERENCES Reservation(reservation_id) ON DELETE CASCADE,
    number_of_seats INT NOT NULL CHECK (number_of_seats > 0),
    total_price NUMERIC(10, 2) NOT NULL
);

-- 9. FareCode Table
CREATE TABLE FareCode (
    fare_code VARCHAR(5) PRIMARY KEY,
    description VARCHAR(100),
    price NUMERIC(10, 2) NOT NULL CHECK (price >= 0)
);

-- 10. Ticket Table
CREATE TABLE Ticket (
    ticket_id SERIAL PRIMARY KEY,
    booking_id INT REFERENCES Booking(booking_id) ON DELETE CASCADE,
    fare_code VARCHAR(5) REFERENCES FareCode(fare_code) ON DELETE RESTRICT,
    status VARCHAR(50) NOT NULL
);