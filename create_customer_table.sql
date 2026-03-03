CREATE TABLE dbo.Customer
(
    CustomerID INT NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(20),
    City VARCHAR(50),
    State VARCHAR(50),
    Country VARCHAR(50),
    CreatedDate DATETIME2(6)
);