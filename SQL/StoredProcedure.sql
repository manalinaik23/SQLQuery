Create Database sampleStoredProcedure

Use sampleStoredProcedure

CREATE TABLE Student(
ID Int,
Name varchar(20),
Age Int
);

Alter table Student Add Staff_Id Int



Insert into Student values(1,'Ram',15)
Insert into Student values(2,'Shyam',17)
Insert into Student values(3,'Sheela',20)
Insert into Student values(4,'Layla',24)
Insert into Student values(5,'Kishan',25)
Insert into Student values(6,'Utkarsha',21)

Truncate table Student

Update Student
Set Staff_Id = 4
Where Age = 15 OR Age = 20 OR Age = 25

Select * from Student

Delete from Student
-------------------------- Stored Procedure-----------------------------------

CREATE PROCEDURE sp_fetchStudents
AS
BEGIN
Select Name,Age from Student
END

Drop PROCEDURE sp_fetchStudents
EXEC sp_fetchStudents

---------------------- Stored Procedure by passing parameter -------------------
CREATE PROCEDURE spGetStudentByNameandStaffId
@Name varchar(20),
@Staff_Id int
AS
BEGIN
	Select Name ,Age,Staff_Id from Student
	Where Name = @Name AND Staff_Id = @Staff_Id
END

DROP Procedure sp_getStudentByNameandStaffId

EXECUTE sp_getStudentByNameandStaffId 'Kishan',4

EXECUTE sp_getStudentByNameandStaffId @Staff_Id = 4,@Name = 'Kishan' 
----------------------------------------------------------------------
-----------------------------------------------------------------------
CREATE PROCEDURE spGetStudentByAgeandStaffId
@Age int,
@Staff_Id int
AS
BEGIN
	Select Name ,Age,Staff_Id from Student
	Where Age > @Age AND Staff_Id = @Staff_Id
END


ALTER PROCEDURE spGetStudentByAgeandStaffId
@Age int,
@Staff_Id int
With Encryption
AS
BEGIN
	Select Name ,Age,Staff_Id from Student
	Where Age > @Age AND Staff_Id = @Staff_Id
	Order By Name
END


Drop Procedure sp_getStudentByAgeandStaffId

EXEC spGetStudentByAgeandStaffId 15 , 2

-------------------------------------------------------------------------
sp_helpText spGetStudentByAgeandStaffId
-----------------------------------------------
------------------- Stored procedure with out parameter-----------------

Select * from Student

CREATE PROCEDURE spGetStudentbyStaffID
@staff_id Int ,
@StudentCount Int Out
AS
BEGIN
    Select @StudentCount = COUNT(ID) from Student
	Where Staff_Id = @staff_id
END


***********
DECLARE @totalCount Int
EXECUTE spGetStudentbyStaffID 2,@totalCount out
PRINT @totalCount
*****************
DECLARE @totalCount Int
EXECUTE spGetStudentbyStaffID @StudentCount = @totalCount out , @staff_id = 2
PRINT @totalCount

------------------------------------------------------

CREATE TABLE Employee(
E_ID int Identity(1,1),
E_Name varchar(20),
E_gender varchar(20),
E_Age int
)

INsert into Employee (E_Name,E_gender,E_Age) values('Seema','female',24),('Pradeep','male',23),
('Jaya','female',25),('Shushant','male',20),('Rekha','female',22)

Select * from Employee

CREATE PROC getEmployeeNameByID
@Id int,
@Name varchar(20) out
AS
BEGIN
   Select @Name = E_Name from Employee
   Where E_ID = @Id
END


DECLARE @Name varchar(20)
EXEC getEmployeeNameByID 4,@Name out
PRINT @Name

----------------------------- Return statement in stored procedure------------
Alter PROC sp_getEmpNameByID2
@id int
AS
BEGIN
   return( Select E_Id from Employee 
   Where E_Id = @id)
END

DECLARE @EId int
EXEC @EId = sp_getEmpNameByID2 2
PRINT @EID
*************
Alter PROC sp_getEmpNameByID2
@id int
AS
BEGIN
   return( Select E_Name from Employee 
   Where E_Id = @id)
END

DECLARE @EName varchar
EXEC @EName = sp_getEmpNameByID2 2
PRINT @EName