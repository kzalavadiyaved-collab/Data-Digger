CREATE DATABASE DataDigger;
USE DataDigger;

-- 1. CUSTOMERS TABLE

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Address VARCHAR(200) NOT NULL
);

INSERT INTO Customers VALUES
(1, 'Alice', 'alice@gmail.com', 'Ahmedabad'),
(2, 'Rahul', 'rahul@gmail.com', 'Surat'),
(3, 'Priya', 'priya@gmail.com', 'Vadodara'),
(4, 'Amit', 'amit@gmail.com', 'Rajkot'),
(5, 'Neha', 'neha@gmail.com', 'Gandhinagar'),
(6, 'Karan', 'karan@gmail.com', 'Mumbai');

-- Display all customers
SELECT * FROM Customers;

-- Update customer address
UPDATE Customers
SET Address = 'Nikol, Ahmedabad'
WHERE CustomerID = 1;

-- Display Alice
SELECT *
FROM Customers
WHERE Name = 'Alice';

-- Delete customer example
-- DELETE FROM Customers
-- WHERE CustomerID = 6;


-- 2. PRODUCTS TABLE


CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL CHECK (Price > 0),
    Stock INT NOT NULL CHECK (Stock >= 0)
);

INSERT INTO Products VALUES
(101, 'Laptop', 55000, 10),
(102, 'Mobile Phone', 14000, 20),
(103, 'Headphones', 1200, 30),
(104, 'Keyboard', 800, 25),
(105, 'Smart Watch', 2000, 15),
(106, 'Mouse', 500, 0);

-- Products sorted by price
SELECT *
FROM Products
ORDER BY Price DESC;

-- Update product price
UPDATE Products
SET Price = 13500
WHERE ProductID = 102;

-- Products between ₹500 and ₹2000
SELECT *
FROM Products
WHERE Price BETWEEN 500 AND 2000;

-- Most expensive product
SELECT MAX(Price) AS Most_Expensive
FROM Products;

-- Cheapest product
SELECT MIN(Price) AS Cheapest
FROM Products;

-- Delete product if out of stock
-- DELETE FROM Products
-- WHERE ProductID = 106
-- AND Stock = 0;


-- 3. ORDERS TABLE


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL CHECK (TotalAmount >= 0),

    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID)
);

INSERT INTO Orders VALUES
(201, 1, CURRENT_DATE, 55000),
(202, 2, DATE_SUB(CURRENT_DATE, INTERVAL 5 DAY), 14000),
(203, 3, DATE_SUB(CURRENT_DATE, INTERVAL 10 DAY), 2000),
(204, 4, DATE_SUB(CURRENT_DATE, INTERVAL 20 DAY), 1200),
(205, 5, DATE_SUB(CURRENT_DATE, INTERVAL 40 DAY), 800);

-- Orders of customer 1
SELECT *
FROM Orders
WHERE CustomerID = 1;

-- Update order amount
UPDATE Orders
SET TotalAmount = 55000
WHERE OrderID = 201;

-- Orders from last 30 days
SELECT *
FROM Orders
WHERE OrderDate >= DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY);

-- Highest order
SELECT MAX(TotalAmount) AS Highest_Order
FROM Orders;

-- Lowest order
SELECT MIN(TotalAmount) AS Lowest_Order
FROM Orders;

-- Average order
SELECT AVG(TotalAmount) AS Average_Order
FROM Orders;

-- Delete order example
-- DELETE FROM Orders
-- WHERE OrderID = 205;


-- 4. ORDER DETAILS TABLE


CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    SubTotal DECIMAL(10,2) NOT NULL CHECK (SubTotal >= 0),

    FOREIGN KEY (OrderID)
    REFERENCES Orders(OrderID),

    FOREIGN KEY (ProductID)
    REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails VALUES
(301, 201, 101, 1, 55000),
(302, 202, 102, 1, 14000),
(303, 203, 105, 1, 2000),
(304, 204, 103, 1, 1200),
(305, 205, 104, 1, 800);

-- Order details for order 201
SELECT *
FROM OrderDetails
WHERE OrderID = 201;

-- Total revenue
SELECT SUM(SubTotal) AS Total_Revenue
FROM OrderDetails;

-- Top 3 most ordered products
SELECT
    ProductID,
    SUM(Quantity) AS Total_Quantity
FROM OrderDetails
GROUP BY ProductID
ORDER BY Total_Quantity DESC
LIMIT 3;

-- Count product sales
SELECT
    ProductID,
    COUNT(*) AS Times_Sold
FROM OrderDetails
WHERE ProductID = 102
GROUP BY ProductID;



