Use Northwind
Go

--Group By
--Aggregate Functions:  preform a calculation on a set of values and return a singluar value
--Count()
Select Count(OrderId) [Num Of Order]
From Orders

Select Sum(UnitsInStock) [Total Units in Stock]
From Products

--Use w/ Group By: Group rows that have the same values into summary rows.

Select c.CustomerID, c.ContactName, c.Country, Count(o.OrderId) [Num of Orders]
From Orders o Join Customers c 
On c.CustomerID = o.CustomerID
Group by c.CustomerID, c.ContactName, c.Country
Order by [Num of Orders] Desc

Select Count(ShipRegion) From Orders

--Can count unique values by putting distinct inside function
Select EmployeeId, OrderId, Count(Distinct ShipCity) 
from Orders
Group By EmployeeId, OrderId
Order By EmployeeId

--Having
-- Only retrieve total order number where customers located in USA or Canada, and order number should be greater than or equal to 10
SELECT c.CustomerID, c.ContactName, c.Country, COUNT(o.OrderID) AS NumOfOrders
FROM Orders o JOIN Customers c on c.CustomerID = o.CustomerID 
WHERE c.Country IN ('USA','Canada')
GROUP BY c.CustomerID, c.ContactName, c.Country
HAVING COUNT(o.OrderID) >= 10 
ORDER BY NumOfOrders DESC

--SQL Execution Order:
--From/Join -> Where -> Group By -> Having -> Select -> Distinct -> Order By
--Select: required with fields or aggregate fields
--From: requires tables
--Where: optional for filtering
--Group By: optional with Aggregates but Aggregates are required for its usage
--Having: optional but should be used with Group By
--Order By: optional for sorting.

--Where and Having:
--1. Both are used as filters but having applies to groups and filters on aggreagate functions, but where applies to individual rows
--2. Where cannot filter by aggregate functions; however having can.
--3. Where can be used with Select, Update, Delete, but Having can only be used with Select

Select * from products
update Products
Set UnitsOnOrder = 0
Where ProductId = 1

--Top: select a specific number or a certain percentage of records from data
select Top 5 ProductName, UnitPrice
From Products
Order By UnitPrice Desc

--77 rows total
select Top 10 Percent ProductName, UnitPrice
From Products
Order By UnitPrice Desc

--list top 5 customers who created the most total revenue
SELECT TOP 5 c.ContactName, SUM(od.UnitPrice * od.Quantity) as SumRevenuePerCustomer
FROM Customers c INNER JOIN Orders o ON o.CustomerID = c.CustomerID INNER JOIN [Order Details] od ON od.OrderID = o.OrderID
GROUP BY c.ContactName
ORDER BY SumRevenuePerCustomer DESC

--Unions: used to combine different result sets vertically by adding rows from multiple result sets
Select City, Country, 'Employees' [Type]
From Employees
Union 
Select City, Country, 'Customers'
From Customers
Order By [Type] Desc

Select City, Country, 'Employees' [Type], EmployeeID
From Employees
Union All
Select City, Country, 'Customers', CustomerID
From Customers


--Requirement
--Same number of Columns
--same data type associated with the column number
--Traits:
--Uses First select statement Alias

--Union vs Union All: 
--1. Union removes duplicates, union all will not
--2. Union the records from the first column is sorted automatically
--3. Unions cannot be used in recursive CTE, while Union All can

--Subqueries
--Select statement that is embedded in another query
Select * from Customers Where ContactName = 'Alejandra Camino'

Declare @CityFind varchar(40)
Select @CityFind = City From Customers Where ContactName = 'Alejandra Camino'
Select ContactName, City
From Customers
Where City = @CityFind

Select ContactName, City
From Customers
Where City In (
Select City 
From Customers Where ContactName = 'Alejandra Camino')

--Find the city where Alejandra Camino
--Find other customers from the same city where Alejandra Camino lives

--Subqueries vs Joins:
--1. Joins can only be used in the from Clause, but subqueries can be used in Select, Where, Having, From, Order By clause

--List all the order data and the corresponding employee whose in charge of this order
--
Select * From orders
SELECT o.OrderDate, E.FirstName, E.LastName
FROM Orders o INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID
WHERE e.City = 'London'
ORDER BY o.OrderDate, E.FirstName, E.LastName

