INSERT OR IGNORE INTO quizzes(id, user_id, title, description,status) 
VALUES (3 , 6038394083, "Java 101", "Simple Java questions for starter!","published");

INSERT INTO questions(quiz_id, media_url, question, options, status, explanation)
VALUES
-- Types: int, float, double, char, boolean, etc.
(3, NULL, 'Which of these is NOT a valid Java primitive type?', 'int, float, string, boolean', 'published', 'string is not a primitive type in Java.'),
(3, NULL, 'What is the default value of a boolean variable in Java?', 'false, true, 0, null', 'published', 'The default value is false.'),
(3, NULL, 'Which data type is used to store a single character in Java?', 'char, string, character, byte', 'published', 'char is used for single characters.'),
(3, NULL, 'Which of these can store decimal values?', 'float, int, char, boolean', 'published', 'float can store decimal values.'),

-- Loops: for, while, do-while
(3, 'https://upload.wikimedia.org/wikipedia/commons/8/8c/Do-while-loop-diagram.png', 'Which loop is guaranteed to execute at least once?', 'do-while, for, while, foreach', 'published', 'do-while executes the body at least once.'),
(3, NULL, 'Which keyword is used to exit a loop early in Java?', 'break, exit, stop, return', 'published', 'break exits a loop early.'),
(3, 'https://upload.wikimedia.org/wikipedia/commons/1/18/For-loop-diagram.png', 'How do you write a for loop that counts from 0 to 4?', 'for(int i=0;i<5;i++), for(int i=1;i<=5;i++), for(int i=0;i<=4;i++), for(int i=1;i<5;i++)', 'published', 'for(int i=0;i<5;i++) counts from 0 to 4.'),

-- Classes and Objects
(3, NULL, 'Which keyword is used to create a new object in Java?', 'new, create, object, alloc', 'published', 'new is used to create objects.'),
(3, 'https://upload.wikimedia.org/wikipedia/commons/7/74/Java_Class_Hierarchy.png', 'What is the correct way to define a class in Java?', 'class MyClass { }, define MyClass { }, object MyClass { }, struct MyClass { }', 'published', 'class MyClass { } is correct.'),

-- Methods
(3, NULL, 'Which keyword is used to define a method that does not return a value?', 'void, null, empty, none', 'published', 'void means the method does not return a value.'),
(3, NULL, 'How do you call a method named foo on object bar?', 'bar.foo(), foo.bar(), bar->foo(), foo->bar()', 'published', 'bar.foo() calls the method.'),

-- Conditionals
(3, NULL, 'Which keyword is used for an alternative condition in Java?', 'else, elseif, elif, otherwise', 'published', 'else is used for alternative conditions.'),

-- Arrays
(3, 'https://upload.wikimedia.org/wikipedia/commons/3/3a/Java_array_example.png', 'How do you declare an array of integers in Java?', 'int[] arr;, array int arr;, int arr[];, arr int[];', 'published', 'int[] arr; or int arr[]; are both valid.'),

-- Strings
(3, NULL, 'Which class is used to work with strings in Java?', 'String, string, Text, str', 'published', 'String is the correct class.'),

-- Access Modifiers
(3, NULL, 'Which access modifier makes a member visible only within its own class?', 'private, public, protected, default', 'published', 'private restricts access to the class itself.'),

-- Static Keyword
(3, NULL, 'What does the static keyword mean in Java?', 'Belongs to the class, Belongs to the object, Is constant, Is final', 'published', 'static means the member belongs to the class, not instances.'),

-- Main Method
(3, NULL, 'What is the correct signature for the main method in Java?', 'public static void main(String[] args), void main(String[] args), public void main(String args[]), static public main(String[] args)', 'published', 'public static void main(String[] args) is correct.'),

-- Inheritance
(3, 'https://upload.wikimedia.org/wikipedia/commons/7/7e/Java_Inheritance.png', 'Which keyword is used for inheritance in Java?', 'extends, implements, inherits, super', 'published', 'extends is used for inheritance.'),

-- Interfaces
(3, NULL, 'Which keyword is used to implement an interface?', 'implements, extends, interface, inherit', 'published', 'implements is used for interfaces.'),

-- Exception Handling
(3, 'https://upload.wikimedia.org/wikipedia/commons/6/6a/Java_try-catch-finally.png', 'Which block is used to handle exceptions in Java?', 'try-catch, if-else, do-while, switch-case', 'published', 'try-catch is used for exception handling.'),

-- Packages
(3, NULL, 'Which keyword is used to declare a package in Java?', 'package, import, namespace, module', 'published', 'package is used to declare a package.'),

-- Importing Classes
(3, NULL, 'How do you import a class from another package?', 'import, include, require, using', 'published', 'import is used to bring in classes from other packages.'),

