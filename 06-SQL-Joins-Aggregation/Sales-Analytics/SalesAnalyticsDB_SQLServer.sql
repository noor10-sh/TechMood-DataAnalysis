
-- Build a SalesAnalyticsDB with Customers, Sales, Products tables

SET NOCOUNT ON;
IF DB_ID('SalesAnalyticsDB') IS NOT NULL
BEGIN
    PRINT 'Dropping existing SalesAnalyticsDB...';
    ALTER DATABASE SalesAnalyticsDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE SalesAnalyticsDB;
END
GO

PRINT 'Creating SalesAnalyticsDB...';
CREATE DATABASE SalesAnalyticsDB;
GO
USE SalesAnalyticsDB;
GO
-- ======= SCHEMA =======
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Gender CHAR(1),
    City NVARCHAR(50),
    Country NVARCHAR(50),
    Age INT,
    JoinDate DATE
);
GO
CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(100),
    Category NVARCHAR(50),
    UnitPrice DECIMAL(10,2),
    Cost DECIMAL(10,2)
);
GO

CREATE TABLE Sales (
    SaleID INT IDENTITY(1,1) PRIMARY KEY,
    SaleDate DATE,
    CustomerID INT,
    ProductID INT,
    StoreID INT,
    EmployeeID INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    TotalAmount AS (Quantity * UnitPrice) PERSISTED,
    CONSTRAINT FK_Sales_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    CONSTRAINT FK_Sales_Products FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
);
GO

-- ======= POPULATE BASE TABLES =======
PRINT 'Populating Customers (1,000)...';
;WITH Numbers AS (
    SELECT TOP (1000) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n FROM sys.objects a CROSS JOIN sys.objects b
)
INSERT INTO Customers (FirstName, LastName, Gender, City, Country, Age, JoinDate)
SELECT 
    'CustFirst' + RIGHT('0000' + CAST(n AS VARCHAR(5)),5),
    'CustLast' + RIGHT('0000' + CAST(n AS VARCHAR(5)),5),
    CASE WHEN n % 2 = 0 THEN 'M' ELSE 'F' END,
    CASE WHEN n % 6 = 0 THEN 'Cairo'
         WHEN n % 6 = 1 THEN 'Dubai'
         WHEN n % 6 = 2 THEN 'Riyadh'
         WHEN n % 6 = 3 THEN 'Amman'
         WHEN n % 6 = 4 THEN 'Alexandria'
         ELSE 'Jeddah' END,
    CASE WHEN n % 6 = 0 THEN 'Egypt'
         WHEN n % 6 = 1 THEN 'UAE'
         WHEN n % 6 = 2 THEN 'Saudi Arabia'
         WHEN n % 6 = 3 THEN 'Jordan'
         WHEN n % 6 = 4 THEN 'Egypt'
         ELSE 'Saudi Arabia' END,
    18 + (n % 50),
    DATEADD(DAY, -n, GETDATE())
FROM Numbers;
GO

PRINT 'Populating Products (200)...';
;WITH Numbers AS (
    SELECT TOP (200) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n FROM sys.objects a CROSS JOIN sys.objects b
)
INSERT INTO Products (ProductName, Category, UnitPrice, Cost)
SELECT 
    'Product_' + RIGHT('000' + CAST(n AS VARCHAR(4)),4),
    CASE WHEN n % 4 = 0 THEN 'Electronics'
         WHEN n % 4 = 1 THEN 'Furniture'
         WHEN n % 4 = 2 THEN 'Appliances'
         ELSE 'Accessories' END,
    CAST(ROUND(50 + (n * 7.5),2) AS DECIMAL(10,2)),
    CAST(ROUND(30 + (n * 5.25),2) AS DECIMAL(10,2))
FROM Numbers;
GO

-- ======= POPULATE Sales (10,000 rows) =======
PRINT 'Populating Sales (10,000)... this may take a moment depending on server.';
;WITH Numbers AS (
    SELECT TOP (10000) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n FROM sys.objects a CROSS JOIN sys.objects b CROSS JOIN sys.objects c
)
INSERT INTO Sales (SaleDate, CustomerID, ProductID, StoreID, EmployeeID, Quantity, UnitPrice)
SELECT
    DATEADD(DAY, -(ABS(CHECKSUM(NEWID())) % 730), CAST(GETDATE() AS DATE)), -- random date in last 2 years
    ABS(CHECKSUM(NEWID())) % 1000 + 1,                      -- random Customer (1..1000)
    ABS(CHECKSUM(NEWID())) % 200 + 1,                       -- random Product (1..200)
    ABS(CHECKSUM(NEWID())) % 10 + 1,                        -- random Store (1..10)
    ABS(CHECKSUM(NEWID())) % 100 + 1,                       -- random Employee (1..100)
    ABS(CHECKSUM(NEWID())) % 5 + 1,                         -- random Quantity (1..5)
    (SELECT TOP 1 UnitPrice FROM Products p WHERE p.ProductID = (ABS(CHECKSUM(NEWID())) % 200) + 1)
FROM Numbers;
GO

-- ======= QUICK CHECKS =======
PRINT 'Counts after population:';
SELECT 
 (SELECT COUNT(*) FROM Customers) AS Customers,
 (SELECT COUNT(*) FROM Products) AS Products,
 (SELECT COUNT(*) FROM Sales) AS Sales;

GO
PRINT 'Creating useful sample views...';
Go
CREATE VIEW vw_SalesSummary AS
SELECT s.SaleID, s.SaleDate, c.FirstName + ' ' + c.LastName AS CustomerName,
       p.ProductName, p.Category, s.Quantity, s.UnitPrice, s.TotalAmount
FROM Sales s
JOIN Customers c ON s.CustomerID = c.CustomerID
JOIN Products p ON s.ProductID = p.ProductID
GO

PRINT 'Script completed successfully.';
