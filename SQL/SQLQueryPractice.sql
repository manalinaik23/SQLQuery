CREATE DATABASE ORG;

USE ORG;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY ,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT,
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, 14-02-20, 'HR'),
		(002, 'Niharika', 'Verma', 80000, 14-06-11, 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, 14-02-20 , 'HR'),
		(004, 'Amitabh', 'Singh', 500000, 14-02-20, 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, 14-06-11 , 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, 14-06-11 , 'Account'),
		(007, 'Satish', 'Kumar', 75000, 14-01-20 , 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, 14-04-11 , 'Admin');

Select * from Worker

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT,
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, 16-02-20),
		(002, 3000,16-06-11),
		(003, 4000,16-02-20),
		(001, 4500,16-02-20),
		(002, 3500,16-06-11);

CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager',2016-02-20),
 (002, 'Executive',2016-06-11),
 (008, 'Executive',2016-06-11),
 (005, 'Manager',2016-06-11),
 (004, 'Asst. Manager',2016-06-11),
 (007, 'Executive',2016-06-11),
 (006, 'Lead',2016-06-11),
 (003, 'Lead',2016-06-11);

 Select * from Title

 Select * from Worker 
 Where FIRST_NAME Not In('Vipul','Satish')

 Select * from Worker
 where DEPARTMENT = 'Admin'

 Select * from Worker
 where FIRST_NAME like '%a%'

 Select * from Worker
 where FIRST_NAME Like '%a'

 select * from Worker
 Where FIRST_NAME like '_____h'

 Select * from Worker
 Where SALARY Between 100000 AND 500000

 Select * from Worker
 where Year(Joining_date) = 2014 AND MONTH(JOINING_DATE) = 2

 Select count(*) from Worker
 Where DEPARTMENT = 'Admin'

 Select CONCAT(First_Name,'',Last_Name) as 'Names' , Salary from Worker
 Where Salary Between 50000 And 100000

 Select count(WORKER_ID),DEPARTMENT from Worker
 Group by DEPARTMENT
 Order by DEPARTMENT Desc

 Select w.FIRST_NAME,w.LAST_NAME,w.SALARY,w.JOINING_DATE,w.DEPARTMENT,t.WORKER_TITLE from Worker w ,Title t
 where w.WORKER_ID = t.WORKER_REF_ID
AND t.WORKER_TITLE='Manager'

Select * Into WorkerClone from Worker

Select * from WorkerClone

Select * Into WorkerClone2 from Worker Where 1 = 0

Select * from WorkerClone2

Select * from Worker
Minus
Select * from Title

Select GETDATE()

Select CURRENT_TIMESTAMP

Select top 4 FIRST_NAME from Worker

Select salary from Worker w1
Where 5 = (Select count(Distinct(Salary)) from Worker w2
where w2.SALARY > = w1.SALARY
)

Select w1.worker_Id, w1.First_Name,w1.Last_Name ,w1.Salary from Worker w1, Worker w2
where w1.SALARY = w2.SALARY AND w1.WORKER_ID != w2.WORKER_ID


Select Salary from Worker w1
Where 2 = (Select Count(Distinct(Salary)) from Worker w2
           where w2.SALARY >= w1.SALARY)

Select max(salary) from Worker
Where Salary Not In (select max(salary) from Worker)

Select * from Worker Union All Select * from WorkerClone

Select Department,Count(WORKER_ID) as 'no_Of_people' from worker 
Group by DEPARTMENT
Having Count(WORKER_ID) < 4

Select * from Worker 
where worker_id = (Select max(worker_id) from Worker)

Select * from Worker
Where WORKER_ID = (Select min(worker_id) from Worker)

Select First_NAME,Last_Name,Max(Salary) from Worker
Group by DEPARTMENT

Select First_Name , Salary from Worker 
Where Salary = (Select max(salary) from Worker)


