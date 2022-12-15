--Exercise1
--Create database named Quality_Software
CREATE DATABASE Quality_Software

--Create table Customers
CREATE TABLE Customers (
customerId int NOT NULL PRIMARY KEY, 
companyName varchar(50) NOT NULL, 
address1 varchar(50) NOT NULL,
address2 varchar(50) NOT NULL,
city varchar(50) NOT NULL,
country varchar(50) NOT NULL,
contactName varchar(50) NOT NULL,
contactEmail varchar(50) NOT NULL 
)

--Create table Contractors
CREATE TABLE Contractors (
contractorId int NOT NULL PRIMARY KEY, 
firstName varchar(50) NOT NULL,
lastName varchar(50) NOT NULL,
address1 varchar(50) NOT NULL,
address2 varchar(50) NOT NULL,
city varchar(50) NOT NULL,
country varchar(50) NOT NULL, 
contactPhone varchar(50) NOT NULL,
contactEmail varchar(50) NOT NULL
)

--Insert records into customers table
INSERT INTO customers (customerId, companyName, address1, address2, city, country, contactName, contactEmail)
VALUES (1, 'German Motors','22 Strabe Munchen', 'Munchen Klien', 'Munich', 'Deutscheland', 'Michael Schmidt',
		'michaelschmidt@gmmotors.com'),
		(2, 'Das Auto', '100 Munchen Business Park', 'Munchen 2323', 'Munich', 'Deutscheland', '4987545332', 
		'Philip Kroos@dasauto.com'),
		(3, 'Danone','15 Parkway House', 'Leicester Road', 'Leicester', 'England', '055455434', 'jamietaylor@danone.com'),
		(4, 'Nestle','13 Rue de Paris', 'Paris', 'Paris 201212', 'France','49875545454', 'michelegaulle@nestle.com');


--Insert records into contractors table
INSERT INTO Contractors (contractorId, firstName, lastName, address1, address2, city, country, contactPhone, contactEmail)
VALUES (1, 'Hans', 'Christian','12 Strabe Munchen', 'Munchen Klien', 'Munich', 'Deutscheland', '4987565656', 
		'hanschristian@hotmail.com'), 
		(2, 'Karl Heinz', 'Vakkel','10 New Forrest Strabe', 'Munchen Grob', 'Munich', 'Deutscheland', '4987549543',
		'karlheinz@hotmail.com'), 
		(3, 'Anne', 'Leicester','54 Emmerdale Road', 'Emmerdale Farm', 'Emmerdale', 'England', '055454545',
		 'anneleicester@hotmail.com'),
		(4, 'Peter', 'Rummeniege','13 Hamburg Way', 'Hamburg', 'Hamburg', 'Germany', '4987545454',
		 'peterrummeniege@hotmail.com');
--Update email for contractorID 2
UPDATE Contractors
SET contactEmail = 'karlheinz@gmail.com'
WHERE contractorid = 2;

--Update company name for customerID 3

UPDATE Customers
SET companyName = 'Group Danone'
WHERE customerId = 3;



--Delete contractorId 3
DELETE FROM Contractors
WHERE contractorId = 3;

SELECT *
FROM Contractors;

---------------------------------------------------------------------------------------------------------------------------------


--Exercise2
--Create database called theFizz
CREATE DATABASE theFizz;

--Create table called Employees
CREATE TABLE Employees (
ID int NOT NULL Primary Key,
firstName varchar(70),
lastName varchar(70),
department varchar(30),
hireDate date,
telephone varchar(15),
email varchar(100)
)


-- Add PPS NO column
ALTER TABLE Employees ADD
PPS_No varchar(10) NOT NULL;

--Create nonclustered index on lastName
CREATE NONCLUSTERED INDEX IX_Employees_lastName
ON Employees (lastName);

--Insert records into table
INSERT INTO (ID, firstName, lastName, department, hireDate, telephone, email)
VALUES (1, 'Kevin', 'Philips', 'IT', '2022/01/05', '013456456', 'kphillips@thefizz.com'),
		(2, 'Jane', 'Wilson', 'HR', '2022/01/0', '013456456', 'kphillips@thefizz.com')

SELECT *
FROM Employees


---------------------------------------------------------------------------------------------------------------------------------


--Exercise3
--Cretate database
CREATE DATABASE Employees;

--Create table Employee
CREATE TABLE Employee (
empID smallint PRIMARY KEY, 
fName varchar(50), 
lName varchar(50), 
age smallint, 
empAddress varchar(50), 
empEmail varchar(50),
empPhoneNo varchar(50),
salary money
)


--Insert records into the table
INSERT INTO Employee (empID, fName, lName, age, empAddress, empEmail, empPhoneNo, salary)
VALUES (1, 'Fred', 'Smith', 23, '12 High Street, Cork.', 'fsmith@dbconsultants.com', '0874527232', 34000),
		(2, 'Jane', 'Taylor', 29, '10 Low Street, Cork.', 'jtaylor@dbconsultants.com', '0876471233', 38000)


--Create a View named EMPLOYEES_VIEW, which selects all records from the Employee table.
CREATE VIEW EMPLOYEES_VIEW AS
SELECT *
FROM Employee

SELECT *
FROM EMPLOYEES_VIEW

---------------------------------------------------------------------------------------------------------------------------------


--Exercise4
CREATE DATABASE Chipper

--Create table named Meals and insert provided values.
CREATE TABLE Meals (
id int PRIMARY KEY,
name varchar(50),
price money,
size varchar(50)
)

--Insert 3 records into the table
INSERT INTO Meals (id, name, price, size)
VALUES	(1, 'Garlic Bread', 2.50, 'Large'),
		(2, 'Cheese Burger', 1.80, 'Large'),
		(3, 'Small Fries', 1.30, 'Small')


--Create a stored procedure showing records in Meals table and execute the stored procedure
CREATE PROCEDURE show_meals_details
AS
	SELECT * 
	FROM Meals

EXEC show_meals_details;

--Create another stored procedure that filter by size
CREATE PROCEDURE Show_Meals_by_Size
	@size varchar(50) AS
	SELECT *
	FROM Meals
	WHERE size = @size

EXEC Show_Meals_by_Size @size = 'Small'

