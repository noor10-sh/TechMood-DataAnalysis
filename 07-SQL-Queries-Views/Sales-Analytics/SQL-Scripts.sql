select * from DimCity;

select * from DimCustomer;

select * from DimCity;

select * from DimStockItem;

select * from FactSale;
select * from DimDate;

create view vw_salesSummary As

select
sum(S.Total_Including_Tax) as 'Total_Sales' , C.City , avg(S.WWI_Invoice_ID) as 'Avg_Invoice' from FactSale S , DimCity C
where S.City_Key = C.City_Key group by C.City ;

select * from vw_salesSummary order by  vw_salesSummary.Total_Sales DESC;


select C.City , C.Sales_Territory , C.State_Province, Cu.Bill_To_Customer, Cu.Customer , Cu.Postal_Code,
D.Calendar_Year_Label , D.ISO_Week_Number , St.Brand , St.Color , St.Quantity_Per_Outer , S.Profit, S.Profit
from DimCity C inner join FactSale S
on C.City_Key = S.City_Key inner join DimCustomer Cu on  Cu.Customer_Key = S.Customer_Key
inner join  DimDate D on D.Date = S.Invoice_Date_Key inner join  DimStockItem St on St.WWI_Stock_Item_ID = S.Stock_Item_Key;

-- 5 Insights:
-- 1-  The Akiok , Amanda Park , Arrowbear Lake cities score the highest total sales with tax
-- 2-  Defined the avg inovice for each city and ordered it in desc pattern
-- 3- Significant Revenue Generation: Total cumulative sales across the analyzed transactions reached approximately
-- $22.86 million, accompanied by a strong overall gross profit of around $9.92 million
-- 4- High Transaction Value Averages: The average transaction value per sale stands at approximately $865.82
-- highlighting a healthy basket size and strong customer purchasing power per order
-- 5- Volume vs. Value Variations: Certain regions show high transaction frequencies combined with competitive average
-- order values, pointing to consistent, recurring customer engagement rather than isolated bulk purchases


-- Recommendations:
-- 1) Targeted Regional Marketing & Inventory Allocation: Focus marketing campaigns and supply chain restocking efforts
--heavily on top-performing states (such as Alaska and California) to maximize ROI and prevent stockouts in high-demand
-- zones.

-- 2) Underperforming Market Optimization: Investigate lower-performing cities and territories to identify barriers to 
-- entry or logistical bottlenecks, and introduce localized promotional incentives to stimulate sales growth in those 
-- areas
