CREATE DATABASE TataNeu;

USE TataNeu;

--1. Write a query to calculate the total records in two tables?

SELECT 
(SELECT COUNT(*) FROM TATA_TB1)
+
(SELECT COUNT(*) FROM TATA_TB2) as total_records;

--2. Write a query to calculate the total unique count of customers?

SELECT COUNT(DISTINCT CustomerName) as DistinctCustomerCount FROM TATA_TB1

--3. Write a query to fetch the oldest order date and latest order date?

SELECT MIN(OrderDate) AS Oldestdate, MAX(OrderDate) as latestdate FROM TATA_TB1

--4. Write query to get unique years?
SELECT COUNT(DISTINCT YEAR(OrderDate)) as UniqueYears FROM TATA_TB1

--5. Write a query to get the no. of regions and display the region names?

SELECT COUNT(DISTINCT Region) AS TotalRegions
FROM TATA_TB1

SELECT Distinct Region FROM TATA_TB1

--6. Write a query to get the no. of countries and display the country names?
SELECT COUNT(DISTINCT Country) AS TotalCountries
FROM TATA_TB1

SELECT Distinct Country FROM TATA_TB1

--7. Write a query to get the no. of states and display the state names?
SELECT COUNT(DISTINCT State) AS TotalStates
FROM TATA_TB1

SELECT Distinct State FROM TATA_TB1

--8.Write a query to get the no. of cities and display the city names?
SELECT COUNT(DISTINCT City) AS TotalCities
FROM TATA_TB1

SELECT Distinct City FROM TATA_TB1

--9. Write a query to calculate the total count of products?

SELECT COUNT(Distinct ProductName) as ProductCount FROM TATA_TB2;

--10. Write a query to calculate total sales, total profit and total order quantity?

SELECT SUM(Sales)TotalSales, SUM(profit) TotalProfit, SUM(OrderQuantity) TotalQty FROM TATA_TB2;

--11. Write a query to calculate the total sales amount, total order quantity for each category. 
--Display the category, total sales, and total order qty and order by total sales from highest to lowest?

SELECT Category, SUM(Sales) TotalSales, SUM(OrderQuantity) TotalProfit
FROM TATA_TB2
GROUP BY Category
ORDER BY TotalSales Desc;

--12. Write a query to calculate the total profit amount for each category. 
--Display the category, total profit, and total order qty and order by total profit from highest to lowest?

SELECT Category, SUM(Profit) TotalProfit, SUM(OrderQuantity) TotalQty
FROM TATA_TB2
GROUP BY Category
ORDER BY TotalProfit Desc;

--13. Write a query to fetch the subcategories where total sales are greater than 100000?

SELECT subcategory
FROM TATA_TB2
GROUP BY subcategory
HAVING SUM(Sales) > 100000;

--14. Write a query to fetch the products where total profit is greater than 2500 
--and sort it based on profit from highest to lowest??

SELECT ProductName, SUM(Profit) TotalProfit
FROM TATA_TB2
GROUP BY ProductName
HAVING SUM(Profit) > 2500
ORDER BY SUM(Profit) Desc;

--15. Write a query to get the total sales and total profit for Office Supplies category?

SELECT Category, SUM(Sales) TotalSales, SUM(Profit) TotalProfit
FROM TATA_TB2
WHERE Category = 'Office Supplies'
GROUP BY Category

--16. Write a query to get the total sales and total profit for Furniture category and Tables, Bookcases sub-categories ?

SELECT Category,SubCategory, SUM(Sales) TotalSales, SUM(Profit) TotalProfit
FROM TATA_TB2
WHERE Category = 'Furniture'
AND SubCategory IN ('Tables','Bookcases')
GROUP BY Category, SubCategory;
 
 --17. Write a query to get the total sales and total profit for Technology category and the Accessories, Copiers, 
 --Phones sub-categories ?

SELECT Category,SubCategory, SUM(Sales) TotalSales, SUM(Profit) TotalProfit
FROM TATA_TB2
WHERE Category = 'Technology'
AND SubCategory IN ('Accessories','Copiers','Phones')
GROUP BY Category, SubCategory;

--18. Write a query to get total sales and total profit by Region, Segment and sort the sales from highest to lowest??

