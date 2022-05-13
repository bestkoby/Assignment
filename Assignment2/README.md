### Conceptual Questions:

**Difference between WHERE and HAVING?**
The HAVING clause is used after the GROUP BY clause. The WHERE clause, in contrast, is used to qualify the rows that are returned before the data is aggregated or grouped. HAVING qualifies the aggregated data after the data has been grouped or aggregated.

**Difference between RANK() and DenseRank()** 
RANK() gives you the ranking within your ordered partition. 
DENSE_RANK() again gives you the ranking within your ordered partition, but the ranks are consecutive.
For example, if 3 items at rank 2, the next item will be rank 5 for RANK(), rank 3 for DENSE_RANK().

**What is correlated subquery?**
A correlated subquery is a subquery that refers to a column of a table that is not in its FROM clause. Because the subquery may be evaluated once for each row processed by the outer query, it can be inefficient.

**Criteria of Union and Union all?**
number of columns and data type of each column from both result set should match in the order they are given.

**Difference between UNION and UNION ALL**
Union removes duplicate records (where all columns in the results are the same), Union All does not.

**Difference between Union and JOIN**
A Join is used to combine Columns from different Tables, whereas the Union is used to combine Rows
