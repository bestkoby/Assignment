### SQL prep

**1. What is index; types of indices; pros and cons**  
Indexes are special lookup tables that the database search engine can use to speed up data retrieval.

**2. What's the difference between Primary key and Unique constraint?**  
Primary key vs unique key
--1. Unique can accept one and only one null value, pk does not accept null values
--2. One table can have multiple Unique keys but only one pk
--3. Pk will sort the data by default, but unique key will not
--4. PK will by default generate clustered index, but unique key will create non-clustered index

**3. Tell me about check constraint**  
The CHECK constraint is used to limit the value range that can be placed in a column

**4. Difference between temp table and table variable**  
--1. Storage: temp tables and table variables are both stored in the tempDb
--2. Scope:temp tables scoped local/global #, ##. Table variable are scoped by the batch
--3. Temp tables are for large data sets, table variables are for small datasets
--4.Tamp tables not in stored Procedures, table variables can be used
--5. Structure temp tables can create indexes/constraints except foreign key, but table variables cannot
 
**5. Difference between WHERE and HAVING**  
where and Having:
--1. Both are used as filters but having applies to groups and filters on aggreagate functions, but where applies to individual rows
--2. Where cannot filter by aggregate functions; however having can.
--3. Where can be used with Select, Update, Delete, but Having can only be used with Select

**6. Difference between RANK() and DenseRank() — value gap**  
 RANK() gives you the ranking within your ordered partition. 
DENSE_RANK() again gives you the ranking within your ordered partition, but the ranks are consecutive.
For example, if 3 items at rank 2, the next item will be rank 5 for RANK(), rank 3 for DENSE_RANK().

**7. COUNT(*) vs. COUNT(colName)**  
 COUNT(*) will count all the rows in the table, including NULL values. On the other hand, COUNT(column name) will count all the rows in the specified column while excluding NULL values.

**8. What's the difference between left join and inner join? JOIN and Subquery, which one has a better performance, why?**  
A join is a query that combines records from two or more tables.A Subquery or Inner query or Nested query is a query within SQL query and embedded within the WHERE clause The retrieval time of the query using joins almost always will be faster than that of a subquery.Subqueries divide the complex query into isolated parts so that a complex query can be broken down into a series of logical steps.
It is easy to understand and code maintenance is also at ease.
 
**9. What is correlated subquery**  
subquery out of where clause

**10. What is a CTE, why do we need CTE?**  
s writing a SELECT query which will give you a result you want to use within another query.Using CTE improves the readability and makes maintenance of complex queries easy.

**11. What does SQL Profiler do?**  
SQL Server Profiler is an interface to create and manage traces and analyze and replay trace results. 
SQL profiler is a graphical user interface (GUI) software tool in Microsoft's SQL Server relational database management system (RDBMS).

**12. What is SQL injection, how to avoid SQL injection?**  


**13. Difference between SP and user defined function? When to use SP when to use function?**  
--Sp vs Function:
-- usage: sp is for DML statements while functions are used for calculations
--calling: sp uses execute, functions requires query as well as input parameters
--input: sp may or may not need any inputs , while functions do require one
--output: sp may or may not require output, but functions must have output parameters
--sp can call functions but functions cannot call SP.

**14. Criteria of Union and Union all? Difference between UNION and UNION ALL**  


**15. Steps you take to improve SQL Queries**  
SELECT fields instead of using SELECT *
use join subquery

**16. concurrency problem in transaction**  


**17. what is deadlock, how to prevent**  
a deadlock occurs when two (or more) processes lock the separate resource. Under these circumstances, each process cannot continue and begins to wait for others to release the resource.

Try to keep transactions short; this will avoid holding locks in a transaction for a long period of time.
Utilize the error handling using the try-catch blocks. You can trap the deadlock error and rerun the transaction in the event of a deadlock victim.
Change the isolation level to the READ COMMITTED SNAPSHOT ISOLATION or SNAPSHOT ISOLATION

**18. what is normalization, 1NF - BCNF, benefits using normalization**  
Normalization is the process to eliminate data redundancy and enhance data integrity in the table. Normalization also helps to organize the data in the database. 
1nf a single cell cannot hold multiple values. It must hold only a single-valued attribute.
2nf The table should not possess partial dependency. 
3nf no transitive dependency for non-prime attributes, which indicates that non-prime attributes 
bcnf attribute of the functional dependencies should depend on the super key of that particular table.
**19. what are the system defined databases?**  
 System databases are defined by Microsoft and are needed for SQL Server to operate. These databases include Master, Model, MSDB, TempDB, Resource, Distribution database used in replication as well as the ReportServer and ReportServerTempDB databases used for Reporting Services. 

**20. composite key**  
 a composite key is a candidate key that consists of two or more attributes (table columns) that together uniquely identify an entity occurrence (table row)
**21. candidate key**  
A candidate key is a specific type of field in a relational database that can identify each unique record independently of any other data.

**22. DDL vs. DML**  

**23. ACID property**  
 Atomicity
All statements of a transaction must succeed completely, or fail completely in each and every situation, including power failures, errors and crashes. Example - Debiting and crediting in a money transfer transaction, both must happen either together or not at all.

Consistency
The database must remain in a consistent state after any transaction. Data in the database should not have any changes other than intended after the transaction completion.

Isolation
Isolation ensures that concurrent execution of transactions leaves the database in the same state that would have been obtained if the transactions were executed sequentially.

Durability
Durability guarantees that once a transaction has been committed, it will remain committed even in the case of a system failure which actually means recording the completed transactions (or their effects) in non-volatile memory.

**24. table scan vs. index scan**  
Table scan means iterate over all table rows. Index scan means iterate over all index items

**25. Difference between Union and JOIN**  


### c# prep
 
**1. reference type vs. value type**

**2. boxing vs. unboxing**

**3. abstract class vs. interface**

**4. Overriding vs. Overloading**

**5. What does constructor do in a class? Can it be overridden? Can it be overloaded?**

**6. What does static keyword do in C#?**

**7. Difference between Virtual method and Abstract method?**

**8. what are delegates in C#, what are different types of built-in delegates**
A delegate is a type safe function pointer.
Action, Predicate and Func are predefined generic delegate.
Action delegate takes generic input parameter and does not return any value. Its return type is void
Predicate delegate takes generic input parameter and returns boolean value
Func delegate takes generic input parameters and returns generic value
 

**9. Explain different access modifiers in C#**

**10. What is the extension method in C#? examples of built-in extension methods? How to create custom extension methods?**
Extension methods enable you to "add" methods to existing types without creating a new derived type, recompiling, or otherwise modifying the original type.static

**11. Ref vs. Out vs. Params**

**12. Pass by reference vs. Pass by Value**

**13. array vs. arrayList**
Array stores data of the same type whereas ArrayList stores data in the form of the object which may be of different types.
**14. example of encapsulation, where to implement**

**15. how do you handle exceptions? Syntax.**
Use a try block around the statements that might throw exceptions. Once an exception occurs in the try block, the flow of control jumps to the first associated exception handler that is present anywhere in the call stack. In C#, the catch keyword is used to define an exception handler.

**16. what is generic, syntax to define**
Generic allows you to use a class or method that can work with any data type. You need to define the data type while using class or method. Usually the type is specified by the <T>.  You can make a class, interface or method generic.
