--Day 4 

--Constraints: Rules set for columns when we design a table
Create Database Day4Learning
use Day4Learning
go

Create Table Employees(
Id int,
EName varchar(30),
Age int)

insert Employees values (1, 'Sam', 50)
insert Employees values (Null, Null, Null)

Select * From Employees
Drop Table Employees

--Not null constraint
Create Table Employees(
Id int not null,
EName varchar(30) not null,
Age int)
insert Employees values (1, 'Sam', 50)
insert Employees values (Null, Null, Null)

Drop Table Employees

--Primary Key  and Unique key Constraint
Create Table Employees(
Id int Primary Key Nonclustered,
EName varchar(30) not null,
Age int check(Age Between 18 And 65),
PhoneNumber varchar(15) Unique,
City varchar(30) Default 'USA')
insert Employees(Id, EName, Age, PhoneNumber) values (1, 'Sam', 50, '1234567890')
insert Employees values (Null, Null, Null)

--Primary key vs unique key
--1. Unique can accept one and only one null value, pk does not accept null values
--2. One table can have multiple Unique keys but only one pk
--3. Pk will sort the data by default, but unique key will not
--4. PK will by default generate clustered index, but unique key will create non-clustered index

--Check constraint:
insert Employees values (1, 'Sam', 66, '1234567890')

--Identity Column: 
Create Table Employees(
Id int Primary Key Identity(1, 5))--,
--EName varchar(30) not null)
insert Employees values('Sam')
insert Employees values('Nick')
insert Employees values('Sally')
insert Employees values('Sue')
Select * From Employees
Drop Table Employees

Create Table Employees(
Id int not null,
EName varchar(30) not null,
Age int,
DeptId int References Departments(Id)) ON Delete Cascade 
--On delete cascade allows records to be delete from the child table, then deleted from the parent table

--DeptId int References Departments(Id)) ON Delete Set Null
--Set the dependant value to null in child table, then delete from parent table

Create Table Departments(
Id int Primary Key,
DeptName varchar(30),
[Location] varchar(30)
)
Drop Table Departments

--Delete and Truncate:
Create Table Employees(
Id int Primary Key Identity(1, 5),
EName varchar(30) not null)
insert Employees values('Sam')
insert Employees values('Nick')
insert Employees values('Sally')
insert Employees values('Sue')

Delete Employees
Where EName = 'Sam'
Select * From Employees

Delete Employees
Select * From Employees


Truncate Table Employees
--Delete vs Truncate:
--1. Delete can be used with where to remove one or more records 
--2. Trunacte will remove all records and cannot be used with where
--3. Delete is a DML statement (will not reset identity) while Truncate is a DDL statement (will reset the identity)

--Normalization 

--Break 10 minutes

--Transactions
insert Employees values('Sam')
insert Employees values('Nick')
insert Employees values('Sally')
insert Employees values('Sue')
Set Statistics IO ON
Select * from Employees

Begin Tran

insert Employees values('Sam')
insert Employees values('Nick')
insert Employees values('Sally')
insert Employees values('Sue')

Commit Rollback
--"End" Commit Rollback

--Performance Tuning