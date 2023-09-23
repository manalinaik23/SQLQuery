CREATE TABLE #PersonTable(Id Int , Name Varchar(20))

INSERT INTO #PersonTable Values(11,'Manali')

INSERT INTO #PersonTable Values(12,'Utkarsha')

Select * from #PersonTable


----------------
CREATE TABLE ##PersonGroup(Id int,name varchar(20))

SELECT * FROM ##PersonGroup

-----------------------stored procedure------------------
CREATE PROCEDURE sp_procedure1
AS
BEGIN
CREATE TABLE #PersonTable2(Id Int , Name Varchar(20))

INSERT INTO #PersonTable2 Values(11,'Manali')

INSERT INTO #PersonTable2 Values(12,'Utkarsha')

Select * from #PersonTable2

END

EXECUTE sp_procedure1






