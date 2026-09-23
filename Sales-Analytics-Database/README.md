### Sales Analysis with SQL Views & Power BI — Case Study

📌 Case Study Overview

Scenario:
A company possesses a large database and constantly requires up-to-date sales reports.

The Challenge:
How to use SQL Queries and Views to prepare reliable, reusable data for Power BI while minimizing query redundancy and boosting performance?

🛠️ Task Solution & Explanation: Sales Analysis

To solve the practical task of analyzing sales data using SQL Views, the following methodology and steps were implemented:

1. Database Setup & Data Import

Created a database named WWI in SQL Server Management Studio (SSMS).

Handled flat-file and data type limitations (such as adjusting tinyint and smallint bounds to proper integer or decimal formats like DECIMAL(18,2) for price metrics to avoid conversion errors).

2. Writing the SQL Query & View

Instead of pulling raw, unaggregated tables directly into reporting tools, processing heavy lifting on the database side ensures optimal performance. The script creates a summarized SQL View (v_SalesSummary)
As show in inserted file

3. Validation

To ensure data accuracy, the view can be queried directly:

SELECT * FROM v_SalesSummary
ORDER BY TotalSales DESC;


🚀 Integrating with Power BI (Solving the Case Study)

Pre-aggregated Views: By encapsulating JOIN and GROUP BY logic inside v_SalesSummary, Power BI connects directly to a clean, ready-to-use dataset rather than crunching millions of raw rows.

Single Source of Truth: Centralizing business logic in SQL Server prevents redundant code across different reports and ensures consistent metrics organization-wide.

Performance Optimization: Utilizing either Import Mode with scheduled refreshes or DirectQuery directly on the indexed view ensures fast, scalable reporting without redundant queries hitting heavy source transaction tables.

