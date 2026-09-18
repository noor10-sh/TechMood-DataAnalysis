select * from Customers;

select * from Sales;

select * from Products;

select Category as cat, UnitPrice as UP from Products;

select FirstName as fn , Age , JoinDate as JD from Customers;

select ProductID , Quantity  , TotalAmount from Sales where CustomerID>= 50;

select ProductName from Products where Category = 'Furniture';

select CustomerID from Sales where ProductID > 100 and Quantity = 5;

select ProductID , Quantity  , TotalAmount from Sales where CustomerID>= 50 or UnitPrice = 500;

select FirstName , LastName from Customers where Country in ('UAE' , 'Egypt');

select ProductName , UnitPrice , Category from Products where ProductID > 10 order by Category;

select ProductName , UnitPrice , Category from Products where ProductID > 10 order by Category desc;

select Customers.CustomerID  , Customers.FirstName , Customers.Country , Sales.Quantity, Products.ProductID 
, Products.ProductName  from Customers, Products , Sales 
where Customers.CustomerID = Sales.CustomerID and Products.ProductID = Sales.ProductID


