CREATE DATABASE SUPERSALES;
use SUPERSALES;
select * from SuperStore_Sales;
select round(sum(Sales),4) as sales from SuperStore_Sales;
select sum(Profit) as Total_Profit from SuperStore_Sales;
select sum(Quantity) as Quantity from SuperStore_Sales;
select avg(DATEDIFF(DAY,Order_Date,Ship_Date)) as AVG_Delivery_days from SuperStore_Sales;
SELECT Ceiling(AVG(DATEDIFF(DAY, Order_Date, Ship_Date))) AS Avg_Delivery_Days
FROM SuperStore_Sales;
-- ceiling upper value
select 
		segment,
		sum(sales) as sales
from SuperStore_Sales
group by segment
SELECT 
    Segment,
    SUM(Sales) AS Segment_Sales,
    ROUND(SUM(Sales) * 100.0 / (SELECT SUM(Sales) FROM SuperStore_Sales), 2) AS Percentage_Sales
FROM SuperStore_Sales
GROUP BY Segment;
select 
		Region,
		sum(sales) as region_sales,
		Round(Sum(sales)*100.0/(select sum(sales) from SuperStore_Sales),2) as percentage_Sales
from SuperStore_Sales
group by Region;
select 
		Category,
		sum(sales) as category_sales
from SuperStore_Sales
group by Category;
--SELECT 
 --   Category,
   -- ROUND(SUM(Sales) / (SELECT SUM(Sales) FROM SuperStore_Sales), 4) AS Category_Percent
-- FROM SuperStore_Sales
-- GROUP BY Category;
SELECT top 3
    Category,
    CONCAT(ROUND(SUM(Sales) / 1000000.0, 2), 'M') AS Category_Sales_Millions
FROM SuperStore_Sales
GROUP BY Category
Order by sum(sales) desc;
select top 3
	  Sub_Category,
	  concat(round(sum(sales)/1000000.0,2),'M') as category_Sales_Millions
From SuperStore_Sales
Group by Sub_Category
order by sum(sales)DESC;
select top 3
	  Sub_Category,
	 sum(Sales)
From SuperStore_Sales
Group by Sub_Category
order by sum(sales)DESC;
select top 5
	  state,
	  sum(sales)
from SuperStore_Sales
group by state
order by sum(sales) desc;
select 
	  Ship_Mode,
	  sum(sales) as ship_mode_Sales
from SuperStore_Sales
group by Ship_Mode
order by sum(Sales)desc;
select 
	  Ship_Mode,
	  sum(sales) as ship_mode_Sales,
	  ROUND(SUM(Sales) / (SELECT SUM(Sales) FROM SuperStore_Sales), 2) AS Percentage_Sales
from SuperStore_Sales
group by Ship_Mode
order by sum(Sales)desc;
select
		Payment_Mode,
		sum(sales) as sales,
		round(sum(sales)/(select sum(sales) from SuperStore_Sales)*100,1) as percentage_sales
from SuperStore_Sales
group by Payment_Mode
order by sum(sales);
select top 5
     Customer_Name,
	 sum(sales) as sales
from SuperStore_Sales
group by Customer_Name
order by sum(sales)desc;
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(sales) AS total_sales,
    COUNT(*) AS number_of_orders
FROM SuperStore_Sales
GROUP BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY year, month;
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(sales) AS total_sales,
    COUNT(*) AS number_of_orders
FROM SuperStore_Sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY month asc, year;
select 
	  year(order_date) as year,
	  month(order_date) as month,
	  sum(Profit) as total_sales
from SuperStore_Sales
group by YEAR(Order_Date),month(Order_Date)
order by month asc , year;