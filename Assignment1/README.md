## Conceptual Questions

**1. What does CRUD stand for?**    
CRUD stands for Create, Read, Update, and Delete operators.

**2. What are the System Databases?**  
System Databases are databases that are installed during the SQL Server installation. System databases consist of Master, MSDB, TempDB, and Model.   

**3. What is OLAP and OLTP?**  
Online analytical processing (OLAP) uses complex queries to analyze aggregated historical data from OLTP systems. Online transaction processing (OLTP) captures, stores, and processes data from transactions in real time. 

**4. What is the difference between DDL vs. DML?**  
Data definition language (DDL) allows creation objects in database with, for example Create, Alter, Drop.
Data Manipulation Language (DML) allows query and modify the data, for example Select, Insert, Update, Delete.

**5.What does the “Like” keyword do?**  
In SQL,  like operator can find values in a field that match the pattern you specify.

**6. List the wildcards available for the Like Operator.**  
%  Any string with zero or more characters in the search pattern
_  Any single character search with the specified pattern
[] Any single character search within the specified range
[^] Any single character search not within the specified range

**7. What's the difference between left join and inner join?**  
left join have all records from the “left” table, and records having pair on both sides.
inner join will only have records having pair on both sides.