--Create database named City_Shoe_Repairs
CREATE DATABASE City_Shoe_Repairs

--Create a table named Shoe_Repairs
CREATE TABLE Shoe_Repairs (
ID int PRIMARY KEY,
item varchar(50),
price int,
repairDate date,
staffMemberFirstName varchar(50),
staffMemberLastName varchar(50)
)

--Insert records
INSERT INTO Shoe_Repairs (ID, item, price, repairDate, staffMemberFirstName,staffMemberLastName)
VALUES	(1, 'Dress Shoe', 80, '2022/01/01', 'Jenny', 'Wilson'),
		(2, 'Athletic Shoe', 25, '2022/01/01', 'Adam', 'Smith'),
		(3, 'Dress Shoe', 80, '2022/01/10', 'Frank', 'Murphy'),
		(4, 'Sandals', 35, '2022/02/12', 'Jenny', 'Wilson'),
		(5, 'Casual Shoe', 50, '2022/02/14', 'Franklin', 'Davis'),
		(6, 'Dress Shoe', 80, '2022/02/16', 'Frank', 'Murphy'),
		(7, 'Casual Shoe', 50, '2022/02/16', 'Adam', 'Smith'),
		(8, 'Casual Shoe', 50, '2022/02/16', 'Jenny', 'Wilson'),
		(9, 'Sandals', 35, '2022/02/18', 'Jenny', 'Wilson'),
		(10, 'Casual Shoe', 50, '2022/02/22', 'Frank', 'Murphy')

--Display all records. Sorted by repairDate and staffLastName 

SELECT * 
FROM Shoe_Repairs
ORDER BY repairDate, staffMemberLastName

--Display records for staff named Jenny
SELECT * 
FROM Shoe_Repairs
WHERE staffMemberFirstName = 'Jenny'

--Display records for staff name start with Frank
SELECT * 
FROM Shoe_Repairs
WHERE staffMemberFirstName LIKE 'Frank%'


--Display records between 01/01/2022 and 16/02/2022 (inclusive)
SELECT *
FROM Shoe_Repairs
WHERE repairDate BETWEEN '2022/01/01' AND '2022/02/16'



--Display staff name ‘Franklin’ or ‘Adam’
SELECT *
FROM Shoe_Repairs
WHERE staffMemberFirstName = 'Franklin' OR staffMemberFirstName = 'Adam'


--Display Item is ‘Dress Shoe’ and the value for Staff Member first name is ‘Jenny’
SELECT *
FROM Shoe_Repairs
WHERE item = 'Dress Shoe' AND staffMemberFirstName = 'Jenny'


--Excluder Item ‘Sandals’ from the result set
SELECT *
FROM Shoe_Repairs
WHERE item != 'Sandals'


--Display top 5 records from the table
SELECT TOP(5) *
FROM Shoe_Repairs


--Display staff name ‘Franklin’ or ‘Adam’ Do not use OR orerator
SELECT *
FROM Shoe_Repairs
WHERE staffMemberFirstName IN ('Franklin', 'Adam')


--Display price range between 35 (inclusive) and 50 (exclusive)
SELECT *
FROM Shoe_Repairs
WHERE price >= 35 and price < 50


--Display the sum of Jenny’s shoe repairs sales
SELECT staffMemberFirstName, SUM(price) as Total
FROM Shoe_Repairs
WHERE staffMemberFirstName = 'Jenny'
GROUP BY staffMemberFirstName


--Display staff first name who has sale total > 80
SELECT staffMemberFirstName, SUM(price) as Total
FROM Shoe_Repairs
GROUP BY staffMemberFirstName
HAVING SUM(price) > 80
	

--Display the maximum sale made by each member of the sales team.
SELECT staffMemberFirstName, MAX(price) as Max_sales
FROM Shoe_Repairs
GROUP BY staffMemberFirstName


--Display staff name and number of transactions that they have had. 

SELECT staffMemberFirstName, COUNT(price) as n_trans
FROM Shoe_Repairs
GROUP BY staffMemberFirstName


--Displays the average amount of shoe repair sales for each Staff Member in February
SELECT staffMemberFirstName, staffMemberLastName, AVG(price) AS avg_sales
FROM Shoe_Repairs
WHERE repairDate BETWEEN '2022-02-01' AND '2022-02-28'
GROUP BY staffMemberFirstName, staffMemberLastName



--Display the sum of shoe repair sales > 80 made by Staff Members in February.
SELECT staffMemberFirstName, staffMemberLastName, SUM(price) AS sum_sales
FROM Shoe_Repairs
WHERE repairDate BETWEEN '2022-02-01' AND '2022-02-28'
GROUP BY staffMemberFirstName, staffMemberLastName
HAVING SUM(price) > 80



select * 
from Shoe_Repairs
ORDER BY 4

select DISTINCT staffMemberFirstName
from Shoe_Repairs