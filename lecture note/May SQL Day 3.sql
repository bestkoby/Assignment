--Day 3 

--Recursive CTE: cte will call itself again and again until it thinks it can stop
--and return something

Select EmployeeID, FirstName, ReportsTo, DENSE_RANK() Over(Order By ReportsTo Desc) [level]
From Employees
--Order By ReportsTo Desc

--Employee Hiearchy
--level 1 Andrew
--Level 2 Nancy, Janet, Margret, steven, Laura
--Level 3: Michael, Robert, Anne

With empHiearchyCte
As(
Select EmployeeId, FirstName, ReportsTo, 1 [level]
From Employees 
Where ReportsTo is Null
Union All
Select e.EmployeeId, e.FirstName, e.ReportsTo, cte.[level] + 1
From Employees e Join empHiearchyCte cte On e.ReportsTo = cte.EmployeeId)
Select * From empHiearchyCte

--Views: Views are updatable which also causes change to the table they are derived from
--Not updatabnle if the modification affect multiple table bases asuch as a view made by a join 
Create View vw_Products as
(
Select * From Products
)

Select * From
dbo.Invoices


Select * from Customers
Select * from Employees

--SQL injection: Some hackers inject malicious code into our SQL queries to cause harm or destruction to the database
Declare @string varchar(30)
set @string = '4; Drop Table Employees';


Select EmployeeID, FirstName From Employees
Where EmployeeID = 4; Drop Table Employees

Select EmployeeID, FirstName 
From Employees
Where EmployeeID = @string;

Select * From INFORMATION_SCHEMA.Tables

--We prevent SQL Injections via parameters wait till next episode of dbz

--Temp table
#temptable
@variable

Create Table #Any2Table(
id int Primary Key,
Name varchar(30))

--Local temp table: a temp table scoped to only the session it is defined in
--Global temp: a global scoped table that any other session can access

Select * from #AnyTable


Insert #Any2Table Select EmployeeId, FirstName From Employees

Use Northwind
Go
Select p.SupplierID, p.ProductId, ContactName Into ##SuppliersRandom
From Suppliers  Join Products p On p.SupplierID = Suppliers.SupplierID

Select *
From  ##SuppliersRandom

--local/table variable
Declare @NumbersId int
--Set @NumbersId = 15
--Print @NumbersId
Select @NumbersId = Count(1) From Employees;
Print @NumbersId

Declare @tableVari table(
id int,
name varchar(30))
--Set @NumbersId = 15
--Print @NumbersId
Insert @tableVari select EmployeeId, FirstName From Employees
Select * From @tableVari


Declare @tableVari table(
id int,
name varchar(30))
Insert @tableVari values(
1, 'Nancy'),
(2, 'janet')
Select * From @tableVari

Go
Select * From @tableVari

--1. Storage: temp tables and table variables are both stored in the tempDb
--2. Scope:temp tables scoped local/global #, ##. Table variable are scoped by the batch
--3. Temp tables are for large data sets, table variables are for small datasets
--4.Tamp tables not in stored Procedures, table variables can be used
--5. Structure temp tables can create indexes/constraints except foreign key, but table variables cannot

--Break 10 minutes

--Anonymous Block
Begin
Declare @var Int
set @var = 5
print @var
End

use Northwind
--Stored Procedures: prepared sql code that is reusable
Create Proc spHello
As
Begin
	Print 'Hello world from SSMS'
End
Exec spHello


Create Proc AllEmployees
As
Begin
	Select * From Employees
	Select * from Products
End
Exec AllEmployees
Drop proc AllEmployees

Create Proc spAddNumbers
@a int,
@b int
As
Begin
	Print @a + @b
End
Exec spAddNumbers 10, 20

Create Proc spGetByCity
@city varchar(30)
As
Begin
	select * from Employees
	Where city = @city
End
Exec spGetByCity 'London'

--Using Out for SP
Create Proc spGetEmpName
@id int,
@ename varchar(30) Out
As
Begin
select @ename = FirstName From Employees where EmployeeId = @id;
End

Declare @ename varchar(30)
Exec spGetEmpName 1, @ename out
Print @ename

--using return for Stored Procedures
Create proc spGetEmpRecord
As
Begin
Declare @empRow Int
Select @empRow = count(*) from Employees
return @empRow
end

declare @result int
Exec @result = spGetEmpRecord
Print @result


Create proc attemptForAnotherType
As
Begin
return 'Hello'
end
declare @Result varchar(30)
exec @result = attemptForAnotherType

--Return vs Out 
--Both are used to retrieve a value out (return can only give back 1 integer, while out can be multiple values)
--return in SP can only return an 'int'
--for any other type, use Out.

--Triggers: Automatically fires when an event occurs
--DML Triggers: Modfiy Data
--DDL Triggers: CREATE, ALTER, DROP
--Logon Triggers: Fires On authentication

--Functions:
Create Function GetTotalRevenue(@price money, @discount real, @quantity smallint)
Returns Money
as
Begin
	Declare @revenue money
	set @revenue = @price * @quantity * (1- @discount)
	return @revenue
End

Select UnitPrice, Discount, Quantity, dbo.GetTotalRevenue(UnitPrice, Discount, Quantity) [Total Revenue]
From [Order Details]

Create Function ExpensiveProduct(@threshold money)
Returns table
As 
return Select * from products where UnitPrice > @threshold

select * from dbo.ExpensiveProduct(15)

--Sp vs Function:
-- usage: sp is for DML statements while functions are used for calculations
--calling: sp uses execute, functions requires query as well as input parameters
--input: sp may or may not need any inputs , while functions do require one
--output: sp may or may not require output, but functions must have output parameters
--sp can call functions but functions cannot call SP.

--Pagination: divide a large dataset into smaller discrete pages
--Offset: how many rows will be skipped from result set of a query
--Fetch: How many rows we want to select

select CustomerID, ContactNAme, City
From Customers
Order By CustomerID

select CustomerID, ContactNAme, City
From Customers
Order By CustomerID
OffSet 10 Rows
Fetch Next 10 rows only

Create Function pagination (@pageNumber int, @rowsofpage int)
returns table
as 
Begin
	Declare @pagenumber int 
	declare @rowsofpage int
	set @pageNumber =1
	set @rowsofpage = 10

	Declare @Maxtablepage int
	Select @maxtablepage = Count(*) from Customers
	set @Maxtablepage = Ceiling(@maxtablepage/@rowsofpage) --ceiling(91/ @rowsofpage)
	while @Maxtablepage >= @pageNumber
	Begin
		Select CustomerId, ContactName, City
		From Customers
		Order By CustomerId
		Offset (@pageNumber -1) * @rowsofpage Rows
		Fetch next @rowsofpage Rows only
		set @pageNumber = @pageNumber + 1
	End
	
End

Create Proc pagination (@pageNumber int, @rowsofpage int)
as 
Begin
	Declare @Maxtablepage int
	Select @maxtablepage = Count(*) from Customers
	set @Maxtablepage = Ceiling(@maxtablepage/@rowsofpage) --ceiling(91/ @rowsofpage)

	Select CustomerId, ContactName, City
	From Customers
	Order By CustomerId
	Offset (@pageNumber -1) * @rowsofpage Rows
	Fetch next @rowsofpage Rows only
End

Exec pagination 9, 10

--Day 4 

--Constraints

--Normalization

--Transactions

--Indexes

--Performance Tuning


--C# day 1 (Monday) 

--Basics
