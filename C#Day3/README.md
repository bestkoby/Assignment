**1. Describe the problem generics address.**  
Generic allows you to use a class or method that can work with any data type. You need to define the data type while using class or method. Usually the type is specified by the <T>.

**2. How would you create a list of strings, using the generic List class?**  
```List<string> newlist =  new List<string>{ "","",""....}; ``` 

**3. How many generic type parameters does the Dictionary class have?**  
2 type parameters, key and value

**4. True/False. When a generic class has multiple type parameters, they must all match.**  
False

**5. What method is used to add items to a List object?**  
```List.Add(item)```

**6. Name two methods that cause items to be removed from a List.**   
```
List.Remove(elemnnt)  
List.RemoveAt(elemnnt_index)
```

**7. How do you indicate that a class has a generic type parameter?**  
```public class className<T>```

**8. True/False. Generic classes can only have one generic type parameter.**  
False

**9. True/False. Generic type constraints limit what can be used for the generic type.**  
True, can use where restrict a generic to accept value type or reference type

**10. True/False. Constraints let you use the methods of the thing you are constraining to.**  
False