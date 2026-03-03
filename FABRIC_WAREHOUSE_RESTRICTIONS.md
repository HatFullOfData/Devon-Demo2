# Microsoft Fabric Warehouse Restrictions

This document outlines the key restrictions and limitations discovered when creating tables in Microsoft Fabric Warehouse.

## Summary of Restrictions

When working with Microsoft Fabric Warehouse, be aware of these important differences from traditional SQL Server:

### 1. No DEFAULT Keyword in CREATE TABLE
**Issue**: The `DEFAULT` keyword is not supported in CREATE TABLE statements.

❌ **Not Supported:**
```sql
CREATE TABLE dbo.Customer
(
    CreatedDate DATETIME2 DEFAULT GETDATE()
);
```

✅ **Solution:**
```sql
CREATE TABLE dbo.Customer
(
    CreatedDate DATETIME2(6)
);

-- Handle defaults in INSERT statements
INSERT INTO dbo.Customer (CreatedDate)
VALUES (GETDATE());
```

---

### 2. No NVARCHAR Data Type
**Issue**: Unicode data types (`NVARCHAR`, `NCHAR`) are not supported.

❌ **Not Supported:**
```sql
FirstName NVARCHAR(50)
```

✅ **Solution:**
```sql
FirstName VARCHAR(50)
```

**Note**: Use `VARCHAR` or `CHAR` with UTF-8 collation for text data.

---

### 3. DATETIME2 Requires Explicit Precision
**Issue**: `DATETIME2` must include a precision value between 0 and 6.

❌ **Not Supported:**
```sql
CreatedDate DATETIME2
```

✅ **Solution:**
```sql
CreatedDate DATETIME2(6)  -- Microsecond precision
-- or
CreatedDate DATETIME2(3)  -- Millisecond precision
```

**Precision Options**:
- `0` = seconds
- `3` = milliseconds
- `6` = microseconds (maximum)

---

## Supported Data Types

### Numeric Types
- `BIT`, `SMALLINT`, `INT`, `BIGINT`
- `DECIMAL`, `NUMERIC`
- `FLOAT`, `REAL`

### String Types
- `CHAR`, `VARCHAR` (max 16 MB for `VARCHAR(MAX)`)

### Date/Time Types
- `DATE`, `TIME(n)`, `DATETIME2(n)` (precision required)

### Binary Types
- `VARBINARY` (max 16 MB for `VARBINARY(MAX)`)

### Other
- `UNIQUEIDENTIFIER`

---

## Final Working Example

```sql
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
```

---

## Additional Resources
- [Microsoft Fabric Warehouse Data Types Documentation](https://learn.microsoft.com/en-us/fabric/data-warehouse/data-types)