SELECT t.Region, t.Segment, SUM(t2.Sales) TotalSales, SUM(t2.Profit) TotalProfit
FROM TATA_TB1 t
JOIN TATA_TB2 t2 ON t.OrderID = t2.OrderID
GROUP BY t.Region, t.Segment
ORDER BY TotalSales DESC;

--19. Write a query to get total sales and total profit by Country, State and city and sort the sales
--from highest to lowest??

SELECT t.Country, t.State, t.City, SUM(t2.Sales) TotalSales, SUM(t2.Profit) TotalProfit
FROM TATA_TB1 t
JOIN TATA_TB2 t2 ON t.OrderID = t2.OrderID
GROUP BY t.Country, t.State, t.City
ORDER BY TotalSales DESC;

--20. Write a query to get total sales and total orderqty by CustomerName sort it by total sales from highest to lowest?

SELECT t.CustomerName, SUM(t2.Sales) TotalSales, SUM(t2.OrderQuantity) TotalOrderQty
FROM TATA_TB1 t
JOIN TATA_TB2 t2 ON t.OrderID = t2.OrderID
GROUP BY t.CustomerName
ORDER BY TotalSales DESC;

--21. Identify the top 5 products with the highest sales (by sales amount). 
--Show the product name, total sales, and total qty?

SELECT Top 5 ProductName, SUM(Sales) TotalSales, SUM(OrderQuantity) TotalOrderQty
FROM TATA_TB2
GROUP BY ProductName
ORDER BY TotalSales DESC;


--22. Write a query to get total sales by City having sales greater than 35000?

SELECT t.City, SUM(t2.Sales) TotalSales
FROM TATA_TB1 t
JOIN TATA_TB2 t2 ON t.OrderID = t2.OrderID
GROUP BY t.City
HAVING SUM(t2.Sales) > 35000;

--23. Write a query to get total sales by CustomerName having sales greater than 10000?

SELECT t.CustomerName, SUM(t2.Sales) TotalSales
FROM TATA_TB1 t
JOIN TATA_TB2 t2 ON t.OrderID = t2.OrderID
GROUP BY t.CustomerName
HAVING SUM(t2.Sales) > 10000;

--24. Write a query to get total sales and total profit by shipmode and 
--sort the sales in ascending order and profit in descending order?

SELECT t.ShipMode, SUM(t2.Sales) TotalSales, SUM(t2.Profit) TotalProfit
FROM TATA_TB1 t
JOIN TATA_TB2 t2 ON t.OrderID = t2.OrderID
GROUP BY t.ShipMode
ORDER BY TotalSales, TotalProfit DESC;

--25. Write a query to get total sales for North and central region?

SELECT t.Region, SUM(t2.Sales) TotalSales
FROM TATA_TB1 t
JOIN TATA_TB2 t2 ON t.OrderID = t2.OrderID
WHERE t.Region IN ('North','Central')
GROUP BY t.Region;

--26. Write a query to get total sales and total profit for Italy and Spain countries?

SELECT t.Country, SUM(t2.Sales) TotalSales, SUM(t2.Profit) TotalProfit
FROM TATA_TB1 t
JOIN TATA_TB2 t2 ON t.OrderID = t2.OrderID
WHERE t.Country IN ('Italy','Spain')
GROUP BY t.Country;

--27. Write a query to get the total sales and total profit for each year sort the sales from highest to lowest?

SELECT YEAR(t.OrderDate) Year, SUM(t2.Sales) TotalSales, SUM(t2.Profit) TotalProfit
FROM TATA_TB1 t
JOIN TATA_TB2 t2 ON t.OrderID = t2.OrderID
GROUP BY YEAR(t.OrderDate)
ORDER BY TotalSales DESC, TotalProfit DESC;

--28. Find the top 10 customers who spent the most across all transactions. 
--Display the customer name, total amount spent, and number of orders placed?

SELECT TOP 10 t.CustomerName, SUM(t2.Sales) TotalSales, SUM(t2.OrderQuantity) TotalOrderQty
FROM TATA_TB1 t
JOIN TATA_TB2 t2 ON t.OrderID = t2.OrderID
GROUP BY t.CustomerName
ORDER BY TotalSales DESC;

--29. Write a query to find which products are most preferred by customers based on the total sales. 
--Display customer name, favorite product (top 3 products per each customer), and total sales on that product?

