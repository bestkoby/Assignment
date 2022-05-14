use Northwind

-- 1
create view view_product_order_Li as (
	select p.ProductName, sum(od.quantity) as totalorderedquantity
	from [Order Details] od join Products p on p.ProductID = od.ProductID
	group by p.ProductName
)
select * from view_product_order_Li

 
-- 2 
DROP PROC IF EXISTS sp_product_order_quantity_Li 
Create Proc sp_product_order_quantity_Li 
@ProductId int,
@orderquantity int Out
As
Begin
	select @orderquantity = sum(od.quantity)  
	from [Order Details] od join Products p on p.ProductID = od.ProductID
	where p.ProductID = @ProductId
	group by p.ProductName 
End 

Declare @orderquantity int
exec sp_product_order_quantity_Li  1, @orderquantity out
Print @orderquantity 
 
-- 3
drop proc if exists sp_product_order_city_Li
Create Proc sp_product_order_city_Li
@ProductName varchar(30)  
As
Begin
select top 5 o.ShipCity, sum(od.quantity) as quantity
from Products p join [Order Details] od on p.ProductID = od.ProductID join Orders o  on o.OrderID = od.OrderID
where p.ProductName = @ProductName  
group by o.ShipCity 
order by quantity desc 
End 
exec sp_product_order_city_Li 'Chai'
 
-- 4
Create Table city_Li(
id int Primary Key,
city varchar(30)
)
Insert city_Li values
(1, 'Seattle'),
(2, 'Green Bay')
 
Create Table people_Li(
id int Primary Key,
name varchar(30),
cityid int  
)
Insert people_Li values
(1, 'Aaron Rodgers',2),
(2, 'Russell Wilson',1),
(3, 'Jody Nelson',2) 

begin
delete from city_Li where city = 'Seattle'
Insert city_Li values (3, 'Madison') 
update people_Li SET cityid = 3 WHERE cityid = 2;
end

create view Packers_koby as (
	select p.name
	from  city_Li c join people_Li p on c.id = p.cityid  
	where c.city = 'Green Bay'
)

drop table IF EXISTS people_Li, city_Li
drop view IF EXISTS Packers_koby

-- 5
Drop proc if exists sp_birthday_employees_Li 
Create Proc sp_birthday_employees_Li 
As
Begin
Declare @birthday_employees_Li table(
 name varchar(30)
 )
Insert @birthday_employees_Li select FirstName+' '+LastName  from Employees where Month(BirthDate) = 2
select * from @birthday_employees_Li
End 

-- 6
-- select * from tableA minus select * from tableB, if now rows in result, means same data


