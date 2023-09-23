
/**********************************Check Username and Password**************/
CREATE TABLE Login(
Username varchar(20),
Password varchar(20)
)

INSERT INTO Login(Username,Password) values('manali','12345'),('komal','komal123'),('utkarsha','utkarsha123')
GO

Select * from Login
GO


CREATE PROC sp_loginProcedure @Username varchar(20),@password varchar(20)
AS
BEGIN
  IF EXISTS (SELECT * from Login Where Username = @Username AND Password = @password)
    PRINT('User Exist')

  ELSE
    PRINT('User does not exist')
END

GO

EXEC sp_loginProcedure 'manali','123457'
GO

ALter PROC sp_LoginInsertUpdateUsers @Username varchar(20),@password varchar(20),@Message varchar(20) out
AS
BEGIN
   IF EXISTS (Select * from Login where Username = @Username)
	   BEGIN
	      UPDATE Login
		  SET Password = @password 
		  WHERE Username = @Username

		  SET @Message = 'Row updated';
	   END
   ELSE
       BEGIN
	   INSERT INTO LOGIN(Username,Password) VALUES(@Username,@password)
	   SET @Message = 'Row inserted';
	   END
END

GO

DECLARE
@MessageOutput varchar(20) 
EXEC sp_LoginInsertUpdateUsers 'manali','Secc@1234',@MessageOutput out
Print(@MessageOutput)

SELECT * FROM Login

sp_columns 'Login'
/**********************************End Check Username and Password**************/

/*********************Sum of Two Numbers**************/

CREATE PROC sp_SumOfTwoNumbers @FirstNumber int , @SecondNumber int
AS
DECLARE
@Sum Int
BEGIN
   SET @Sum = @FirstNumber + @SecondNumber ;
   PRINT('Sum is'+STR(@Sum));
END

GO

EXEC sp_SumOfTwoNumbers 45,25

/*********************PRINT 100 numbers******************************/
CREATE PROC sp_print1to100Numbers
AS
DECLARE
@sum int = 1
WHILE (@sum <= 100)
BEGIN
   PRINT (@Sum)
   SET @SUM = @SUM+1;
END

EXEC sp_print1to100Numbers

/****************************/

/***************Fetch recent record using stored procedure***********/

Select * from Students

CREATE PROC sp_fetchrecentrecordsStudents
AS
BEGIN
  SELECT top 1* FROM Students 
  ORDER BY enrollId desc 
END

EXEC sp_fetchrecentrecordsStudents

/***************Fetch recent record using stored procedure***********/