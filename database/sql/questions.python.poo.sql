-- Create or ignore existing quiz entry
INSERT OR IGNORE INTO quizzes(id, user_id, title, description, status)
VALUES (7, 6038394083, "Python POO", "Simple Python POO questions for starter!", "published");

-- Delete existing questions for this quiz to avoid duplication
DELETE FROM questions WHERE quiz_id = 7;

-- Insert 30 Python OOP Questions
INSERT INTO questions(quiz_id, media_url, question, options, status, explanation) VALUES

-- 1
(
    7,
    NULL,
    'What keyword is used to define a class in Python?
```python
class MyClass:
    pass
```',
    'class|def|object|new',
    'published',
    'The "class" keyword is used to define a class in Python.'
),

-- 2
(
    7,
    NULL,
    'Which method is called automatically when an object is created?
```python
class Dog:
    def __init__(self, name):
        self.name = name
```',
    '__init__|__start__|__create__|__new__',
    'published',
    '__init__ is the constructor method called when an object is instantiated.'
),

-- 3
(
    7,
    NULL,
    'What is the output of this code?
```python
class Car:
    def __init__(self, color):
        self.color = color

car1 = Car("red")
car2 = Car("blue")
print(car1.color)
```',
    'red|blue|None|Error',
    'published',
    'car1.color was assigned "red" during initialization.'
),

-- 4
(
    7,
    NULL,
    'How do you define a method inside a class?
```python
class Person:
    def greet(self):
        print("Hello")
```',
    'def within class|function within class|method|lambda',
    'published',
    'Methods are defined with "def" inside the class body.'
),

-- 5
(
    7,
    NULL,
    'What does self refer to in a class?
```python
class Cat:
    def __init__(self, name):
        self.name = name
```',
    'Instance of the class|Class itself|Other instance|Nothing',
    'published',
    '"self" refers to the instance of the class being created or used.'
),

-- 6
(
    7,
    NULL,
    'What is the output?
```python
class Student:
    school = "ABC High"

print(Student.school)
```',
    'ABC High|None|Error|"school"',
    'published',
    'Class attributes can be accessed directly via the class name.'
),

-- 7
(
    7,
    NULL,
    'What is the output?
```python
class Point:
    def __init__(self, x=0, y=0):
        self.x = x
        self.y = y

p = Point()
print(p.x, p.y)
```',
    '0 0|None None|Error|1 1',
    'published',
    'Default values are used if no arguments are passed to the constructor.'
),

-- 8
(
    7,
    NULL,
    'How do you create an instance of a class in Python?
```python
class Book:
    pass

# Create instance here
```',
    'Book()|new Book()|book.new()|instance(Book)',
    'published',
    'You create an instance by calling the class like a function: Book().'
),

-- 9
(
    7,
    NULL,
    'What will happen?
```python
class Animal:
    pass

a = Animal()
print(type(a))
```',
    "<class 'Animal'>|<class 'object'>|Error|None",
    'published',
    'The type of an instance shows the class it was created from.'
),

-- 10
(
    7,
    NULL,
    'What is the output?
```python
class Counter:
    count = 0

    def increment(self):
        self.count += 1

c1 = Counter()
c2 = Counter()
c1.increment()
print(c2.count)
```',
    '0|1|2|Error',
    'published',
    'When accessing count via c1, it becomes an instance attribute; c2 still sees the class variable.'
),

-- 11
(
    7,
    NULL,
    'What concept allows multiple inheritance in Python?
```python
class Child(Parent1, Parent2):
    pass
```',
    'Multiple Inheritance|Polymorphism|Encapsulation|Hierarchical Inheritance',
    'published',
    'Python supports multiple inheritance where a class can inherit from more than one parent.'
),

-- 12
(
    7,
    NULL,
    'What is the output?
```python
class A:
    def say(self):
        print("A")

class B(A):
    pass

b = B()
b.say()
```',
    'A|B|nothing|Error',
    'published',
    'B inherits the say() method from A and uses it.'
),

-- 13
(
    7,
    NULL,
    'What is the output?
```python
class X:
    def hello(self):
        print("X")

class Y(X):
    def hello(self):
        print("Y")

y = Y()
y.hello()
```',
    'Y|X|Both|Error',
    'published',
    'Method overriding allows a child class to redefine a method from the parent.'
),

-- 14
(
    7,
    NULL,
    'How do you call the parent class''s constructor?
```python
class Child(Parent):
    def __init__(self):
        super().__init__()
```',
    'super().__init__()|Parent.__init__()|self.__init__()|both',
    'published',
    'super().__init__() is the preferred way to call the parent class’s constructor.'
),

-- 15
(
    7,
    NULL,
    'Which principle restricts direct access to some components of an object?
```python
class BankAccount:
    def __init__(self):
        self.__balance = 0
```',
    'Encapsulation|Inheritance|Polymorphism|Abstraction',
    'published',
    'Encapsulation hides internal details using private variables (e.g., __balance).'
),

-- 16
(
    7,
    NULL,
    'What is the output?
```python
class Test:
    def __init__(self):
        self.__a = 10

t = Test()
print(t.__a)
```',
    'AttributeError|10|None|NameError',
    'published',
    'Private attributes cannot be accessed directly outside the class.'
),

