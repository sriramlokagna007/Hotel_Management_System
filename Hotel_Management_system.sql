CREATE DATABASE Hotel_MAnagement_system;

USE Hotel_Management_system;

CREATE TABLE Hotel (
    hotel_code INT PRIMARY KEY,
    name VARCHAR(255),
    city VARCHAR(100),
    manager_id INT UNIQUE,  
    number_of_rooms INT,
    star_rating INT
);

CREATE TABLE Guest (
    guest_id INT PRIMARY KEY,
    name VARCHAR(255),
    loyalty_level VARCHAR(50)
);

CREATE TABLE Room (
    room_id INT PRIMARY KEY,
    hotel_code INT,
    room_number VARCHAR(10),
    type VARCHAR(50),
    price_per_night DECIMAL(10,2),
    availability_status VARCHAR(20),
    FOREIGN KEY (hotel_code) REFERENCES Hotel(hotel_code)
);

CREATE TABLE Booking (
    booking_id INT PRIMARY KEY,
    guest_id INT,
    room_id INT,
    check_in_date DATE,
    check_out_date DATE,
    total_bill DECIMAL(10,2),
    FOREIGN KEY (guest_id) REFERENCES Guest(guest_id),
    FOREIGN KEY (room_id) REFERENCES Room(room_id)
);

CREATE TABLE Roles (
    role_id INT PRIMARY KEY,
    role_name VARCHAR(100) UNIQUE
);

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(255),
    role VARCHAR(100),
    hotel_code INT,
    shift_details VARCHAR(100),
    FOREIGN KEY (hotel_code) REFERENCES Hotel(hotel_code)
);

CREATE TABLE Feedback (
    feedback_id INT PRIMARY KEY,
    booking_id INT UNIQUE,
    comments TEXT,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);

INSERT INTO Hotel (hotel_code, name, city, manager_id, number_of_rooms, star_rating) VALUES
(101, 'Grand Palace', 'Delhi', 201, 50, 5),
(102, 'Seaside Retreat', 'Mumbai', 202, 40, 4),
(103, 'Hilltop View', 'Shimla', 203, 30, 3),
(104, 'Urban Stay', 'Bangalore', 204, 60, 4),
(105, 'Desert Oasis', 'Jaipur', 205, 35, 4);

INSERT INTO Guest (guest_id, name, loyalty_level) VALUES
(301, 'Anjali Mehta', 'Gold'),
(302, 'Rohan Singh', 'Silver'),
(303, 'Priya Nair', 'Platinum'),
(304, 'Karan Malhotra', 'Bronze'),
(305, 'Sneha Desai', 'Gold');

INSERT INTO Room (room_id, hotel_code, room_number, type, price_per_night, availability_status) VALUES
(401, 101, '101A', 'Deluxe', 4500.00, 'Available'),
(402, 102, '102B', 'Suite', 6500.00, 'Occupied'),
(403, 103, '103C', 'Standard', 3000.00, 'Available'),
(404, 104, '104D', 'Executive', 5000.00, 'Available'),
(405, 105, '105E', 'Standard', 2800.00, 'Occupied');

INSERT INTO Booking (booking_id, guest_id, room_id, check_in_date, check_out_date, total_bill) VALUES
(501, 301, 401, '2025-06-01', '2025-06-03', 9000.00),
(502, 302, 402, '2025-06-05', '2025-06-06', 6500.00),
(503, 303, 403, '2025-06-07', '2025-06-10', 9000.00),
(504, 304, 404, '2025-06-08', '2025-06-09', 5000.00),
(505, 305, 405, '2025-06-01', '2025-06-04', 8400.00);

INSERT INTO Employee (employee_id, name, role, hotel_code, shift_details) VALUES
(201, 'Ravi Kapoor', 'Manager', 101, 'Day Shift'),
(202, 'Simran Kaur', 'Manager', 102, 'Night Shift'),
(203, 'Amit Verma', 'Manager', 103, 'Day Shift'),
(204, 'Neha Shah', 'Manager', 104, 'Night Shift'),
(205, 'Rajeev Reddy', 'Manager', 105, 'Day Shift');

INSERT INTO Roles (role_id, role_name) VALUES
(1, 'Manager'),
(2, 'Receptionist'),
(3, 'Housekeeping'),
(4, 'Chef'),
(5, 'Security');

INSERT INTO Feedback (feedback_id, booking_id, comments, rating) VALUES
(601, 501, 'Excellent stay and service.', 5),
(602, 502, 'Room was good but AC was noisy.', 3),
(603, 503, 'Loved the view and comfort.', 4),
(604, 504, 'Room service was slow.', 2),
(605, 505, 'Everything was perfect!', 5);


