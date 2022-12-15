--Create database
CREATE DATABASE Music_Catalogue

--Create LP_Catalogue Table
CREATE TABLE LP_Catalogue (
groupName varchar(50),
albumName varchar(50) PRIMARY KEY,
yearReleased date, 
recordLabel varchar(50), 
myRating int, 
genre varchar(50) 
)

--Insert records into LP_Catalogue Table
INSERT INTO LP_Catalogue (groupName, albumName, yearReleased, recordLabel, myRating, genre)
VALUES	('Simple Minds', 'New World Music', '1982-06-01', 'WEA Records', 8, 'Pop'),
		('U2', 'Rattle and Hum', '1987-02-06 ', 'Geffen Records', 7, 'Pop'),
		('Rick Astley', 'Rick Astley–Greatest Hits', '1992-08-01', 'Warner Bros', 6, 'Pop'),
		('ACDC', 'Live In Rio', '1993-04-13', 'Warner Bros', 7, 'Rock')


--Create CD_Catalogue Table
CREATE TABLE CD_Catalogue (
groupName varchar(50),
albumName varchar(50) PRIMARY KEY,
yearReleased date, 
recordLabel varchar(50), 
myRating int, 
genre varchar(50) 
)

--Insert records into CD_Catalogue Table
INSERT INTO CD_Catalogue (groupName, albumName, yearReleased, recordLabel, myRating, genre)
VALUES	('Meat Loaf', 'Bat out of Hell', '1979-11-12', 'WEA Records', 5, 'Rock'),
		('U2', 'Discotheque', '2003-03-09', 'Warner Bros', 7, 'Pop'),
		('Oasis', 'Greatest Hits', '2012-03-24', 'Blue Records', 7, 'Pop'),
		('ACDC', 'Greatest Hits–Vol 2', '1999-09-09', 'Warner Bros', 6, 'Rock'),
		('U2', 'Rattle and Hum', '1987-02-06', 'Geffen Records', 7, 'Pop')


--Display both tables order output by album name
select *
from LP_Catalogue

UNION ALL

select *
from CD_Catalogue
ORDER BY albumName




--Display distinct records from both tables
select *
from LP_Catalogue

UNION

select *
from CD_Catalogue
ORDER BY albumName

--Display both tables where my rating >=7. Order by myRating
select *
from LP_Catalogue
WHERE myRating >= 7

UNION ALL

select *
from CD_Catalogue
WHERE myRating >= 7
ORDER BY myRating

--Display distinct rows from both tables where my rating >=7. Order by myRating
select *
from LP_Catalogue
WHERE myRating >= 7

UNION

select *
from CD_Catalogue
WHERE myRating >= 7
ORDER BY myRating

--Display distinct rows from both tables where year released > 1983. Order by yearReleased.
select *
from LP_Catalogue
WHERE yearReleased > '1983-12-31'

UNION

select *
from CD_Catalogue
WHERE yearReleased > '1983-12-31'
ORDER BY yearReleased

--Add new table named Wish_List
CREATE TABLE Wish_List (
groupName varchar(50), 
albumName varchar(50) PRIMARY KEY, 
yearReleased date, 
genre varchar(50) 
)

--Insert records
INSERT INTO Wish_List (groupName, albumName, yearReleased, genre)
VALUES	('Aztec Camera', 'Best of Aztec Camera', '1997-09-14', 'Pop'),
		('REM', 'Automatic for the People', '1998-05-13', 'Pop'),
		('U2', 'Rattle and Hum', '1987-02-06', 'Pop'),
		('Simple Minds', 'New World Music', '1982-06-01', 'Pop')

--Display album names in your wish list that you do not already own. Ordery by albumName
SELECT albumName
FROM Wish_List


EXCEPT

(select albumName
from LP_Catalogue
UNION
select albumName
from CD_Catalogue)
ORDER BY albumName

--Display album names in your wish list that you already own on CD. Ordery by albumName
SELECT albumName
FROM Wish_List

INTERSECT

select albumName
from CD_Catalogue
ORDER BY albumName

--Display album names in your wish list that you already own on LP. Ordery by albumName
SELECT albumName
FROM Wish_List

INTERSECT

select albumName
from LP_Catalogue
ORDER BY albumName

--Display duplicate albumName on CD and LP. Ordery by albumName
SELECT albumName
FROM CD_Catalogue

INTERSECT

select albumName
from LP_Catalogue
ORDER BY albumName

--Display albumName that you own on CD but not LP. Ordery by albumName

SELECT albumName
FROM CD_Catalogue

EXCEPT

select albumName
from LP_Catalogue
ORDER BY albumName