-- 17
(
    7,
    NULL,
    'Which statement about abstraction is true?
```python
from abc import ABC, abstractmethod

class Shape(ABC):
    @abstractmethod
    def area(self):
        pass
```',
    'Abstract classes prevent instantiation|Abstract methods have implementation|Concrete classes use ABCMeta|None',
    'published',
    'Abstract classes cannot be instantiated unless all abstract methods are overridden.'
),

-- 18
(
    7,
    NULL,
    'Which error occurs when trying to instantiate an abstract class without implementing its abstract method?
```python
class Circle(Shape):
    pass

c = Circle()
```',
    'TypeError|ValueError|SyntaxError|NameError',
    'published',
    'Cannot instantiate abstract class without implementing all abstract methods.'
),

-- 19
(
    7,
    NULL,
    'What is the purpose of polymorphism?
```python
class Rectangle:
    def draw(self):
        print("Rectangle")

class Circle:
    def draw(self):
        print("Circle")

def render(shape):
    shape.draw()
```',
    'Same interface, different behavior|Same behavior for all objects|Hiding data|Code reuse',
    'published',
    'Polymorphism allows different classes to be used interchangeably through a common interface.'
),

-- 20
(
    7,
    NULL,
    'What is the output?
```python
class Bird:
    def fly(self):
        print("Flies")

class Airplane(Bird):
    def fly(self):
        print("Airplane flies")

for obj in [Bird(), Airplane()]:
    obj.fly()
```',
    'Flies\\nAirplane flies|Bird\\nAirplane|Error|None',
    'published',
    'Polymorphism allows calling the same method on different objects with different results.'
),

-- 21
(
    7,
    NULL,
    'Which keyword defines an interface-like structure in Python?
```python
from abc import ABC, abstractmethod

class Interface(ABC):
    @abstractmethod
    def method(self):
        pass
```',
    'abstract|interface|abstractmethod|None',
    'published',
    'Using ABC and abstractmethod creates an interface-like structure.'
),

-- 22
(
    7,
    NULL,
    'What is composition in OOP?
```python
class Engine:
    def start(self):
        print("Engine started")

class Car:
    def __init__(self):
        self.engine = Engine()
```',
    'Using objects as parts of other objects|Child-parent relationship|Data hiding|Multiple inheritance',
    'published',
    'Composition involves building complex objects from simpler ones as components.'
),

-- 23
(
    7,
    NULL,
    'What is the output?
```python
class A:
    def __init__(self):
        print("A")

class B(A):
    def __init__(self):
        print("B")
        super().__init__()

B()
```',
    'B then A|A then B|Only B|Only A',
    'published',
    'Calling super().__init__() executes the parent class constructor after the child’s.'
),

-- 24
(
    7,
    NULL,
    'What is the output?
```python
class Person:
    def __init__(self, name):
        self._name = name

p = Person("Alice")
print(p._name)
```',
    'Alice|Error|None|Protected',
    'published',
    'Single underscore indicates protected members, but it’s not enforced strictly in Python.'
),

-- 25
(
    7,
    NULL,
    'Which of these correctly describes encapsulation?
```python
class Person:
    def __init__(self, age):
        self.__age = age

    def get_age(self):
        return self.__age
```',
    'Hiding data behind methods|Allowing multiple constructors|Reusing code|Inheriting from multiple classes',
    'published',
    'Encapsulation hides internal state and only exposes it through controlled methods.'
),

-- 26
(
    7,
    NULL,
    'Which operator checks if an object is an instance of a class?
```python
class Animal:
    pass

a = Animal()
print(isinstance(a, Animal))
```',
    'isinstance|type|classof|typeof',
    'published',
    'isinstance(obj, Class) checks whether obj is an instance of the given class.'
),

-- 27
(
    7,
    NULL,
    'Which keyword prevents overriding a method?
```python
class Base:
    def foo(self):
        print("Base foo")

class Derived(Base):
    def foo(self):
        print("Derived foo")
```',
    'No keyword exists|final|sealed|static',
    'published',
    'Python does not enforce final methods natively, though it can be simulated.'
),

-- 28
(
    7,
    NULL,
    'What is the output?
```python
class MyMeta(type):
    pass

class MyClass(metaclass=MyMeta):
    pass

print(type(MyClass))
```',
    '<class ''MyMeta''>|<class ''type''>|Error|None',
    'published',
    'A metaclass controls how a class is created — here, MyClass has a custom metaclass.'
),

-- 29
(
    7,
    NULL,
    'What is a class method decorated with @classmethod able to modify?
```python
class Pizza:
    size = "large"

    @classmethod
    def change_size(cls, new_size):
        cls.size = new_size
```',
    'Class attributes|Instance attributes|Global variables|Local variables',
    'published',
    '@classmethod receives the class as the first argument and can modify class-level attributes.'
),

-- 30
(
    7,
    NULL,
    'What is the output?
```python
class Math:
    @staticmethod
    def add(x, y):
        return x + y

print(Math.add(2, 3))
```',
    '5|Error|None|Math',
    'published',
    'Static methods belong to the class but do not receive any special first argument.'
);