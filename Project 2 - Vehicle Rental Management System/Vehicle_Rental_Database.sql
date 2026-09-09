-- =========================================================
-- Vehicle Rental Management System
-- Database schema, sample data, and query solutions
-- Engine: MySQL
-- =========================================================

-- ============================
-- 1. DATABASE
-- ============================
CREATE DATABASE vehicle_booking;
USE vehicle_booking;

-- ============================
-- 2. TABLE: vehicle
-- ============================
CREATE TABLE vehicle (
    VID           INT PRIMARY KEY,
    Vehicle_Name  VARCHAR(20) NOT NULL,
    Vehicle_Type  VARCHAR(20) CHECK (Vehicle_Type IN ('Car','Bike')),
    Brand         VARCHAR(50),
    Model_Year    YEAR,
    Status        VARCHAR(100) CHECK (Status IN ('Available','Rented','Maintenance')),
    Fuel_Type     VARCHAR(50) CHECK (Fuel_Type IN ('Petrol','Diesel','Electric')),
    Rent_per_day  DECIMAL(10,2)
);

INSERT INTO vehicle (VID, Vehicle_Name, Vehicle_Type, Brand, Model_Year, Status, Fuel_Type, Rent_per_day) VALUES
(101, 'Swift', 'Car', 'Maruti Suzuki', 2022, 'Available', 'Petrol', 1200.00),
(102, 'Creta', 'Car', 'Hyundai', 2023, 'Rented', 'Diesel', 1800.00),
(103, 'Nexon', 'Car', 'Tata', 2021, 'Available', 'Electric', 1600.00),
(104, 'City', 'Car', 'Honda', 2024, 'Maintenance', 'Petrol', 2000.00),
(105, 'Venue', 'Car', 'Hyundai', 2022, 'Available', 'Petrol', 1500.00),
(106, 'Thar', 'Car', 'Mahindra', 2023, 'Rented', 'Diesel', 2500.00),
(107, 'Baleno', 'Car', 'Maruti Suzuki', 2021, 'Available', 'Petrol', 1300.00),
(108, 'Fortuner', 'Car', 'Toyota', 2024, 'Available', 'Diesel', 3500.00),
(109, 'Activa 6G', 'Bike', 'Honda', 2022, 'Available', 'Petrol', 500.00),
(110, 'Pulsar 150', 'Bike', 'Bajaj', 2021, 'Rented', 'Petrol', 600.00),
(111, 'Apache RTR', 'Bike', 'TVS', 2023, 'Available', 'Petrol', 650.00),
(112, 'Classic 350', 'Bike', 'Royal Enfield', 2024, 'Rented', 'Petrol', 900.00),
(113, 'Splendor Plus', 'Bike', 'Hero', 2022, 'Available', 'Petrol', 450.00),
(114, 'iQube', 'Bike', 'TVS', 2023, 'Available', 'Electric', 700.00),
(115, 'FZ V3', 'Bike', 'Yamaha', 2021, 'Maintenance', 'Petrol', 600.00);

-- ============================
-- 3. TABLE: customer
-- ============================
CREATE TABLE customer (
    CID            INT PRIMARY KEY,
    Customer_Name  VARCHAR(100) NOT NULL,
    Phone_No       VARCHAR(15) NOT NULL,
    Age            INT,
    License_No     VARCHAR(50),
    Address        VARCHAR(100)
);

INSERT INTO customer (CID, Customer_Name, Phone_No, Age, License_No, Address) VALUES
(1, 'Rahul Sharma', '9876543210', 28, 'DL1234567890', 'Lucknow'),
(2, 'Priya Verma', '9876501234', 25, 'DL2345678901', 'Delhi'),
(3, 'Amit Singh', '9123456780', 32, 'UP3456789012', 'Kanpur'),
(4, 'Sneha Gupta', '9988776655', 27, 'UP4567890123', 'Lucknow'),
(5, 'Arjun Mehta', '9012345678', 35, 'MH5678901234', 'Mumbai'),
(6, 'Neha Kapoor', '8899776655', 24, 'UP6789012345', 'Agra'),
(7, 'Rohan Malhotra', '9765432101', 30, 'DL7890123456', 'Delhi'),
(8, 'Ananya Mishra', '9345678120', 26, 'UP8901234567', 'Varanasi'),
(9, 'Karan Joshi', '9090909090', 38, 'RJ9012345678', 'Jaipur'),
(10, 'Pooja Tiwari', '9456781230', 29, 'UP1122334455', 'Lucknow'),
(11, 'Vikas Yadav', '8765432109', 33, 'UP2233445566', 'Prayagraj'),
(12, 'Ishita Roy', '9898989898', 23, 'WB3344556677', 'Kolkata'),
(13, 'Manish Agarwal', '9654321098', 41, 'UP4455667788', 'Noida'),
(14, 'Kavya Sharma', '8796543210', 31, 'DL5566778899', 'Delhi'),
(15, 'Aditya Srivastava', '9321654780', 27, 'UP6677889900', 'Lucknow');

