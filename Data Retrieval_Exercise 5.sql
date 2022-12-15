--Create database named Pop Shop
CREATE DATABASE Pop_Shop

--Create Customers table
CREATE TABLE Customers (
ID int PRIMARY KEY,
First_Name varchar(50),
Last_Name varchar(50),
Address varchar(50),
Phone_No varchar(50)
)

--Insert values into Customer tables
INSERT INTO Customers (ID, First_Name, Last_Name, Address, Phone_No)
VALUES	(1, 'John', 'White', '12, The Moors Limerick', '0874565343'),
		(2, 'Gillian', 'Mangan', '36, The Crescent, Killarney', '0874587432'),
		(3, 'Frank', 'Murphy', '99, The Heights, Tralee', '0863456432')

--Create Catalogue table
CREATE TABLE Catalogue (
ID int PRIMARY KEY,
Item varchar(50),
Price int
)

--Insert values into Catalogue tables
INSERT INTO Catalogue (ID, Item, Price)
VALUES	(1, 'Greatest Hits - Rick Astley', 5),
		(2, 'Greatest Hits - Queen', 10 ),
		(3, 'Greatest Hits - Billy Ocean', 5),
		(4, 'Greatest Hits - U2', 10),
		(5, 'Greatest Hits – Wham!', 5)


--Create Orders table
CREATE TABLE Orders (
ID int PRIMARY KEY,
Order_Date date,
CustomerID int FOREIGN KEY REFERENCES Customers(ID)
)


--Insert values into Orders tables
INSERT INTO Orders (ID, Order_Date, CustomerID)
VALUES	(1, '2021/05/01', 1),
		(2, '2021/05/01', 2 ),
		(3, '2021/05/01', 3),
		(4, '2021/05/02', 2),
		(5, '2021/05/02', 3)


--Create Order_Items table
CREATE TABLE Order_Items (
OrderID int,
Order_Item_No int,
CatalogueID int FOREIGN KEY REFERENCES Catalogue(ID),
Quantity int,
PRIMARY KEY (OrderID, Order_Item_No)
)

--Insert values into Order_Items tables
INSERT INTO Order_Items (OrderID, Order_Item_No, CatalogueID, Quantity)
VALUES	(1, 1, 1, 1),
		(2, 1, 2, 2),
		(3, 1, 3, 1), 
		(3, 2, 4, 2),
		(4, 1, 5, 1),
		(4, 2, 3, 2),
		(5, 1, 3, 3)
 


 --Display records in the Catalogue table where the quantity ordered for that item in the Order_Items table is greater than one.
 
 SELECT *
 FROM Catalogue
 WHERE ID = ANY
	(SELECT CatalogueID
	FROM Order_Items
	WHERE Quantity > 1)


 --Only display records in the Catalogue table, if all the records in the Order_Items table have a quantity ordered of one.
 SELECT *
 FROM Catalogue
 WHERE ID = ALL
	(SELECT CatalogueID
	FROM Order_Items
	WHERE Quantity = 1)