SELECT * FROM (SELECT t.CustomerName, t2.ProductName, SUM(t2.Sales) TotalSales, DENSE_RANK() 
OVER(PARTITION BY t.CustomerName ORDER BY SUM(t2.Sales) DESC ) rnk
FROM TATA_TB1 t
JOIN TATA_TB2 t2 ON t.OrderID = t2.OrderID
GROUP BY t.CustomerName, t2.ProductName)z
WHERE rnk IN (1,2,3)

--30. Write a query to get 7th rank customer name based on total sales? Display customer name, sales amount and rank.

SELECT * FROM (SELECT t.CustomerName, SUM(t2.Sales) TotalSales, DENSE_RANK() OVER(ORDER BY SUM(t2.Sales) DESC) rnk
FROM TATA_TB1 t
JOIN TATA_TB2 t2 ON t.OrderID = t2.OrderID
GROUP BY t.CustomerName)z
WHERE rnk = 7;

--31. Write query to get total sales and total profit in years 2011 and 2013.
--Display year wise total sales and total profit?

SELECT YEAR(t.OrderDate) Year, SUM(t2.Sales) TotalSales, SUM(Profit) TotalProfit
FROM TATA_TB1 t
JOIN TATA_TB2 t2 ON t.OrderID = t2.OrderID
WHERE YEAR(t.OrderDate) IN (2011,2013)
GROUP BY YEAR(t.OrderDate)
ORDER BY TotalSales, TotalProfit;

--32. Write a query to get total sales, total profit and total order qty by country, state, category and sub-category
--and sort it from highest to lowest based on sales column?

SELECT t.Country, t.State, t2.Category, t2.SubCategory, SUM(t2.Sales) TotalSales, SUM(Profit) TotalProfit,
SUM(t2.OrderQuantity) TotalOrderQty
FROM TATA_TB1 t
JOIN TATA_TB2 t2 ON t.OrderID = t2.OrderID
GROUP BY t.Country, t.State, t2.Category, t2.SubCategory
ORDER BY TotalSales DESC;

--33. write a function to get the region sales dynamically, if we pass any region, that region sales should be displayed?

CREATE PROCEDURE sp_GetRegionSales
	@Region VARCHAR(50)
AS
BEGIN
	SELECT t.Region, SUM(t2.Sales) TotalSales
	FROM TATA_TB1 t
	JOIN TATA_TB2 t2 ON t.OrderID = t2.OrderID
	WHERE t.Region = @Region
	GROUP BY t.Region;
END;
GO

EXEC sp_GetRegionSales 'Central';

--34. write a function to get the country sales, profit dynamically, 
--if we pass any country, that country sales, profit should be displayed?

CREATE FUNCTION fn_GetCountrySalesProfit(@Country VARCHAR(50))
RETURNS TABLE
AS
RETURN
(
    SELECT 
        t.Country,
        SUM(t2.Sales)  AS TotalSales,
        SUM(t2.Profit) AS TotalProfit
    FROM TATA_TB1 t
    JOIN TATA_TB2 t2 ON t.OrderID = t2.OrderID
    WHERE LOWER(LTRIM(RTRIM(t.Country))) = LOWER(LTRIM(RTRIM(@Country)))
    GROUP BY t.Country
);
GO

SELECT * 
FROM fn_GetCountrySalesProfit('Italy');

--35. write a function to get the Category order quantity dynamically, if we pass any Category, 
--that Category order quantity should be displayed.?

CREATE PROCEDURE sp_GetCategoryQty 
    @Category VARCHAR(50)
AS
BEGIN
    SELECT t2.Category, SUM(t2.OrderQuantity) TotalQuantity
    FROM TATA_TB1 t
    JOIN TATA_TB2 t2 ON t.OrderID = t2.OrderID
    WHERE t2.Category = @Category
    GROUP BY t2.Category;
END;
GO

EXEC sp_GetCategoryQty 'Furniture'

--36. Write a function to get the City sales and profit dynamically,
--if we pass any city, that City sales and profit should be displayed?*

CREATE PROCEDURE sp_GetCitySales
    @City VARCHAR(20)
AS 
BEGIN
    SELECT t.City, SUM(t2.Sales) TotalSales, SUM(t2.Profit) TotalProfit
    FROM TATA_TB1 t
    JOIN TATA_TB2 t2 ON t.OrderID = t2.OrderID
    WHERE t.City = @City
    GROUP BY t.City;
END;
GO

EXEC sp_GetCitySales 'Stockholm'


