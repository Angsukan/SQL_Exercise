--Create database
CREATE DATABASE Doctors

--Create table
CREATE TABLE Doctor_Details (
doctor_id int PRIMARY KEY,
firstName varchar(50),
lastName varchar(50),
department varchar(50),
extensionNo varchar(50),
onResearch int
)

--Insert records
INSERT INTO Doctor_Details (doctor_id, firstName, lastName, department, extensionNo, onResearch)
VALUES	(1,'John', 'White', 'Eye, Ear and Throat','014569534',0),
		(2,'Claire', 'Brown', 'Eye, Ear and Throat','014569535',0),
		(3,'Gemma', 'Hayes', 'Eye, Ear and Throat','014569536',0),
		(4,'Cian', 'Minnehan', 'Eye, Ear and Throat','014569537',0),
		(5,'Declan', 'Moon', 'Eye, Ear and Throat','014569538',0)

--Create Patient_Details table
CREATE TABLE Patient_Details (
patient_id int PRIMARY KEY,
doctor_id int FOREIGN KEY REFERENCES Doctor_Details(doctor_id),
firstName varchar(50),
lastName varchar(50),
phoneNo varchar(50),
eMailAddress varchar(50)
)


--Insert records
INSERT INTO Patient_Details (patient_id, doctor_id, firstName, lastName, phoneNo, eMailAddress)
VALUES	(1,3,'Billy', 'McCarthy','01584754','bmaccarthy@hotmail.com'),
		(2,4,'Anne', 'Manning','01583853','amanning@hotmail.com'),
		(3,2,'Gerry', 'Newman','021434343','gnewman@hotmail.com'),
		(4,1,'Amy', 'Dineen','01303023','adineen@hotmail.com'),
		(5,5,'Ger', 'Walsh','021323232','gerwalsh@hotmail.com') 

--Display doctors who are patient facing

SELECT d.doctor_id, d.firstName, d.lastName, p.patient_id, p.firstName, p.lastName
FROM Doctor_Details AS d
JOIN Patient_Details AS p ON d.doctor_id = p.doctor_id
WHERE d.onResearch = 0
ORDER BY d.doctor_id



--Update the onResearch status
UPDATE Doctor_Details
SET onResearch = 1
WHERE doctor_id IN (3, 5)

--Display doctors who are patient facing again
SELECT d.doctor_id, d.firstName, d.lastName, d.onResearch, p.patient_id, p.firstName, p.lastName
FROM Doctor_Details AS d
JOIN Patient_Details AS p ON d.doctor_id = p.doctor_id
WHERE d.onResearch = 0




--Display doctor on research
SELECT d.doctor_id, d.firstName, d.lastName, d.onResearch, p.patient_id, p.firstName, p.lastName
FROM Doctor_Details AS d
JOIN Patient_Details AS p ON d.doctor_id = p.doctor_id
WHERE d.onResearch = 1
ORDER BY d.doctor_id