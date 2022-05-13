use AdventureWorks2019
 
-- 1
select c.name [Country ],s.name [Province]
from person.CountryRegion c
join person.StateProvince s
on c.CountryRegionCode = s.CountryRegionCode

-- 2
select c.name [Country ],s.name [Province]
from person.CountryRegion c
join person.StateProvince s
on c.CountryRegionCode = s.CountryRegionCode
where c.name in ('Germany', 'Canada')

use Northwind 
-- 3 
Select p.ProductID, p.ProductName
from Products p join [Order Details] od on p.ProductID = od.ProductID join Orders o on od.OrderID = o.OrderID
where o.OrderDate > DATEADD(YEAR, -25, GETDATE())

-- 4
Select top 5 isnull(o.ShipPostalCode,'N/A'), sum(od.quantity) as ProductSold
from [Order Details] od join Orders o on od.OrderID = o.OrderID
where o.OrderDate > DATEADD(YEAR, -25, GETDATE())
group by o.ShipPostalCode
order by ProductSoold desc

-- 5
Select  City, COUNT(CustomerID) as numberofCustomer  
from Customers
group by City

-- 6
Select  City, COUNT(CustomerID) as numberofCustomer  
from Customers
group by City
having COUNT(CustomerID)  > 2

-- 7 
Select c.ContactName c, sum(od.quantity) as ProductSBuy 
from Customers c join orders o on c.CustomerID = o.CustomerID join [Order Details] od on o.OrderID= od.OrderID
group by c.ContactName

-- 8
Select c.CustomerID, sum(od.quantity) as ProductSBuy 
from Customers c join orders o on c.CustomerID = o.CustomerID join [Order Details] od on o.OrderID= od.OrderID
group by c.CustomerID 
having sum(od.quantity) > 100

-- 9
Select 
from Suppliers s join Products p on s.SupplierID =  p.SupplierID on p.ProductID = od.ProductID join Orders o on od.OrderID = o.OrderID
Select *
from Orders

Select *
from Shippers

-- 10
Select o.OrderDate, p.ProductName
from Orders o join [Order Details] od on o.OrderID= od.OrderID join  Products p on p.ProductID = od.ProductID

-- 11 
Select e1.EmployeeID, e2.EmployeeID
from Employees e1, Employees e2
where e1.Title = e2.Title and e1.EmployeeID <> e2.EmployeeID

-- 12
Select m.FirstName+' '+m.LastName
from Employees m
where m.EmployeeID in (
	Select e.ReportsTo 
    from Employees e
    group by e.ReportsTo
	having COUNT(*)>2
)


-- 13
select City, CompanyName, ContactName, 'Customers' as Type
from Customers
union 
select City, CompanyName, ContactName, 'Supplier' as Type
from Suppliers
  
-- 14
SELECT distinct s.city
from Customers c, Suppliers s 
where s.city = c.City
  
-- 15b
SELECT *
from Customers c left join Employees e on c.city = e.city
where e.EmployeeID is null

-- 16
SELECT p.ProductName, dt.totalorder
from Products p join (
   SELECT od.ProductID, sum(od.quantity) as totalorder
   from [Order Details] od join Orders o 
   on od.OrderID = o.OrderID
   group by od.ProductID
) dt
on p.ProductID = dt.ProductID

-- 17a
SELECT City
from Customers
except (
SELECT City
from Customers
group by City
having COUNT(*)= 0
union 
SELECT City
from Customers
group by City
having COUNT(*)= 1
)
 
-- 17b
SELECT City
from  (
	SELECT City, COUNT(*) as numofcustomers 
	from Customers
	group by City
) t
where numofcustomers >= 2 


-- 18
SELECT c.City 
from Customers c join Orders o  on c.CustomerID = o.CustomerID join [Order Details] od on od.OrderID = o.OrderID
group by c.City 
having COUNT(DISTINCT od.ProductID) >= 2

 
-- 19 
-- Assume most orders are most popular
SELECT top 5 od.ProductID 
		from Orders o join [Order Details] od on od.OrderID = o.OrderID
		group by od.ProductID
		order by COUNT(*)
	SELECT c.City, t1.ProductID,SUM(t1.quantitybyCustomer) as numberofproductbuy    
	from Customers c join  (
		SELECT o.CustomerID, od.ProductID, SUM(od.quantity) as quantitybyCustomer
		from Orders o join [Order Details] od on od.OrderID = o.OrderID
		group by o.CustomerID, od.ProductID
	) t1 on c.CustomerID = t1.CustomerID  
	group by c.City, t1.ProductID  
	order by SUM(t1.quantitybyCustomer) desc

-- 20
select a.City 
from (
	SELECT top 1 c.City 
	from Customers c join Orders o  on c.CustomerID = o.CustomerID
	group by c.City
	order by COUNT(*) desc
) a,
(
	SELECT top 1 c.City 
	from Customers c join  (
		SELECT o.CustomerID, SUM(od.quantity) as quantitybyCustomer
		from Orders o join [Order Details] od on od.OrderID = o.OrderID
		group by o.CustomerID
	) t1 on c.CustomerID = t1.CustomerID  
	group by c.City  
	order by SUM(t1.quantitybyCustomer) desc
) b
where a.City =b.City 

-- 21
SELECT distinct *
from Customers