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