-- ============================
-- 4. TABLE: booking
-- ============================
CREATE TABLE booking (
    BID             INT PRIMARY KEY,
    CID             INT,
    VID             INT,
    Booking_Date    DATE,
    Start_Date      DATE,
    End_Date        DATE,
    Payment_Status  VARCHAR(20) CHECK (Payment_Status IN ('Paid','Pending','Partial')),
    Bill_Amount     DECIMAL(10,2),
    FOREIGN KEY (CID) REFERENCES customer(CID),
    FOREIGN KEY (VID) REFERENCES vehicle(VID)
);

INSERT INTO booking (BID, CID, VID, Booking_Date, Start_Date, End_Date, Payment_Status, Bill_Amount) VALUES
(1001, 1, 101, '2026-08-01', '2026-08-05', '2026-08-08', 'Paid', 3600.00),
(1002, 2, 102, '2026-08-02', '2026-08-10', '2026-08-13', 'Partial', 5400.00),
(1003, 3, 109, '2026-08-03', '2026-08-06', '2026-08-08', 'Paid', 1000.00),
(1004, 4, 105, '2026-08-04', '2026-08-12', '2026-08-15', 'Pending', 4500.00),
(1005, 5, 106, '2026-08-05', '2026-08-15', '2026-08-18', 'Paid', 7500.00),
(1006, 6, 110, '2026-08-06', '2026-08-16', '2026-08-19', 'Partial', 1800.00),
(1007, 7, 103, '2026-08-07', '2026-08-20', '2026-08-23', 'Paid', 4800.00),
(1008, 8, 111, '2026-08-08', '2026-08-21', '2026-08-23', 'Pending', 1300.00),
(1009, 9, 108, '2026-08-09', '2026-08-25', '2026-08-28', 'Paid', 10500.00),
(1010, 10, 112, '2026-08-10', '2026-08-26', '2026-08-29', 'Partial', 2700.00),
(1011, 11, 104, '2026-08-11', '2026-09-01', '2026-09-04', 'Paid', 6000.00),
(1012, 12, 113, '2026-08-12', '2026-09-02', '2026-09-04', 'Pending', 900.00),
(1013, 13, 107, '2026-08-13', '2026-09-05', '2026-09-08', 'Paid', 3900.00),
(1014, 14, 114, '2026-08-14', '2026-09-06', '2026-09-09', 'Partial', 2100.00),
(1015, 15, 115, '2026-08-15', '2026-09-10', '2026-09-13', 'Pending', 1800.00),
(1016, 1, 102, '2026-08-20', '2026-09-15', '2026-09-18', 'Paid', 5400.00),
(1017, 3, 101, '2026-08-21', '2026-09-20', '2026-09-22', 'Pending', 2400.00),
(1018, 5, 109, '2026-08-22', '2026-09-21', '2026-09-24', 'Paid', 1500.00),
(1019, 7, 105, '2026-08-23', '2026-09-25', '2026-09-28', 'Partial', 4500.00),
(1020, 10, 112, '2026-08-24', '2026-09-29', '2026-10-02', 'Paid', 2700.00);

-- Sanity check
SELECT * FROM vehicle;
SELECT * FROM customer;
SELECT * FROM booking;

-- =========================================================
-- SECTION A — Filtering with WHERE
-- =========================================================

-- Q1. Display all vehicles that are currently Available.
SELECT VID, Vehicle_Name
FROM vehicle
WHERE Status = 'Available';

-- Q2. Display all Cars with their vehicle name, brand and rent per day.
SELECT Vehicle_Name, Vehicle_Type, Brand, Rent_per_day
FROM vehicle
WHERE Vehicle_Type = 'Car';

-- Q3. Display all Bikes whose rent per day is greater than 1,000.
SELECT Vehicle_Name, Vehicle_Type, Rent_per_day
FROM vehicle
WHERE Vehicle_Type = 'Bike' AND Rent_per_day > 1000;