-- Comments
(3, NULL, 'How do you write a single-line comment in Java?', '//, #, --, <!--', 'published', '// is used for single-line comments.'),

-- Final Keyword
(3, NULL, 'What does the final keyword mean in Java?', 'Cannot be changed, Is static, Is public, Is private', 'published', 'final means the value cannot be changed.'),

-- Constructors
(3, 'https://upload.wikimedia.org/wikipedia/commons/9/9d/Java_constructor_example.png', 'What is a constructor in Java?', 'A special method to initialize objects, A method to destroy objects, A static method, An interface', 'published', 'A constructor initializes new objects.'),

-- Garbage Collection
(3, 'https://upload.wikimedia.org/wikipedia/commons/6/6a/Java_Garbage_Collection.png', 'What is garbage collection in Java?', 'Automatic memory management, Manual memory allocation, File deletion, Data sorting', 'published', 'Garbage collection automatically frees unused memory.'),

-- Overloading
(3, NULL, 'What is method overloading?', 'Defining multiple methods with the same name but different parameters, Using the same method in different classes, Inheriting methods, Overriding methods', 'published', 'Overloading means same name, different parameters.'),

-- Overriding
(3, NULL, 'What is method overriding?', 'Redefining a method in a subclass, Defining multiple methods with same name, Using static methods, Creating interfaces', 'published', 'Overriding means redefining a method in a subclass.'),

-- Polymorphism
(3, 'https://upload.wikimedia.org/wikipedia/commons/2/2a/Polymorphism.png', 'What is polymorphism in Java?', 'Ability to take many forms, Memory management, Data hiding, Code duplication', 'published', 'Polymorphism allows objects to be treated as instances of their parent class.'),

-- Encapsulation
(3, NULL, 'What is encapsulation?', 'Wrapping data and code together, Inheriting classes, Overloading methods, Using interfaces', 'published', 'Encapsulation means wrapping data and methods together.'),

-- Abstraction
(3, NULL, 'What is abstraction in Java?', 'Hiding implementation details, Inheriting classes, Overloading methods, Using static methods', 'published', 'Abstraction hides complex implementation details.'),

-- This Keyword
(3, NULL, 'What does the this keyword refer to?', 'Current object, Parent class, Static method, Package', 'published', 'this refers to the current object.'),

-- Super Keyword
(3, NULL, 'What does the super keyword refer to?', 'Parent class, Current object, Static method, Interface', 'published', 'super refers to the parent class.'),

-- Null Reference
(3, NULL, 'What does null mean in Java?', 'No object reference, Zero, Empty string, False', 'published', 'null means no object is referenced.'),

-- Wrapper Classes
(3, NULL, 'Which is a wrapper class for int?', 'Integer, Int, Number, Double', 'published', 'Integer is the wrapper class for int.'),

-- String Comparison
(3, NULL, 'How do you compare two strings for equality in Java?', 'equals(), ==, compare(), isEqual()', 'published', 'equals() compares string values.'),

-- Array Length
(3, NULL, 'How do you get the length of an array arr?', 'arr.length, arr.length(), length(arr), arr.size()', 'published', 'arr.length gives the array length.'),

-- Variable Declaration
(3, NULL, 'Which is the correct way to declare a variable in Java?', 'int x = 5;, x int = 5;, var int x = 5;, declare int x = 5;', 'published', 'int x = 5; is correct.'),

-- Main Class
(3, NULL, 'What is the name of the file that contains the main class?', 'Same as the class name, Any name, Main.java, Program.java', 'published', 'The file name must match the public class name.'),

-- Public Keyword
(3, NULL, 'What does the public keyword mean?', 'Accessible from anywhere, Accessible only in class, Static, Final', 'published', 'public means accessible from anywhere.'),

-- System.out.println
(3, 'https://upload.wikimedia.org/wikipedia/commons/2/2e/Java_output_example.png', 'What does System.out.println do?', 'Prints output to console, Reads input, Declares a variable, Exits program', 'published', 'System.out.println prints to the console.'),

-- Java File Extension
(3, NULL, 'What is the file extension for Java source files?', '.java, .class, .js, .jav', 'published', '.java is the correct extension.'),

-- Compilation
(3, 'https://upload.wikimedia.org/wikipedia/commons/7/7a/Javac_compilation.png', 'Which command compiles a Java file?', 'javac, java, compile, run', 'published', 'javac compiles Java files.'),

-- Running Java Program
(3, 'https://upload.wikimedia.org/wikipedia/commons/2/2e/Java_output_example.png', 'Which command runs a compiled Java program?', 'java, javac, run, execute', 'published', 'java runs the compiled program.'),

-- Comments: Multi-line
(3, NULL, 'How do you write a multi-line comment in Java?', '/* ... */, // ..., <!-- ... -->, # ...', 'published', '/* ... */ is used for multi-line comments.')
;