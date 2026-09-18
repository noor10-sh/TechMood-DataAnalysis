# SalesAnalyticsDB — SQL Sales Analytics Assignment

## Database
Create a database name is (SalesAnalytics.DB) contains three tables is:
- Customers table.
- Products table.
- Sales table.
Each table have a different columns contains a values

## Tables and relationships
- `Customers`: customer master data. Primary key: `CustomerID`.
- `Products`: product master data. Primary key: `ProductID`.
- `Sales`: transaction fact table. Primary key: `SaleID`; foreign keys: `CustomerID` → `Customers.CustomerID` and `ProductID` → `Products.ProductID`.

The model follows a simple star-like design: one customer and one product can have many sales transactions. Foreign-key enforcement is enabled in the SQLite database.

## Required SQL concepts included
The SQL script creates the database tables and indexes, inserts the supplied data, and demonstrates `SELECT`, `WHERE`, `ORDER BY`, `IN`, `OR`, `AND`, and multi-table `INNER JOIN`.

## Case-study report query
The requested report is produced by joining `Sales` to `Customers` and `Products`:

```sql
SELECT c.CustomerName, p.ProductName, s.Quantity, s.SalesAmount, s.OrderDate
FROM Sales s
INNER JOIN Customers c ON s.CustomerID = c.CustomerID
INNER JOIN Products p ON s.ProductID = p.ProductID
ORDER BY s.SalesAmount DESC;
```

## Results
The highest-sales customer in the supplied data is **Sean Miller**, with approximately **$25,043.05** in sales. The highest-unit product in the top-products query is **Logitech P710e Mobile Speakerphone**, with **75 units sold** and approximately **$11,203.76** in sales.


