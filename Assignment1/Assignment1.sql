use AdventureWorks2019

-- 1
select ProductID, Name, Color, ListPrice 
from Production.Product

-- 2
select ProductID, Name, Color, ListPrice 
from Production.Product
where ListPrice<>0

-- 3
select ProductID, Name, Color, ListPrice 
from Production.Product
where Color is not Null  

-- 4
select ProductID, Name, Color, ListPrice 
from Production.Product
where Color is not Null and ListPrice > 0

-- 5
select Name+' '+Color as NameColor
from Production.Product
where Color is not Null  

-- 6
select Name, Color  
from Production.Product
where Color in ('Black','Silver') and (Name like '%Crankarm' or Name like 'Chainring%') 

-- 7
select ProductID, Name   
from Production.Product
where ProductID between 400 and 500

-- 8
select  ProductID, Name, Color  
from Production.Product
where Color in ('Black','Blue')  

-- 9
select * 
from Production.Product
where Name like 'S%'

-- 10
select TOP(5) Name, ListPrice 
from Production.Product
where Name like '[AS]%' 
Order by Name  

-- 11
select *
from Production.Product
where Name like 'SPO[^K]5' 
Order by Name  

-- 12
select distinct ProductSubcategoryID, Color
from Production.Product
where ProductSubcategoryID is not Null and Color is not Null