--Subqueries: (To prove a point tthat subqueries can be used in Select, Where, and Order By in this situation)
SELECT o.OrderDate,
(SELECT e1.FirstName FROM Employees e1 WHERE o.EmployeeID = e1.EmployeeID) AS FirstName,
(SELECT e2.LastName FROM Employees e2 WHERE o.EmployeeID = e2.EmployeeID) AS LastName
FROM Orders o
WHERE (SELECT e3.City FROM Employees e3 WHERE o.EmployeeID = e3.EmployeeID) = 'London'
ORDER BY o.OrderDate,
(SELECT e1.FirstName FROM Employees e1 WHERE o.EmployeeID = e1.EmployeeID) ,
(SELECT e2.LastName FROM Employees e2 WHERE o.EmployeeID = e2.EmployeeID)

--Find customers who never placed any orders:
--Join
Select c.CustomerID, c.ContactName, c.City, c.Country
From Customers c Left Join Orders o On c.CustomerID = o.CustomerID
Where o.OrderId Is Null

--Subquery version
Select c.CustomerID, c.ContactName, c.City, c.Country 
From Customers c
Where CustomerID not in (
Select distinct CustomerID From Orders)

--3. Joins will typically have better performance than subqueries
--Correlated Subquery: Subquery where inner query is dependant on the outer query
--Customer Name and total number of orders by Customer

--Join:
SELECT c.ContactName, COUNT(o.OrderID) AS NumOfOrders
FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.ContactName
order by NumOfOrders DESC

--Correlated Subquery:
Select c.ContactName, (Select Count(o.OrderId) from Orders o where o.CustomerID = c.CustomerID) [Num of Orders]
From Customers c
Order By [Num of Orders]

Select * from customers
Select * from Orders

--Customers and the number of ordres they made
Select c.ContactName, c.CompanyName, c.City, c.Country, Count(o.OrderId) [Num of Ord]
From Customers c Left Join Orders o On c.CustomerID = o.CustomerID
Group By c.ContactName, c.CompanyName, c.City, c.Country
Order By [Num of Ord] desc

--derived table
Select c.ContactName, c.CompanyName, c.City, c.Country, dt.[Num of Ord]
From Customers c Left Join(
Select CustomerId, Count(OrderId) [Num of Ord]
From Orders
Group By CustomerId) dt On c.CustomerID = dt.CustomerID
Order By dt.[Num of Ord] Desc

--10 minute break

--Window Functions
--Over: Allows the usage of functions (aggregate/ranking) without collapsing any rows
--Allow you to do calculations like counts without grouping by anything. 
--The record still exists and there is no need to collapse the result set. 
Select ProductName, SupplierId, UnitPrice, Sum(UnitPrice) Over() as 'Total'
From Products
select * From Products
Select * from Suppliers 
Select ProductName, SupplierId, UnitPrice, Sum(UnitPrice) Over(Partition By SupplierId) as 'Total'
From Products

--Rank(): value gap
--Dense_Rank(): No value gap
Select ProductId, ProductName, UnitPrice, Dense_Rank() Over(Order By UnitPrice Asc) [drnk], Rank() Over(Order By UnitPrice Asc) [rnk],
ROW_NUMBER() Over(Order By UnitPrice Asc) [RowNum]
From Products
--Row_Number(): 
Select ProductId, ProductName, UnitPrice, ROW_NUMBER() Over(Order By ProductID Asc) [RowNum]
From Products

Select ROW_NUMBER() Over(Order By CustomerId Asc) [RowNum], 'Cust'
From Customers
Union All
Select EmployeeId, 'Emp'
From Employees

--Find the top 3 customers from every country with maximum orders
Select c.ContactName, c.Country, Count(o.OrderId) [Num of Orders], Rank() Over(Partition By c.Country Order By Count(o.OrderId) desc) as [Rank]
From Customers c Join Orders o On c.CustomerId = o.CustomerID
Where [Rank] <= 3
Group By c.ContactName, c.Country

Select dt.ContactName, dt.Country, dt.[Num of Orders], dt.Rank
From 
(Select c.ContactName, c.Country, Count(o.OrderId) [Num of Orders], Row_Number() Over(Partition By c.Country Order By Count(o.OrderId) desc) as [Rank]
From (Customers c Join Orders o On c.CustomerId = o.CustomerID Group By c.ContactName, c.Country) dt
Where dt.[Rank] <= 3

--CTEs: Common table expressions
With OrderCte ([Total Count New], CustomerNewName)
As(
Select Count(OrderId) [Total Count], CustomerId
From Orders 
Group By CustomerId)
Select c.ContactName, c.City, cte.[Total Count New]
From Customers c Left Join OrderCte cte On c.CustomerID = cte.CustomerNewName

With OrderCte
As ( 
Select * from Orders),
OrderCteCallingItself 
As
(Select * from OrderCte)
Select * From OrderCteCallingItself

