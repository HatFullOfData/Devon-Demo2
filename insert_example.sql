-- Example INSERT with GETDATE() for CreatedDate
-- Since DEFAULT is not supported in Fabric Warehouse, handle it in the INSERT statement

INSERT INTO dbo.Customer (CustomerID, FirstName, LastName, Email, Phone, City, State, Country, CreatedDate)
VALUES (1, 'John', 'Doe', 'john.doe@example.com', '555-1234', 'Seattle', 'WA', 'USA', GETDATE());

-- Example with multiple rows
INSERT INTO dbo.Customer (CustomerID, FirstName, LastName, Email, Phone, City, State, Country, CreatedDate)
VALUES 
    (2, 'Jane', 'Smith', 'jane.smith@example.com', '555-5678', 'Portland', 'OR', 'USA', GETDATE()),
    (3, 'Bob', 'Johnson', 'bob.johnson@example.com', '555-9012', 'Austin', 'TX', 'USA', GETDATE());