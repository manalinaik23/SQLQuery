-- Create database-->
Create database testDb

--Drop Database -->
Drop Database testDb
Drop Database IF Exists testDb
Drop Database testDb,testDb1

--Select Database(to work with the database we need to select the Database) -->
Use testDb
Create table Test(
months Date not null
)

--Rename Database name-->
Alter Database testDb Modify Name= testDatabase

--Show Database ----->
Select * from Sys.databases

-- Create Table ------------>
Use testDatabase
CREATE TABLE Customers(
ID INT Not Null,
NAME VARCHAR(20) NOT NULL,
SALARY DECIMAL(18,5) NOT NULL,
ADDRESS CHAR(25),
PRIMARY KEY(ID)

)

Select * from Customers

-- Create Table from existing Table -->
Use testDatabase
CREATE TABLE SALARY AS
select ID FROM Customers

---Returns table from current database-->
SELECT * from Sys.tables

-----Rename Table
EXEC sp_rename 'Customers','Worker' 

Select * from Worker

-- Truncate Table-------->
Truncate Table Worker

-------Alter Table------>
Alter Table Worker ADD OCCUPATION VARCHAR(20)

ALTER TABLE Worker DROP Column OCCUPATION

DROP TABLE Worker

INSERT INTO Worker(ID,NAME,SALARY,ADDRESS) VALUES(3,'Utkarhsa',70000,'Vasai')

DELETE FROM Worker
where name='Manali'


Select * INTO Customers
from Worker

Select * from Customers ORDER BY Name

INSERT INTO Customers(ID,NAME,SALARY,ADDRESS)VALUES(1,'Manali',5000000,'Mumbai')

Select CONCAT(NAME,' ',ADDRESS) as Details from Customers

Update Customers 
SET ADDRESS = 'Nagar'
WHERE NAME='Sumit'

Delete from Customers
Where Name = 'sangeeta'

DROP Table Customers

CREATE TABLE CUSTOMERS (
   ID INT NOT NULL,
   NAME VARCHAR (20) NOT NULL,
   AGE INT NOT NULL,
   ADDRESS CHAR (25),
   SALARY DECIMAL (18, 2),       
   PRIMARY KEY (ID)
);

INSERT INTO CUSTOMERS VALUES(1,'Manali',28,'Borivali',70000)
insert INTO CUSTOMERS VALUES(8, 'Ramesh', 32, 'Ahmedabad', 2000.00);
insert INTO CUSTOMERS VALUES(2, 'Khilan', 25, 'Delhi', 1500.00);
insert INTO CUSTOMERS VALUES(3, 'kaushik', 23, 'Kota', 2000.00);
insert INTO CUSTOMERS VALUES(4, 'Chaitali', 25, 'Mumbai', 6500.00);
insert INTO CUSTOMERS VALUES(5, 'Hardik', 27, 'Bhopal', 8500.00);
insert INTO CUSTOMERS VALUES(6, 'Komal', 22, 'MP', 4500.00);
insert INTO CUSTOMERS VALUES(7, 'Muffy', 24, 'Indore', 10000.00);

Select * from CUSTOMERS
Where salary >= 2000 AND salary <= 8500


UPDATE CUSTOMERS
SET Age = 25
WHERE Name = 'Komal'

Select * from CUSTOMERS
where Name Not In('Manali','Muffy')

Select * from Customers
Where Name In('Manali')


Select * from CUSTOMERS
where Name Like 'M___%'

Select * from CUSTOMERS
where Name Like '_____N%'

Select Top 4 * from CUSTOMERS
Where Age >=25 Order By Age

Select Distinct Age From CUSTOMERS Order By Age

Select Age,Name From CUSTOMERS Order By Age DESC,Name Desc

Select  AVG(salary) from Customers 
Group By Salary

SELECT AGE, SUM(SALARY) as avg_salary
FROM CUSTOMERS
GROUP BY age

Select COUNT(NAME) as no_of_people ,Age from Customers
GROUP BY Age

Select Age, Max(salary) as maximum_Salary from Customers
GROUP BY Age
Order BY Max(salary) DESC

Select Age , AVG(Salary) from CUSTOMERS
Group By Age
Having AVG(Salary) > 8000

Select * from Customers 
where Name Like 'k%' AND Salary > 4000 

