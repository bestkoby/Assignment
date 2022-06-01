Use Northwind

Go

--Select statement: identity which columns to retrieve

-- * operator inside select meants to get entire table.
Select *
From Employees

-- Individual selection of columns in table
Select EmployeeID, FirstName, LastName
From Employees

--avoid select * because of uneccesary data& name conflicts

--Distinct removes duplicate values 
Select City From Employees

Select Distinct City
From Employees

--ability to combine columns | double quotes and square brackets can be used as delimiters "" []
Select FirstName + ' ' + LastName as "Full Name"
From Employees

--Identifiers: names that we give to db, tables, columns, views...
--1.. regular identifier: complies with rules
-- a: a-z,  or @, or #
-- @: is a temporary variable and is used to declare variable

Declare @today datetime
Set @today = GetDate()
print @today
--lifetime scope for @ is batch
--#: temp tables
--b: subsequent characters can be latter, number, @, $, #, _
Declare @t__o$#day datetime
Set @t__o$#day = GetDate()
print @t__o$#day
-- c: identifier is not a reserved word (case insensitive)
-- d: embedded space or other special characters are not allowed

--Where Statement/Clause: filter records with requirements
--using equals "="
Select ContactName, Country
From Customers
Where Country = 'Germany'

Select ProductName, UnitPrice
From Products
Where UnitPrice = 18

--Not equals != <>
Select ContactName, Country
From Customers
Where Country != 'UK'

Select ContactName, Country
From Customers
Where Country <> 'UK'

--In Operator: retrieve among a list of values
Select OrderID, CustomerID, ShipCountry
From Orders
Where ShipCountry = 'USA' Or ShipCountry = 'Canada'

Select OrderID, CustomerID, ShipCountry
From Orders
Where ShipCountry In ('USA','Canada')

--Between retrieve records in a consecutive range:
Select ProductName, UnitPrice
From Products
Where UnitPrice >= 20 And UnitPrice < 30

Select ProductName, UnitPrice
From Products
Where UnitPrice Between 20 and 30

--Not Operator: displays a record if the condidtion is not true
Select OrderID, CustomerID, ShipCountry
From Orders
Where ShipCountry NOT In ('USA','Canada')

Select OrderID, CustomerID, ShipCountry
From Orders
Where Not ShipCountry In ('USA','Canada')

Select ProductName, UnitPrice
From Products
Where UnitPrice Not Between 20 and 30

--Null Values "Is" operator: Null is a field with no values
Select Region
From Employees
Where Region Is Not Null --"Is Null" or "Is Not Null"
-- This creates a table for the example below **
CREATE TABLE TestSalary(EId int primary key identity(1,1), Salary money, Comm money)
INSERT INTO TestSalary VALUES(2000, 500), (2000, NULL),(1500, 500),(2000, 0),(NULL, 500),(NULL,NULL)

Select * From TestSalary
Select EId, Salary, Comm, IsNull(Salary, 0) + IsNull(Comm, 0) [Total Commission]
From TestSalary

Drop Table TestSalary
--** end of example

--Like Operator: Create a search expression
--1 works with wildcards to search for matching characters
--% 
Select FirstName, LastName
From Employees
Where LastName Like '_u%'

Select * from Employees

Select ContactName, PostalCode
From Customers
Where PostalCode Not Like '[0-3]%'

--Works with ^: any characters not in the brackets
Select ContactName, PostalCode
From Customers
Where PostalCode Like '[^0-3]%'

Select ContactName
From Customers
Where ContactName Like 'A[^l-n]%'

--Order By:
Select ProductName, UnitPrice
From Products
--Where UnitPrice = 18
Order By UnitPrice desc, ProductName Asc


--Batch directive

Create Database MayBatch
Go
Use MayBatch
Go
Create Table Employee(Id int, EmployeeName varchar(20))

Select *
From Employee

Drop database MayBatch
Use Northwind
--JOINS is used to combine rows from two or more result sets based on a related column
--1. inner join: return the records that have matching values in both tables
--Find employees who have deal with any order

Select e.EmployeeID, e.FirstName + ' ' + e.LastName [EmployeeName], o.OrderDate
From Employees e Inner Join Orders o On e.EmployeeID = o.EmployeeId

Select e.EmployeeID, e.FirstName + ' ' + e.LastName [EmployeeName], o.OrderDate
From Employees e Join Orders o On e.EmployeeID = o.EmployeeId

Select e.EmployeeID, e.FirstName + ' ' + e.LastName [EmployeeName], o.OrderDate
From Employees e, Orders o 
Where e.EmployeeID = o.EmployeeId


Select e.EmployeeID, e.FirstName + ' ' + e.LastName [EmployeeName], o.OrderDate
From Employees e Cross Join Orders o 
--Same as 
Select e.EmployeeID, e.FirstName + ' ' + e.LastName [EmployeeName], o.OrderDate
From Employees e, Orders o 

Select c.ContactName, o.OrderID
From Customers c Left Join Orders o On c.CustomerID = o.CustomerID

--Nested Joins

Select c.ContactName Customer, e.FirstName, o.OrderDate, Od.Quantity, od.UnitPrice
From Customers c Join Orders o On c.CustomerId= o.CustomerId Join Employees e On e.EmployeeId = e.EmployeeId
Join [Order Details] od on od.OrderID = o.OrderId

--Self Join: join to itself

--Context: Reports to is the manager and if someone does not report to anyone, they are the top dog (CEO)
Select e.FirstName + ' ' + e.LastName as Employee, IsNull(m.FirstName + ' ' + m.LastName, 'N/A') as Manager
From Employees e Left Join Employees m On e.ReportsTo = m.EmployeeID 