
CREATE TABLE Car (
    Car_id VARCHAR(50) PRIMARY KEY,
    Car_model VARCHAR(50),
    Manufacturer VARCHAR(50),
    Year INT,
    Color VARCHAR(30),
    Rental_rate DECIMAL(10,2),
    Availability BIT
);


CREATE TABLE Customer (
    Customer_id VARCHAR(50) PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(50),
    Phone_number VARCHAR(20),
    Address VARCHAR(50)
);


CREATE TABLE Booking (
    Booking_id VARCHAR(50) PRIMARY KEY,
    Car_id VARCHAR(50) FOREIGN KEY REFERENCES Car(Car_id),
    Customer_id VARCHAR(50) FOREIGN KEY REFERENCES Customer(Customer_id),
    Rental_Start_Date DATE,
    Rent_End_Date DATE,
    Total_Amount MONEY
);


CREATE TABLE Payment (
    Payment_id VARCHAR(50) PRIMARY KEY,
    Booking_id VARCHAR(50) FOREIGN KEY REFERENCES Booking(Booking_id),
    Payment_Date DATE,
    Amount MONEY,
    Payment_Method VARCHAR(50)
);

CREATE TABLE Reservation (
    Reservation_id VARCHAR(50) PRIMARY KEY,
    Car_id VARCHAR(50) FOREIGN KEY REFERENCES Car(Car_id),
    Customer_id VARCHAR(50) FOREIGN KEY REFERENCES Customer(Customer_id),
    Reservation_Date DATE,
    Pickup_Date DATE,
    Return_Date DATE
);


CREATE TABLE Insurance (
    Insurance_id VARCHAR(50) PRIMARY KEY,
    Car_id VARCHAR(50) FOREIGN KEY REFERENCES Car(Car_id),
    Insurance_Provider VARCHAR(50),
    Policy_Number VARCHAR(30),
    Start_Date DATE,
    End_Date DATE
);


CREATE TABLE Maintenance (
    Maintenance_id VARCHAR(50) PRIMARY KEY,
    Car_id VARCHAR(50) FOREIGN KEY REFERENCES Car(Car_id),
    Maintenance_Date DATE,
    Description VARCHAR(200),
    Cost MONEY
);


CREATE TABLE Location (
    Location_id VARCHAR(50) PRIMARY KEY,
    Car_id VARCHAR(50) FOREIGN KEY REFERENCES Car(Car_id),
    Location_Name VARCHAR(50),
    Location VARCHAR(50),
    Address VARCHAR(50),
    Contact_Number VARCHAR(20)
);



INSERT INTO Car VALUES
('C001', 'Corolla', 'Toyota', 2020, 'White', 55.00, 1),
('C002', 'Civic', 'Honda', 2021, 'Black', 60.00, 1),
('C003', 'Model 3', 'Tesla', 2022, 'Red', 100.00, 1),
('C004', 'Camry', 'Toyota', 2019, 'Blue', 50.00, 1),
('C005', 'Mustang', 'Ford', 2023, 'Yellow', 120.00, 1);


INSERT INTO Customer VALUES
('CU001', 'John', 'Doe', 'john@example.com', '1234567890', '123 Main St'),
('CU002', 'Jane', 'Smith', 'jane@example.com', '2345678901', '456 Oak St'),
('CU003', 'Robert', 'Lee', 'robert@example.com', '3456789012', '789 Pine St'),
('CU004', 'Emily', 'Clark', 'emily@example.com', '4567890123', '101 Maple St'),
('CU005', 'Michael', 'Brown', 'michael@example.com', '5678901234', '202 Elm St');

INSERT INTO Booking VALUES
('B001', 'C001', 'CU001', '2025-10-01', '2025-10-05', 220.00),
('B002', 'C002', 'CU002', '2025-09-20', '2025-09-25', 300.00),
('B003', 'C003', 'CU003', '2025-10-03', '2025-10-07', 400.00),
('B004', 'C004', 'CU004', '2025-09-28', '2025-10-02', 200.00),
('B005', 'C005', 'CU005', '2025-10-01', '2025-10-06', 600.00);

INSERT INTO Payment VALUES
('P001', 'B001', '2025-10-01', 220.00, 'Credit Card'),
('P002', 'B002', '2025-09-20', 300.00, 'Cash'),
('P003', 'B003', '2025-10-03', 400.00, 'Online'),
('P004', 'B004', '2025-09-28', 200.00, 'Debit Card'),
('P005', 'B005', '2025-10-01', 600.00, 'Credit Card');


INSERT INTO Reservation VALUES
('R001', 'C001', 'CU001', '2025-09-28', '2025-10-01', '2025-10-05'),
('R002', 'C002', 'CU002', '2025-09-18', '2025-09-20', '2025-09-25'),
('R003', 'C003', 'CU003', '2025-10-01', '2025-10-03', '2025-10-07'),
('R004', 'C004', 'CU004', '2025-09-25', '2025-09-28', '2025-10-02'),
('R005', 'C005', 'CU005', '2025-09-29', '2025-10-01', '2025-10-06');


INSERT INTO Insurance VALUES
('I001', 'C001', 'AXA', 'POL12345', '2025-01-01', '2025-12-31'),
('I002', 'C002', 'Allianz', 'POL67890', '2025-03-01', '2026-02-28'),
('I003', 'C003', 'StateFarm', 'POL54321', '2025-06-01', '2026-05-31'),
('I004', 'C004', 'Progressive', 'POL98765', '2025-04-01', '2026-03-31'),
('I005', 'C005', 'Liberty', 'POL11223', '2025-02-01', '2026-01-31');


INSERT INTO Maintenance VALUES
('M001', 'C001', '2025-07-10', 'Oil Change', 80.00),
('M002', 'C002', '2025-08-05', 'Brake Check', 120.00),
('M003', 'C003', '2025-09-12', 'Battery Replacement', 300.00),
('M004', 'C004', '2025-06-20', 'Tire Rotation', 60.00),
('M005', 'C005', '2025-09-30', 'Engine Tune-Up', 250.00);

INSERT INTO Location VALUES
('L001', 'C001', 'Downtown Branch', 'New York', '123 Main St', '1234567890'),
('L002', 'C002', 'Airport Branch', 'Los Angeles', '456 Airport Rd', '2345678901'),
('L003', 'C003', 'City Center', 'Chicago', '789 Central Ave', '3456789012'),
('L004', 'C004', 'Suburban Branch', 'Houston', '101 Suburb St', '4567890123'),
('L005', 'C005', 'Harbor Branch', 'Miami', '202 Ocean Dr', '5678901234');



SELECT * FROM Car WHERE Availability = 1;

SELECT B.Booking_id, C.First_name, C.Last_name, B.Rental_Start_Date, B.Rent_End_Date, B.Total_Amount
FROM Booking B
JOIN Customer C ON B.Customer_id = C.Customer_id;


SELECT * FROM Payment WHERE Payment_Method = 'Credit Card';


SELECT M.Maintenance_id, Car.Car_model, M.Description, M.Cost
FROM Maintenance M
JOIN Car ON M.Car_id = Car.Car_id
WHERE Car.Manufacturer = 'Toyota';



UPDATE Car SET Rental_rate = 65.00 WHERE Car_id = 'C002';


UPDATE Customer SET Email = 'john.doe@newmail.com' WHERE Customer_id = 'CU001';


DELETE FROM Reservation WHERE Reservation_id = 'R005';

DELETE FROM Maintenance WHERE Maintenance_id = 'M004';
