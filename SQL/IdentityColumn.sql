------------ create Identity Column----------------
CREATE TABLE Student(
Id int Identity(100,1) Primary key,
Name Varchar(20)
)

INSERT INTO Student Values('Utkarsha') /* It will automatically increase Id by 1*/

DELETE FROM Student 
Where Id = 100

/*This below command is used to set the Identity_Insert so that we can use deleted existing ID's e.g. 100 .
For that we need to pass Column names and column values both 
*/
SET Identity_Insert Student ON


INSERT INTO Student(Id,Name) Values(100,'Sangeeta')

/*This below command is used to reset the Identity_Insert so that we can use deleted existing ID's e.g. 100 .
after this command we can pass only column value  
*/

SET Identity_Insert Student OFF

INSERT INTO Student Values('Seema')

DELETE FROM Student

/*below command is used when we delete all rows from table and we want to use deleted Identity column value as well then
we can reseed the table identity column ID to 0 */
DBCC CheckIdent('Student',RESEED,0)
SELECT * from Student