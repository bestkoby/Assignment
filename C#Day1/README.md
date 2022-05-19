### Understanding Data Types

**1. What type would you choose for the following “numbers”?**  
* A person’s telephone number 
    * string
* A person’s height
    * float
* A person’s age 
    * int
* A person’s gender (Male, Female, Prefer Not To Answer)
    * char 
* A person’s salary
    * float
* A book’s ISBN
    * long
* A book’s price
    * float 
* A book’s shipping weight
    * float
* A country’s population
    * long
* The number of stars in the universe
    * long
* The number of employees in each of the small or medium businesses in the United Kingdom (up to about 50,000 employees per business)  
    * int
  
**2. What are the difference between value type and reference type variables? What is boxing and unboxing?**  
value type directly contain their data, while reference type store references to their data (Known as objects). 
Boxing and unboxing in C# allows developers to convert . NET data types from value type to reference type and vice versa. when a value type is boxed, a new reference type is created and the value is copied from the value type to the newly created reference type. it will slow down the performance and increase memory requirements.

**3. What is meant by the terms managed resource and unmanaged resource in .NET**  
Managed resources are those that are pure .NET code and managed by the runtime and are under its direct control. 
Unmanaged resources are those that are not. File handles, pinned memory, COM objects, database connections etc.

**4. Whats the purpose of Garbage Collector in .NET?**  
The garbage collector manages the allocation and release of memory for an application. For developers working with managed code, this means that you don't have to write code to perform memory management tasks. Automatic memory management can eliminate common problems, such as forgetting to free an object and causing a memory leak or attempting to access memory for an object that's already been freed.
 
### Controlling Flow and Converting Types

**1. What happens when you divide an int variable by 0?**      
error code CS0020 division by constant 0

**2. What happens when you divide a double variable by 0?**     
infinte


**3. What happens when you overflow an int variable, that is, set it to a value beyond its range?**    
error code CS0266 Cannot implicitly convert type 'long' to 'int'. An explicit conversion exists (are you missing a cast?)

**4. What is the difference between x = y++; and x = ++y;?**   
x = y++ let y =y+1 and then assign y to x. x = ++y assign y to x and then let y =y+1.  

**5. What is the difference between break, continue, and return when used inside a loop statement?**    
break is used to exit from a loop or a switch-case. continue is used to move the control to the next iteration of the loop. return is used to return a value from a function.  

**6. What are the three parts of a for statement and which of them are required?**    
initialization, condition, update loop variable   

**7. What is the difference between the = and == operators?**     
= assign operator,   ==  is the comparison operator 

**8. Does the following statement compile? for ( ; true; ) ;**    
compile, causing infinte loop
**9. What does the underscore _ represent in a switch expression?**    
The underscore (_) character replaces the default keyword to signify that it should match anything if reached.

**10. What interface must an object implement to be enumerated over by using the foreach statement?**  
terators are called enumerators, and they come from the IEnumerator interface

### Arrays and Strings
**1. When to use String vs. StringBuilder in C# ?**  
If a string is going to remain constant throughout the program, then use String class object because a String object is immutable.
If a string can change (example: lots of logic and operations in the construction of the string) then using a StringBuilder is the best option.
**2. What is the base class for all arrays in C#?**  
The Array class is the base class for all the arrays in C#. It is defined in the System namespace.  
**3. How do you sort an array in C#?**  
Array.Sort() method 
**4. What property of an array object can be used to get the total number of elements in an array?** 
Array.Length Property
**5. Can you store multiple data types in System.Array?**  
No, we cannot store multiple datatype in an Array, we can store similar datatype only in an Array.
**6. What’s the difference between the System.Array.CopyTo() and System.Array.Clone()?**  
The Clone() method returns a new array (a shallow copy) object containing all the elements in the original array. The CopyTo() method copies the elements into another existing array. Both perform a shallow copy. A shallow copy means the contents (each array element) contains references to the same object as the elements in the original array
1- CopyTo require to have a destination array when Clone return a new array.
2- CopyTo let you specify an index (if required) to the destination array.