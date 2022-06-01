--t1
--t1 allows t2 to read uncommited data and then t1 is rolled back.

Create Table Tea(
Id int,
[Name] varchar(30),
Quantity int)

Insert Tea values(1, 'Lipton', 100), (2, 'Sleepy Time', 100), (3, 'Teavana', 100)


Select * From Tea

Set Transaction Isolation Level Read UnCommitted
Begin Tran
Insert Into Tea values (4, 'Kombucha', 100)

Rollback


--Lost Updates:
Set Transaction Isolation Level Repeatable read
Begin Tran
Declare @qty int
Select @qty = Quantity From Tea where id = 2
Set @qty = @qty - 2
Waitfor delay '00:00:10'
Update Tea set Quantity = @qty Where id = 2
Commit

Select * From Tea

--non repeatable reads
Set Transaction Isolation Level Repeatable Read
Begin Tran
Select Quantity From Tea Where Id = 1
Waitfor Delay '00:00:10'
Select Quantity From Tea Where Id = 1
Commit


--Phantom read
Set Transaction Isolation Level Serializable
Begin Tran
Select * From Tea
Waitfor Delay '00:00:10'
Select * From Tea 
Commit

Drop table #temphero

Create proc spTempHero
as
begin
Create table #TempHero
(
id int,
Name varchar(30))
Exec spWhatever
end

Create Proc spWhatever
As
Begin
	insert #temphero select EmployeeID, FirstName From Employees
	Select * From #temphero
End

Exec spTempHero



Select *
From 