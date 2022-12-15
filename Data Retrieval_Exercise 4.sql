--Create database sunshine_holidays
CREATE DATABASE sunshine_holidays

--Create table sales
CREATE TABLE Sales (
ID int PRIMARY KEY,
Destination varchar(50),
Price int,
DateOfSale date,
SalesAgentFN varchar(50),
SalesAgentLN varchar(50)
)

--Insert records
INSERT INTO Sales (ID, Destination, Price, DateOfSale, SalesAgentFN, SalesAgentLN)
VALUES	(1, 'Majorca', 550, '2022/01/01', 'Brendan', 'Walsh'),
		(2, 'Corfu', 650, '2022/01/01', 'Sally', 'Field'),
		(3, 'Nice', 500, '2022/01/05', 'Frank', 'Walters'),
		(4, 'Ibiza', 700, '2022/01/07', 'Sally', 'Field'),
		(5, 'Torremolinos', 650, '2022/01/10', 'Frank', 'Walters'),
		(6, 'Corfu', 650, '2022/01/12', 'Frank', 'Walters'),
		(7, 'Lanzarote', 600, '2022/01/14', 'Ryan', 'Smith'),
		(8, 'Corfu', 500, '2022/01/15', 'Sally', 'Field'),
		(9, 'Palermo', 600, '2022/01/16', 'Frank', 'Walters'),
		(10, 'Majorca', 550, '2022/01/17', 'Ryan', 'Smith'),
		(11, 'Corfu', 650, '2022/01/17', 'Frank', 'Walters'),
		(12, 'Corfu', 650, '2022/01/17', 'Frank', 'Walters')

--Display the total sales made by each member of the sales team.
SELECT SalesAgentFN, SalesAgentLN, SUM(price) AS sum_sales
FROM Sales
GROUP BY SalesAgentFN, SalesAgentLN

--Display the average sales made by each member of the sales team.
SELECT SalesAgentFN, SalesAgentLN, AVG(price) AS avg_sales
FROM Sales
GROUP BY SalesAgentFN, SalesAgentLN


--Display the number of holidays old by each member of the sales team.
SELECT SalesAgentFN, SalesAgentLN, COUNT(*) AS n_sales
FROM Sales
GROUP BY SalesAgentFN, SalesAgentLN


--Display the most expensive holiday sold by each member of the sales team.
SELECT SalesAgentFN, SalesAgentLN, MAX(price) AS max_sales
FROM Sales
GROUP BY SalesAgentFN, SalesAgentLN


--Display the cheapest holiday sold by each member of the sales team.
SELECT SalesAgentFN, SalesAgentLN, MIN(price) AS min_sales
FROM Sales
GROUP BY SalesAgentFN, SalesAgentLN


--Display sales total greater than or equal to 1000. 
SELECT SalesAgentFN, SalesAgentLN, SUM(price) AS sum_sales
FROM Sales
GROUP BY SalesAgentFN, SalesAgentLN
HAVING SUM(price) >= 1000


--Display sales totals for the sales agents Sally, Frank and Ryan.
SELECT SalesAgentFN, SalesAgentLN, SUM(price) AS sum_sales
FROM Sales
WHERE SalesAgentFN IN ('Sally', 'Frank', 'Ryan')
GROUP BY SalesAgentFN, SalesAgentLN


--Display average sale amount greater than or equal to 600. 
SELECT SalesAgentFN, SalesAgentLN, AVG(price) AS avg_sales
FROM Sales
GROUP BY SalesAgentFN, SalesAgentLN
HAVING AVG(price) >= 600



--Display sale agent who have had three or more sales transactions.
SELECT SalesAgentFN, SalesAgentLN, COUNT(*) AS n_sales
FROM Sales
GROUP BY SalesAgentFN, SalesAgentLN
HAVING COUNT(*) >= 3

--Display sale agent who have sold two or more holidays in Corfu.
SELECT SalesAgentFN, SalesAgentLN, COUNT(Destination) AS corfu_sales
FROM Sales
WHERE Destination = 'Corfu'
GROUP BY SalesAgentFN, SalesAgentLN
HAVING COUNT(Destination) >= 2

--show the aggregate sales totals for each sales agent, from 07/01/2022 (inclusive) to 15/01/2022 (inclusive).
SELECT SalesAgentFN, SalesAgentLN, SUM(Price) AS sales_total
FROM Sales
WHERE DateOfSale BETWEEN '2022-01-07' AND '2022-01-15'
GROUP BY SalesAgentFN, SalesAgentLN


--Display Sally's sale total from 07/01/2022 (inclusive) to 15/01/2022 (inclusive)
SELECT SalesAgentFN, SalesAgentLN, SUM(Price) AS sales_total
FROM Sales
WHERE DateOfSale BETWEEN '2022-01-07' AND '2022-01-15'
AND SalesAgentFN = 'Sally' AND SalesAgentLN = 'Field'
GROUP BY SalesAgentFN, SalesAgentLN