CREATE TABLE CARS (
   MANUFACTURER VARCHAR(20) NOT NULL,
   TYPE VARCHAR(20) NOT NULL,
   TRANSMISSION VARCHAR(20) NOT NULL,
   COLOR VARCHAR(20),
   IS_RED BIT
);

INSERT INTO CARS VALUES ('Toyota', 'SUV', 'Automatic', 'Red', 1);
INSERT INTO CARS VALUES ('Honda', 'Hatchback', 'Manual', 'Grey', 0);
INSERT INTO CARS VALUES ('Mercedes', 'Sedan', 'Automatic', 'Red', 1);
INSERT INTO CARS VALUES ('Tata', 'Truck', 'Manual', 'Blue', 0);
INSERT INTO CARS VALUES ('Ford', 'Minivan', 'Manual', 'Red', 1);

Select * from CARS

Select * ,
CASE IS_RED
	WHEN 0 THEN 'FALSE'
	WHEN 1 THEN 'TRUE'
END AS IS_RED_Boolean
FROM CARS


Select * from CUSTOMERS

Select * from CUSTOMERS
Where SALARY <>
All(Select salary from CUSTOMERS Where AGE = 25)

Select * from CUSTOMERS
Where SALARY <>
ANY(Select salary from CUSTOMERS Where AGE = 24)

Select * from CUSTOMERS
Where Salary > 
ANY(Select Salary from CUSTOMERS
Where Age = 32)


Select Distinct AGE from CUSTOMERS
Where Salary <
ANY(Select AVG(Salary) from CUSTOMERS)

Select * from CUSTOMERS
WHERE AGE =
ANY(Select AGE from CUSTOMERS
Where NAME LIKE 'K_%')

SELECT * FROM CUSTOMERS
WHERE SALARY <
ALL(SELECT AVG(SALARY) from CUSTOMERS)

DROP TABLE CARS
create table CARS(
   ID INT NOT NULL, 
   NAME VARCHAR(20) NOT NULL, 
   PRICE INT NOT NULL, 
   PRIMARY KEY(ID)
);

insert INTO CARS VALUES(2, 'Maruti Swift', 450000);
insert INTO CARS VALUES(4, 'VOLVO', 2250000);
insert INTO CARS VALUES(7, 'Toyota', 2400000);

SELECT * FROM CUSTOMERS
WHERE EXISTS(
SELECT * FROM CARS 
WHERE PRICE > 2000000 AND CARS.ID = CUSTOMERS.ID)

UPDATE CUSTOMERS
SET NAME = 'Kushal'
WHERE EXISTS(
SELECT CARS.ID FROM CARS
WHERE CARS.ID = CUSTOMERS.ID) 


SELECT * FROM CUSTOMERS
WHERE NOT EXISTS(
SELECT * FROM CARS 
WHERE CARS.ID = CUSTOMERS.ID)


DELETE FROM CUSTOMERS
WHERE EXISTS (
SELECT * FROM CARS 
WHERE CARS.ID = CUSTOMERS.ID AND PRICE = 2250000)

SELECT NAME,AGE ,
CASE 
WHEN AGE < 25 THEN 'GEN X'
WHEN AGE >= 25 THEN 'GEN Y'
END AS GENERATION
FROM CUSTOMERS

SELECT * FROM CUSTOMERS
WHERE NOT(SALARY > 2000)

SELECT * FROM CUSTOMERS
WHERE ADDRESS NOT LIKE 'A_%'

SELECT * FROM CUSTOMERS
WHERE AGE NOT IN(22,24,28)

SELECT * FROM CUSTOMERS
WHERE SALARY >=2000 AND ADDRESS <> 'Bhopal'

 CREATE TABLE Fruit  
(  
   ID   INT              NOT NULL,
   NAME VARCHAR (20)     NOT NULL,
   ADDRESS  CHAR (25),
   PRICE   DECIMAL (18, 2),       
   PRIMARY KEY (ID)
);

INSERT INTO Fruit (ID,NAME,ADDRESS,PRICE)
VALUES (1, 'Apple', 'Shimla', 2000.00 );

INSERT INTO Fruit (ID,NAME,ADDRESS,PRICE)
VALUES (2, 'Mango',NULL, 3000.00 );

