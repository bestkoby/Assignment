**1. What are the six combinations of access modifier keywords and what do they do?**  
- Public
    - accessible from everywhere in a project without any restrictions
- Private
    - accessible only inside a class or a structure. As a result, we can’t access them outside the class they are created.
- Protected
    - accessible inside the class and in all classes that derive from that class.
- Internal
    - limited exclusively to classes defined within the current project assembly.
- Protected Internal
    - combination of protected and internal. As a result, we can access the protected internal member only in the same assembly or in a derived class in other assemblies.
- Private Protected  
    - combination of the private and protected keywords. We can access members inside the containing class or in a class that derives from a containing class, but only in the same assembly(project). Therefore, if we try to access it from another assembly, we will get an error.   

**2. What is the difference between the static, const, and readonly keywords when applied to a type member?**  
Constant and ReadOnly keyword is used to make a field constant which value cannot be modified. The static keyword is used to make members static that can be shared by all the class objects. 

**3. What does a constructor do?**  
Constructor is used to initialize the class fields or create instance of the class. If there is no constructor then compiler provides a default constructor

**4. Why is the partial keyword useful?**  
The partial keyword indicates that other parts of the class, struct, or interface can be defined in the namespace

**5. What is a tuple?**  
a data structure which consists of the multiple parts

**6. What does the C# record keyword do?**     
a new reference type that you can create instead of classes

**7. What does overloading and overriding mean?**  
Overloading occurs when two or more methods in one class have the same method name but different parameters. Overriding occurs when two methods have the same method name and parameters

**8. What is the difference between a field and a property?**  
A field is a variable of any type that is declared directly in a class. A property is a member that provides a flexible mechanism to read, write or compute the value of a private field.

**9. How do you make a method parameter optional?**  
set default value in args

**10. What is an interface and how is it different from abstract class?**  
An abstract class permits you to make functionality that subclasses can implement or override whereas an interface only permits you to state functionality but not to implement it.

**11. What accessibility level are members of an interface?**  
Interface members implicitly have public declared accessibility. No access modifiers are allowed on interface member declarations.

**12. True/False. Polymorphism allows derived classes to provide different implementations of the same method.**  
True

**13. True/False. The override keyword is used to indicate that a method in a derived class is providing its own implementation of a method.**  
True

**14. True/False. The new keyword is used to indicate that a method in a derived class is providing its own implementation of a method.**  
False

**15. True/False. Abstract methods can be used in a normal (non-abstract) class.**  
True

**16. True/False. Normal (non-abstract) methods can be used in an abstract class.**  
False

**17. True/False. Derived classes can override methods that were virtual in the base class.**  
True

**18. True/False. Derived classes can override methods that were abstract in the base class.**  
True

**19. True/False. In a derived class, you can override a method that was neither virtual non abstract in  base class.**  
False

**20. True/False. A class that implements an interface does not have to provide an implementation for all of the members of the interface.**  
True

**21. True/False. A class that implements an interface is allowed to have other members that aren’t defined in the interface.**  
True

**22. True/False. A class can have more than one base class.**  
False

**23. True/False. A class can implement more than one interface.**  
True