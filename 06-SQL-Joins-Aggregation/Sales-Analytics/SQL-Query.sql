select * from Customers;

select * from Products;

select * from Sales;

-- Connect 3 tabels by use single query inner join:
select C.FirstName , C.Country , P.ProductName, P.Category, S.Quantity , S.TotalAmount 
from Customers C inner join Sales S on C.CustomerID = S.CustomerID 
inner join Products P on P.ProductID = S.ProductID;

-- Execute left join :
select C.FirstName , C.City , S.SaleDate 
from Customers C left outer join Sales S on C.CustomerID = S.CustomerID ;

select P.ProductName , P.Category , S.SaleID from Products P left outer join Sales S on P.ProductID = S.CustomerID ;

-- Subquery:
select P.ProductName, P.UnitPrice , C.City from Products P , Customers C
where P.UnitPrice > All (select avg(P.UnitPrice) from Products P);

-- Aggregation function:
select sum(S.TotalAmount) as "Sum_TotalAmount" , count(S.SaleID) as "Count_Sales" , avg(S.Quantity) as "Avg_SaleQuantity" 
from Sales S , Customers C where S.CustomerID = C.CustomerID group by C.City;

-- Extract Total Amount:
select sum(S.TotalAmount) as "Sum_Total_Amount" , C.FirstName , P.ProductName , P.Category  from Sales S , 
Customers C , Products P where S.CustomerID = C.CustomerID and S.ProductID = P.ProductID 
group by C.FirstName , P.Category , P.ProductName ;


-- 5 Insights from Queries Result:

-- 1- There is a fluctuation in total sales as the unit price of the product increases. 
--This provides an opportunity for improvement to optimize the product's price in alignment with its total 
--sales performance

-- 2- The total amount in Cairo city scoure the highest amount from other cities so we can offering promotions 
--to increase sales in other cities or introduce advantages for customers in cairo city

-- 3- An increase in total sales revenue does not necessarily reflect higher sales volume. 
--This discrepancy often indicates that revenue growth is driven by higher unit prices rather than an increase in the
--actual number of units sold, highlighting the need to evaluate volume-based performance separately

-- 4- The aggregation reveals which specific product categories and individual products drive the highest revenue 
--share per customer, allowing the business to identify core revenue-generating drivers

-- 5- Grouping sales by individual customer names alongside product details highlights high-value customer segments, 
--showing which buyers contribute most significantly to total sales across specific categories

-- Challenge:
-- Write a Query that show the highest 5 product by total amount, then connect result with customers and categories 
-- By Join:

select C.CustomerID, C.FirstName, C.Age , C.City, C.Gender , P.Category from Customers C , Products P
select P.ProductName from Products P, Sales S where S.ProductID = P.ProductID and S.TotalAmount in(
select max(S.TotalAmount) from Sales S);

select S.TotalAmount , P.ProductName from Sales S , Products P where S.ProductID = P.ProductID
order by S.TotalAmount desc ;