INSERT INTO Fruit (ID,NAME,ADDRESS,PRICE)
VALUES (3, 'Orange',NULL, 4000.00 );

INSERT INTO Fruit (ID,NAME,ADDRESS,PRICE)
VALUES (4, 'Banana', 'AP',NULL);

INSERT INTO Fruit (ID,NAME,ADDRESS,PRICE)
VALUES (5, 'JackFruit', 'Ooty',NULL);

Select * from Fruit

Select * from FRUIT 
WHERE PRICE IS NULL

UPDATE FRUIT
SET PRICE = 100
WHERE PRICE IS NULL

DELETE FROM FRUIT 
WHERE ADDRESS IS NULL

--------------------------------------- Join--------------------
DROP Table CUSTOMERS
CREATE TABLE CUSTOMERS (
   ID INT NOT NULL,
   NAME VARCHAR (20) NOT NULL,
   AGE INT NOT NULL,
   ADDRESS CHAR (25),
   SALARY DECIMAL (18, 2),       
   PRIMARY KEY (ID)
);

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (1, 'Ramesh', 32, 'Ahmedabad', 2000.00 );

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (2, 'Khilan', 25, 'Delhi', 1500.00 );

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (3, 'kaushik', 23, 'Kota', 2000.00 );

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (4, 'Chaitali', 25, 'Mumbai', 6500.00 );

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (5, 'Hardik', 27, 'Bhopal', 8500.00 );

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (6, 'Komal', 22, 'MP', 4500.00 );

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (7, 'Muffy', 24, 'Indore', 10000.00 );



CREATE TABLE ORDERS (
   OID INT NOT NULL,
   DATE VARCHAR (20) NOT NULL,
   CUSTOMER_ID INT NOT NULL,
   AMOUNT DECIMAL (18, 2),
);

INSERT INTO ORDERS (OID, DATE, CUSTOMER_ID, AMOUNT)
VALUES (102, '2009-10-08 00:00:00', 3, 3000.00);

INSERT INTO ORDERS (OID, DATE, CUSTOMER_ID, AMOUNT)
VALUES (100, '2009-10-08 00:00:00', 3, 1500.00);

INSERT INTO ORDERS (OID, DATE, CUSTOMER_ID, AMOUNT)
VALUES (101, '2009-11-20 00:00:00', 2, 1560.00);

INSERT INTO ORDERS (OID, DATE, CUSTOMER_ID, AMOUNT)
VALUES (103, '2008-05-20 00:00:00', 4, 2060.00);



Select Name ,Age ,Salary,DATE 
From CUSTOMERS c
Inner join Orders o
ON c.ID = o.CUSTOMER_ID
WHERE Salary = 2000



CREATE TABLE EMPLOYEE (
   EID INT NOT NULL,
   EMPLOYEE_NAME VARCHAR (30) NOT NULL,
   SALES_MADE DECIMAL (20)
);

INSERT INTO EMPLOYEE VALUES (102, 'SARIKA', 4500);
INSERT INTO EMPLOYEE VALUES (100, 'ALEKHYA', 3623);
INSERT INTO EMPLOYEE VALUES (101, 'REVATHI', 1291);
INSERT INTO EMPLOYEE VALUES (103, 'VIVEK', 3426);

Select * From CUSTOMERS
Select * from Orders
Select * from Employee

Select Name ,Age,Salary ,o.DATE,e.EMPLOYEE_NAME From
Customers c
Left Join Orders o
On c.ID = o.CUSTOMER_ID
Left Join Employee e
on o.OID= e.EID
where o.AMOUNT > 2000


Select ID,Name,Amount,DATE FROM CUSTOMERS c
RIGHT JOIN ORDERS o
ON c.ID = o.CUSTOMER_ID


Select Name ,Age,Salary ,o.DATE,e.EMPLOYEE_NAME From
Customers c
Right Join Orders o
On c.ID = o.CUSTOMER_ID
Right Join Employee e
on o.OID= e.EID
WHERE o.AMOUNT >1000

SELECT ID,NAME,DATE FROM CUSTOMERS 
CROSS JOIN ORDERS 
CROSS JOIN EMPLOYEE


SELECT ID,NAME,AMOUNT,DATE FROM CUSTOMERS C
FULL JOIN ORDERS o
ON C.ID = o.CUSTOMER_ID
