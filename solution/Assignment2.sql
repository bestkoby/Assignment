Assignment 2


Joins:
1.	  
SELECT c.Name AS Country, s.Name AS Province 
	FROM Person.CountryRegion c 
	JOIN
	Person.StateProvince s
	ON c.CountryRegionCode = s.CountryRegionCode;

2.
SELECT c.Name AS Country, s.Name AS Province 
	FROM Person.CountryRegion c 
	JOIN
	Person.StateProvince s
	ON c.CountryRegionCode = s.CountryRegionCode
	WHERE c.Name NOT IN ('Germany', 'Canada');	

Using Northwnd Database: (Use aliases for all the Joins)
3.	
SELECT DISTINCT p.ProductID, p.ProductName
	FROM Orders o
	JOIN
	[Order Details] od
	ON o.OrderID =  od.OrderID
	JOIN 
	Products p
	ON od.ProductID = p.ProductID
	WHERE DATEDIFF(year, o.OrderDate, GETDATE())< 25;

4.	
SELECT TOP 5 o.ShipPostalCode, SUM(od.Quantity) as qty FROM 
	Orders o
	JOIN
	[Order Details] od
	ON o.OrderID =  od.OrderID
	WHERE o.ShipPostalCode IS NOT NULL 
		AND DATEDIFF(year, o.OrderDate, GETDATE())< 25
	GROUP BY ShipPostalCode
	ORDER BY qty DESC;

5.
select City, count(customerID) as NumOfCustomer
from customers
group by City

6.
select City, count(customerID) as NumOfCustomer
from customers
group by City
having  count(customerID)>2

7.
SELECT c.CustomerID, c.CompanyName, c.ContactName, 
SUM(od.Quantity) AS QTY FROM 
Customers c 
LEFT JOIN 
Orders o 
ON c.CustomerID = o.CustomerID
LEFT JOIN 
[Order Details] od
ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.CompanyName, c.ContactName
ORDER BY QTY;

8
SELECT c.CustomerID,
SUM(od.Quantity) AS QTY FROM 
Customers c 
LEFT JOIN 
Orders o 
ON c.CustomerID = o.CustomerID
LEFT JOIN 
[Order Details] od
ON o.OrderID = od.OrderID
GROUP BY c.CustomerID
HAVING SUM(od.Quantity) > 100
ORDER BY QTY;

9.
SELECT DISTINCT sup.CompanyName, ship.CompanyName FROM 
Orders o
LEFT JOIN
[Order Details] od
ON o.OrderID = od.OrderID
INNER JOIN 
Products p
ON od.ProductID = p.ProductID
RIGHT JOIN
Suppliers sup
ON p.SupplierID = sup.SupplierID
INNER JOIN
Shippers ship
ON o.ShipVia = ship.ShipperID;

10.	
SELECT o.OrderDate, p.ProductName FROM 
Orders o
LEFT JOIN
[Order Details] od
ON o.OrderID = od.OrderID
INNER JOIN
Products p
ON od.ProductID = p.ProductID
GROUP BY o.OrderDate, p.ProductName
ORDER BY o.OrderDate;

11.
(1)	
SELECT Title, LastName + ' ' + FirstName AS Name 
FROM Employees
ORDER BY Title;

(2)
SELECT e1.Title, e1.LastName + ' ' + e1.FirstName AS Name1, e2.LastName + ' ' + e2.FirstName AS Name2 
FROM Employees e1
JOIN 
Employees e2
ON e1.Title = e2.Title 
WHERE e1.FirstName <> e2.FirstName OR e1.LastName <>        e2.LastName
ORDER BY Title;

12.
SELECT T1.EmployeeId, T1.LastName, T1.FirstName,T2.ReportsTo, COUNT(T2.ReportsTo) AS Subordinate  
FROM Employees T1 JOIN Employees T2 ON T1.EmployeeId = T2.ReportsTo
WHERE T2.ReportsTo IS NOT NULL
GROUP BY T1.EmployeeId, T1.LastName, T1.FirstName,T2.ReportsTo
HAVING COUNT(T2.ReportsTo) > 2

13.
SELECT c.City, c.CompanyName, c.ContactName, 'Customer' as Type
FROM Customers c
UNION
SELECT s.City, s.CompanyName, s.ContactName, 'Supplier' as Type
FROM Suppliers s;

14
select distinct city from Customers where city in (select city from Employees)
15
select distinct city  from Customers 
where City not in (select distinct city from employees where city is not null)

select distinct city from Customers  
except 
select distinct city from Employees

16
select ProductID,SUM(Quantity) as QunatityOrdered from [order details]
group by ProductID
17
--a 
select city from Customers
except
select city from customers
group by city
having COUNT(*)=1
union 
select city from customers
group by city
having COUNT(*)=0

--b
select city from customers group by city having COUNT(*)>=2

18
select distinct city from orders o join [order details] od on o.orderid=od.orderid join customers c on c.customerid=o.CustomerID
group by city
having COUNT(*)>=2

19
select top 5 ProductID,AVG(UnitPrice) as AvgPrice,(select top 1 City from Customers c join Orders o on o.CustomerID=c.CustomerID join [Order Details] od2 on od2.OrderID=o.OrderID where od2.ProductID=od1.ProductID group by city order by SUM(Quantity) desc) as City from [Order Details] od1
group by ProductID 
order by sum(Quantity) desc

20
select (select top 1 City from Orders o join [Order Details] od on o.OrderID=od.OrderID join Employees e on e.EmployeeID = o.EmployeeID
group by e.EmployeeID,e.City
order by COUNT(*) desc) as MostOrderedCity,
(select top 1 City from Orders o join [Order Details] od on o.OrderID=od.OrderID join Employees e on e.EmployeeID = o.EmployeeID
group by e.EmployeeID,e.City
order by sum(Quantity) desc) as MostQunatitySoldCity

21.
One way is use group by and count(*), if count(*)>1 then delete the rows using sub query