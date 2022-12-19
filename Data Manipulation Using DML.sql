--Create database named Football_Stickers_Collection
CREATE DATABASE Football_Stickers_Collection

--Create a table called Football_Stickers
CREATE TABLE Football_Stickers (
ID int PRIMARY KEY,
FirstName varchar(50),
LastName varchar(50),
Country varchar(50),
No_of_Caps_won int
)

INSERT INTO Football_Stickers (ID, FirstName, LastName, Country, No_of_Caps_won)
VALUES	(1, 'Michel', 'Platini', 'France', 86),
		(2, 'Diego', 'Maradona', 'Argentina', 76),
		(3, 'Jordi', 'Cruyff', 'Netherlands', 12),
		(4, 'Ossie',  'Ardiles', 'Argentina', 48),
		(5, 'Paul', 'McGrath', 'Republic of Ireland', 76),
		(6, 'John', 'Giles', 'Republic of Ireland', 60),
		(7, 'Pele', ' ', 'Brazil', 89),
		(8, 'Zinedine',  'Zidane', 'France', 76),
		(9, 'Liam', 'Brady', 'Republic of Ireland', 88),
		(10, 'Leo', 'Messi', 'Argentina', 95),
		(11, 'Craig', 'Bellamy', 'Wales', 10),
		(12, 'George', 'Best', 'Northern Ireland', 56),
		(13, 'Norman', 'Whiteside', 'Northern Ireland', 30)

--Update firstname of ID 3 to Johan
UPDATE Football_Stickers
SET FirstName = 'Johan'
WHERE ID = 3


--Delete record of ID 11
DELETE FROM Football_Stickers
WHERE ID = 11


--Delete records where the value for the Country field is Northern Ireland.
DELETE FROM Football_Stickers
WHERE Country = 'Northern Ireland'

--Insert new records into table
INSERT INTO Football_Stickers (ID, FirstName, LastName, Country, No_of_Caps_won)
VALUES	(11, 'Emilio', 'Butragueno', 'Spain', 67),
		(12, 'Hugo', 'Sanchez', 'Mexico', 78)


--Create Football_Stickers_Reserves table in advance
CREATE TABLE  Football_Stickers_Reserves (
ID int PRIMARY KEY,
FirstName varchar(50),
LastName varchar(50),
Country varchar(50),
No_of_Caps_won int
)



--Copy records into the created table
INSERT INTO Football_Stickers_Reserves
SELECT * FROM Football_Stickers





--Copy records where country is Republic of Ireland into new table without creating a table in advance.
SELECT * INTO Irish_Football_Legends FROM Football_Stickers
WHERE Country = 'Republic of Ireland'

DELETE FROM Irish_Football_Legends