-- Q4. Display customers whose age is between 25 and 40.
SELECT CID, Customer_Name, Age
FROM customer
WHERE Age BETWEEN 25 AND 40;

-- Q5. Display all bookings where the payment status is Pending.
SELECT *
FROM booking
WHERE Payment_Status = 'Pending';

-- =========================================================
-- SECTION B — Joining Tables
-- =========================================================

-- Q6. Display the customer name, vehicle name, start date and end date for every booking.
SELECT c.Customer_Name, v.Vehicle_Name, b.Start_Date, b.End_Date
FROM customer c
INNER JOIN booking b ON c.CID = b.CID
INNER JOIN vehicle v ON b.VID = v.VID;

-- Q7. Display customer name, phone number, vehicle name and bill amount for all bookings.
SELECT Customer_Name, Phone_No, Vehicle_Name, Bill_Amount
FROM customer c
INNER JOIN booking b ON c.CID = b.CID
INNER JOIN vehicle v ON b.VID = v.VID;

-- Q8. Display all bookings for Cars along with customer details.
SELECT b.CID, c.Customer_Name, c.Phone_No, v.Vehicle_Name, v.Vehicle_Type, c.Address
FROM vehicle v
INNER JOIN booking b ON v.VID = b.VID
INNER JOIN customer c ON b.CID = c.CID
WHERE v.Vehicle_Type = 'Car';

-- Q9. Display all customers who have made at least one booking.
SELECT DISTINCT c.CID, c.Customer_Name
FROM customer c
INNER JOIN booking b ON c.CID = b.CID;

-- Q10. Display all vehicles that have been booked at least once.
SELECT DISTINCT b.VID, v.Vehicle_Name, v.Vehicle_Type
FROM vehicle v
INNER JOIN booking b ON v.VID = b.VID;

-- =========================================================
-- SECTION C — Aggregate Functions
-- =========================================================

-- Q11. Find the total rental revenue generated by the company.
SELECT SUM(Bill_Amount) AS Total_Rental_Revenue
FROM booking;

-- Q12. Find the average booking bill.
SELECT AVG(Bill_Amount) AS Average_Booking_Bill
FROM booking;

-- Q13. Find the highest booking bill.
SELECT MAX(Bill_Amount) AS Highest_Booking_Bill
FROM booking;

-- Q14. Find the total number of bookings.
SELECT COUNT(BID) AS Num_of_Bookings
FROM booking;

-- Q15. Find the total revenue generated from Cars and Bikes separately.
SELECT Vehicle_Type, SUM(Bill_Amount) AS Total_Revenue
FROM vehicle v
INNER JOIN booking b ON v.VID = b.VID
GROUP BY Vehicle_Type;

-- =========================================================
-- SECTION D — GROUP BY / HAVING
-- =========================================================

-- Q16. Find the number of bookings made by each customer.
SELECT c.CID, c.Customer_Name, COUNT(b.BID) AS Number_of_Bookings
FROM customer c
INNER JOIN booking b ON c.CID = b.CID
GROUP BY b.CID, c.Customer_Name;

-- Q17. Find the total amount spent by each customer, descending by spend.
SELECT c.Customer_Name, SUM(b.Bill_Amount) AS Total_Amount
FROM customer c
INNER JOIN booking b ON c.CID = b.CID
GROUP BY Customer_Name
ORDER BY SUM(Bill_Amount) DESC;

-- Q18. Find the number of bookings for each vehicle.
SELECT v.VID, v.Vehicle_Name, COUNT(b.BID) AS Number_of_Bookings
FROM vehicle v
INNER JOIN booking b ON v.VID = b.VID
GROUP BY v.VID, v.Vehicle_Name;

-- Q19. Find vehicle types having more than 3 bookings.
SELECT Vehicle_Type, COUNT(Vehicle_Type) AS No_of_Bookings
FROM vehicle v
INNER JOIN booking b ON v.VID = b.VID
GROUP BY Vehicle_Type
HAVING COUNT(Vehicle_Type) > 3;

-- =========================================================
-- SECTION E — Final Business Question
-- =========================================================

-- Q20. Find the top 3 customers who have generated the highest rental revenue.
SELECT c.Customer_Name, COUNT(b.BID) AS Number_of_Bookings, SUM(b.Bill_Amount) AS Total_Spending
FROM customer c
INNER JOIN booking b ON c.CID = b.CID
GROUP BY c.Customer_Name
ORDER BY SUM(b.Bill_Amount) DESC
LIMIT 3;
