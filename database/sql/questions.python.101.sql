INSERT OR IGNORE INTO quizzes(id, user_id, title, description,status) VALUES (2 , 6038394083, "Python 101", "Simple python questions for starter!","published");

INSERT INTO questions(quiz_id, media_url, question, options, status, explanation)
VALUES
(2, NULL, "Which of these is NOT a Python data type?", "integer|string|character|list", "published", "Python does not have a character data type."),
(2, "https://media.giphy.com/media/3o7aD2saalBwwftBIY/giphy.gif", "What is the output of print(2 ** 3)?", "8|6|9|5", "published", "** is the exponentiation operator, so 2 ** 3 = 8."),
(2, NULL, "Which keyword is used to define a function in Python?", "def|func|function|define", "published", "The 'def' keyword is used to define a function in Python."),
(2, NULL, "What is the correct file extension for Python files?", ".py|.python|.pt|.pyt", "published", "Python files use the .py extension."),
(2, NULL, "How do you write a comment in Python?", "# This is a comment|// This is a comment|<!-- This is a comment -->|-- This is a comment", "published", "Comments in Python start with the # symbol."),
(2, NULL, "Which of the following is used to get input from the user?", "input()|scan()|get()|read()", "published", "The input() function is used to get input from the user."),

(2, NULL, "Which of these is a valid variable name in Python?", "my_var|2var|my-var|my var", "published", "my_var is a valid variable name. Variable names cannot start with a number or contain spaces or hyphens."),
(2, NULL, "What will print(10 // 3) output?", "3|3.33|3.0|4", "published", "// is integer division, so 10 // 3 = 3."),
(2, NULL, "Which function returns the type of an object in Python?", "type()|typeof()|gettype()|objecttype()", "published", "The type() function returns the type of an object."),
(2, NULL, "What is the type of the value 3.14 in Python?", "float|int|str|complex", "published", "3.14 is a floating-point number, so its type is float."),
(2, NULL, "What is the type of the value True in Python?", "bool|int|str|NoneType", "published", "True is a boolean value, so its type is bool."),
(2, NULL, "What is the type of the value None in Python?", "NoneType|null|undefined|None", "published", "The type of None is NoneType in Python."),
(2, NULL, "What is the output of type([1, 2, 3])?", "<class list>|<class tuple>|<class set>|<class dict>", "published", "The type of [1, 2, 3] is <class list>."),
(2, NULL, "What is the output of type({'a': 1})?", "<class dict>|<class list>|<class set>|<class tuple>", "published", "The type of {'a': 1} is <class dict>."),
(2, NULL, "What is the output of type((1, 2, 3))?", "<class tuple>|<class list>|<class set>|<class dict>", "published", "The type of (1, 2, 3) is <class tuple>."),
(2, NULL, "What is the output of type({1, 2, 3})?", "<class set>|<class list>|<class tuple>|<class dict>", "published", "The type of {1, 2, 3} is <class set>."),
(2, NULL, "What is the type of the value '123' in Python?", "str|int|float|list", "published", "'123' is a string, so its type is str."),
(2, NULL, "What is the output of type(10)?", "<class 'int'>|<class 'float'>|<class 'str'>|<class 'bool'>", "published", "The type of 10 is <class int>."),
-- INTEGER
(2, NULL, "Which of the following is an integer in Python?", "10|10.0|'10'|[10]", "published", "10 is an integer. 10.0 is a float, '10' is a string, [10] is a list."),
(2, NULL, "What will be the output of type(-5)?", "<class int>|<class float>|<class str>|<class bool>", "published", "Negative numbers like -5 are still integers."),
(2, NULL, "Which function converts a string '123' to an integer?", "int()|str()|float()|list()", "published", "int('123') converts the string to an integer."),
(2, NULL, "What is the result of 5 // 2 in Python?", "2|2.5|3|2.0", "published", "// is integer division, so 5 // 2 = 2."),
(2, NULL, "Which of these is NOT an integer?", "7|0|3.0|-1", "published", "3.0 is a float, not an integer."),
(2, NULL, "What is the type of True + 1 in Python?", "<class int>|<class bool>|<class float>|<class str>", "published", "True is treated as 1, so True + 1 = 2, which is an int."),
(2, NULL, "What is the output of int(3.99)?", "3|4|3.99|Error", "published", "int() truncates the decimal part, so int(3.99) = 3."),
(2, NULL, "Which of these is a valid way to declare an integer variable?", "x = 5|int x = 5|x := 5|var x = 5", "published", "x = 5 is the correct way in Python."),
(2, NULL, "What is the output of type(0)?", "<class int>|<class float>|<class str>|<class bool>", "published", "0 is an integer."),
-- String

(2, NULL, "What is the output of type('Python')?", "<class str>|<class int>|<class list>|<class tuple>", "published", "'Python' is a string."),
(2, NULL, "How do you concatenate two strings a and b?", "a + b|a & b|a . b|concat(a, b)", "published", "a + b concatenates two strings."),
(2, NULL, "Which function converts an integer 10 to a string?", "str()|int()|float()|list()", "published", "str(10) converts 10 to '10'."),
(2, NULL, "What is the output of 'abc'.upper()?", "ABC|abc|Abc|error", "published", "The upper() method returns 'ABC'."),
(2, NULL, "Which of these is NOT a string method?", "append()|lower()|replace()|split()", "published", "append() is a list method, not a string method."),
(2, NULL, "How do you get the length of a string s?", "len(s)|s.length()|length(s)|s.len()", "published", "len(s) returns the length of a string."),
(2, NULL, "What is the output of 'a' * 3?", "'aaa'|'a3'|'3a'|error", "published", "'a' * 3 repeats the string 3 times."),
(2, NULL, "What is the output of type(str(123))?", "<class str>|<class int>|<class float>|<class list>", "published", "str(123) returns a string."),
-- float
(2, NULL, "Which of the following is a float in Python?", "3.14|3|'3.14'|[3.14]", "published", "3.14 is a float."),
(2, NULL, "What is the output of type(2.0)?", "<class float>|<class int>|<class str>|<class complex>", "published", "2.0 is a float."),
(2, NULL, "Which function converts a string '3.5' to a float?", "float()|int()|str()|list()", "published", "float('3.5') converts the string to a float."),
(2, "https://media.giphy.com/media/3o6Zt8zb1P6vF3x2yY/giphy.gif", "What is the result of 1 / 2 in Python 3?", "0.5|0|1|2", "published", "/ always returns a float in Python 3."),
(2, NULL, "What is the output of float(5)?", "5.0|5|'5.0'|error", "published", "float(5) returns 5.0."),
(2, NULL, "Which of these is NOT a float?", "0.0|1.5|2|-3.14", "published", "2 is an integer, not a float."),
(2, NULL, "What is the output of type(0.0)?", "<class 'float'>|<class 'int'>|<class 'str'>|<class 'bool'>", "published", "0.0 is a float."),
(2, NULL, "What is the output of float('2.5')?", "2.5|'2.5'|error|2", "published", "float('2.5') returns 2.5."),
(2, NULL, "Which of these is a valid way to declare a float variable?", "x = 1.5|float x = 1.5|x := 1.5|var x = 1.5", "published", "x = 1.5 is the correct way in Python."),
(2, NULL, "What is the output of type(float('3'))?", "<class 'float'>|<class 'int'>|<class 'str'>|<class 'list'>", "published", "float('3') returns a float."),
-- list
(2, NULL, "Which of the following is a list in Python?", "[1, 2, 3]|(1, 2, 3)|{1, 2, 3}|{'a': 1}", "published", "[1, 2, 3] is a list."),
(2, NULL, "What is the output of type([1, 2, 3])?", "<class 'list'>|<class 'tuple'>|<class 'set'>|<class 'dict'>", "published", "[1, 2, 3] is a list."),
(2, NULL, "Which method adds an item to the end of a list?", "append()|add()|insert()|extend()", "published", "append() adds an item to the end of a list."),
(2, NULL, "How do you access the first element of a list l?", "l[0]|l(0)|l{0}|l.0", "published", "l[0] accesses the first element."),
(2, NULL, "Which of these is NOT a list method?", "pop()|remove()|push()|insert()", "published", "push() is not a list method."),
(2, NULL, "How do you get the length of a list l?", "len(l)|l.length()|length(l)|l.len()", "published", "len(l) returns the length of a list."),
(2, NULL, "What is the output of [1, 2] + [3, 4]?", "[1, 2, 3, 4]|[4, 6]|[1, 2][3, 4]|error", "published", "Adding lists concatenates them."),
(2, NULL, "Which of these creates an empty list?", "[]|list()|both|none", "published", "Both [] and list() create an empty list."),
(2, NULL, "What is the output of type(list('abc'))?", "<class 'list'>|<class 'str'>|<class 'tuple'>|<class 'set'>", "published", "list('abc') returns a list of characters."),
(2, NULL, "Which of these is a valid list comprehension?", "[x for x in range(5)]|(x for x in range(5))|{x for x in range(5)}|<x for x in range(5)>", "published", "[x for x in range(5)] is a list comprehension."),
-- tuple
(2, NULL, "Which of the following is a tuple in Python?", "(1, 2, 3)|[1, 2, 3]|{1, 2, 3}|{'a': 1}", "published", "(1, 2, 3) is a tuple."),
(2, NULL, "What is the output of type((1, 2, 3))?", "<class 'tuple'>|<class 'list'>|<class 'set'>|<class 'dict'>", "published", "(1, 2, 3) is a tuple."),
(2, NULL, "Which of these is an empty tuple?", "()|[]|{}|None", "published", "() is an empty tuple."),
(2, NULL, "How do you access the second element of a tuple t?", "t[1]|t(1)|t{1}|t.1", "published", "t[1] accesses the second element."),
(2, NULL, "Which of these is NOT a tuple?", "(1,)|[1]|(1)|('a',)", "published", "[1] is a list, not a tuple."),
(2, NULL, "What is the output of type(tuple([1, 2]))?", "<class 'tuple'>|<class 'list'>|<class 'set'>|<class 'dict'>", "published", "tuple([1, 2]) returns a tuple."),
(2, NULL, "Which of these is a valid tuple with one element?", "(1,)|(1)|[1]|{1}", "published", "(1,) is a tuple with one element."),
(2, NULL, "Are tuples mutable in Python?", "No|Yes|Sometimes|Only with numbers", "published", "Tuples are immutable."),
(2, NULL, "Which function converts a list to a tuple?", "tuple()|list()|set()|dict()", "published", "tuple() converts a list to a tuple."),
(2, NULL, "What is the output of (1, 2) + (3, 4)?", "(1, 2, 3, 4)|[1, 2, 3, 4]|(4, 6)|error", "published", "Adding tuples concatenates them."),
-- dict
(2, NULL, "Which of the following is a dictionary in Python?", "{'a': 1, 'b': 2}|[1, 2]|(1, 2)|{1, 2}", "published", "{'a': 1, 'b': 2} is a dictionary."),
(2, NULL, "What is the output of type({'a': 1})?", "<class 'dict'>|<class 'list'>|<class 'set'>|<class 'tuple'>", "published", "{'a': 1} is a dictionary."),
(2, NULL, "Which method returns all keys of a dictionary d?", "d.keys()|d.values()|d.items()|d.get()", "published", "d.keys() returns all keys."),
(2, NULL, "How do you access the value for key 'a' in d = {'a': 1}?", "d['a']|d.a|d.get('a')|both d['a'] and d.get('a')", "published", "Both d['a'] and d.get('a') are valid."),
(2, NULL, "Which of these is NOT a dictionary method?", "append()|get()|items()|keys()", "published", "append() is not a dictionary method."),
(2, NULL, "How do you add a new key-value pair to a dictionary d?", "d['new'] = 5|d.add('new', 5)|d.append('new', 5)|d.insert('new', 5)", "published", "d['new'] = 5 adds a new key-value pair."),
(2, NULL, "What is the output of type(dict([('a', 1)]))?", "<class 'dict'>|<class 'list'>|<class 'set'>|<class 'tuple'>", "published", "dict([('a', 1)]) returns a dictionary."),
(2, NULL, "Which of these creates an empty dictionary?", "{}|dict()|both|none", "published", "Both {} and dict() create an empty dictionary."),
(2, NULL, "What is the output of d = {'a': 1}; d['b'] = 2; print(d)?", "{'a': 1, 'b': 2}|{'a': 1}|{'b': 2}|error", "published", "The dictionary now has both keys."),
(2, NULL, "Which of these is a valid dictionary comprehension?", "{k: v for k, v in [('a', 1)]}|[k: v for k, v in [('a', 1)]]|(k: v for k, v in [('a', 1)])|<k: v for k, v in [('a', 1)]>", "published", "{k: v for k, v in [('a', 1)]} is a dictionary comprehension."),
-- set
(2, NULL, "Which of the following is a set in Python?", "{1, 2, 3}|[1, 2, 3]|(1, 2, 3)|{'a': 1}", "published", "{1, 2, 3} is a set."),
(2, NULL, "What is the output of type({1, 2, 3})?", "<class 'set'>|<class 'list'>|<class 'tuple'>|<class 'dict'>", "published", "{1, 2, 3} is a set."),
(2, NULL, "Which method adds an element to a set s?", "s.add()|s.append()|s.insert()|s.push()", "published", "s.add() adds an element to a set."),
(2, NULL, "How do you create an empty set?", "set()|{}|[]|()", "published", "set() creates an empty set. {} creates an empty dictionary."),
(2, NULL, "Which of these is NOT a set method?", "add()|remove()|pop()|append()", "published", "append() is not a set method."),
(2, NULL, "What is the output of set([1, 2, 2, 3])?", "{1, 2, 3}|[1, 2, 2, 3]|(1, 2, 2, 3)|error", "published", "Sets do not allow duplicates."),
(2, NULL, "Which operator is used for set union?", "|&|+|-", "published", "| is the union operator for sets."),
(2, NULL, "What is the output of type(set('abc'))?", "<class 'set'>|<class 'list'>|<class 'tuple'>|<class 'dict'>", "published", "set('abc') returns a set of characters."),
(2, NULL, "Are sets mutable in Python?", "Yes|No|Sometimes|Only with numbers", "published", "Sets are mutable."),
(2, NULL, "Which of these removes all elements from a set s?", "s.clear()|s.remove()|s.pop()|s.delete()", "published", "s.clear() removes all elements."),
-- function definition
(2, NULL, "Which keyword is used to define a function in Python?", "def|function|define|func", "published", "The 'def' keyword is used to define a function."),
(2, "https://media.giphy.com/media/3oEjI6SIIHBdRxXI40/giphy.gif", "Which of the following is a correct function definition in Python?", "def foo():|function foo():|define foo():|func foo():", "published", "def foo(): is the correct way to define a function."),
(2, NULL, "How do you define a function that takes two arguments?", "def f(a, b):|def f(a; b):|def f(a b):|def f[a, b]:", "published", "def f(a, b): is correct."),
(2, NULL, "What is the output of def f(): return 1; print(f())?", "1|f|None|error", "published", "The function returns 1."),
(2, NULL, "Which of these is NOT a valid function name?", "1func|func1|_func|func_", "published", "Function names cannot start with a number."),
(2, NULL, "How do you call a function foo?", "foo()|call foo()|foo[]|foo{}", "published", "foo() calls the function."),
(2, NULL, "Which keyword is used to return a value from a function?", "return|yield|output|break", "published", "return is used to return a value."),
(2, NULL, "What is the default return value of a function with no return statement?", "None|0|''|error", "published", "Functions return None by default."),
(2, NULL, "Which of these defines a function with no arguments?", "def f():|def f[]|def f{}|def f:", "published", "def f(): is correct."),
(2, NULL, "How do you define a function with a default argument?", "def f(x=1):|def f(x==1):|def f(x:1):|def f(x, 1):", "published", "def f(x=1): sets a default value."),
-- main to execute python code
(2, NULL, "What is the correct way to check if a Python script is being run directly?", "if __name__ == '__main__':|if main():|if __main__ == '__name__':|if __name__ = '__main__':", "published", "if __name__ == '__main__': is the correct way."),
(2, NULL, "What is the value of __name__ when a script is imported?", "'__main__'|__import__|__name__|module name", "published", "When imported, __name__ is set to the module name."),
(2, NULL, "Where should the main code of a script be placed?", "Inside if __name__ == '__main__':|At the top|Inside a function|Anywhere", "published", "Main code should be inside if __name__ == '__main__':."),
(2, NULL, "What does if __name__ == '__main__': do?", "Checks if script is run directly|Checks for main function|Imports modules|None", "published", "It checks if the script is run directly."),
(2, NULL, "Which of these is a valid main function definition?", "def main():|function main():|main():|def main[]:", "published", "def main(): is correct."),
(2, NULL, "How do you call the main function in Python?", "main()|call main()|run main()|main[]", "published", "main() calls the function."),
(2, NULL, "What is the output of print(__name__) when run directly?", "'__main__'|'__name__'|'main'|'script'", "published", "It prints '__main__'."),
(2, NULL, "Can you have multiple if __name__ == '__main__': blocks?", "Yes|No|Only in functions|Only in classes", "published", "You can have multiple, but it is not recommended."),
(2, NULL, "What is the purpose of __name__ variable?", "To check script context|To define functions|To import modules|None", "published", "It checks if the script is run directly or imported."),
(2, NULL, "Which of these is NOT related to script execution?", "def|__name__|__main__|import", "published", "def is for function definition."),
-- loop for
(2, "https://media.giphy.com/media/3o6Zt481isNVuQI1l6/giphy.gif", "Which of the following is a correct for loop in Python?", "for i in range(5):|for (i=0; i<5; i++):|foreach i in range(5):|loop i in range(5):", "published", "for i in range(5): is the correct syntax."),
(2, NULL, "What is the output of for i in range(3): print(i)?", "0 1 2|1 2 3|0 1 2 3|1 2", "published", "range(3) gives 0, 1, 2."),
(2, NULL, "Which function is commonly used with for loops?", "range()|list()|dict()|set()", "published", "range() is commonly used."),
(2, NULL, "How do you iterate over a list l?", "for x in l:|for x of l:|foreach x in l:|loop x in l:", "published", "for x in l: is correct."),
(2, NULL, "Which of these is NOT a valid for loop?", "for i in 5:|for i in range(5):|for x in [1,2]:|for c in 'abc':", "published", "for i in 5: is not valid."),
(2, NULL, "How do you loop over both index and value in a list?", "for i, v in enumerate(l):|for i in l:|for v in l:|for i, v in l:", "published", "enumerate() gives index and value."),
(2, NULL, "What is the output of list(range(2, 5))?", "[2, 3, 4]|[2, 3, 4, 5]|[3, 4, 5]|[2, 3, 4, 5]", "published", "range(2, 5) gives 2, 3, 4."),
(2, NULL, "Which of these is a valid nested for loop?", "for i in range(2): for j in range(2):|for i in range(2) for j in range(2):|for i, j in range(2):|for i in range(2): for j:", "published", "The first is correct."),
(2, NULL, "How do you break out of a for loop?", "break|exit|stop|return", "published", "break exits the loop."),
(2, NULL, "Which of these is used to skip to the next iteration?", "continue|break|pass|skip", "published", "continue skips to the next iteration."),
-- loop while
(2, NULL, "Which of the following is a correct while loop in Python?", "while x < 5:|while (x < 5) {}|while x < 5 do|while x < 5 then", "published", "while x < 5: is the correct syntax."),
(2, NULL, "What is the output of x=0; while x<3: print(x); x+=1?", "0 1 2|1 2 3|0 1 2 3|1 2", "published", "It prints 0, 1, 2."),
(2, NULL, "How do you create an infinite loop?", "while True:|while 1:|while (True):|all of the above", "published", "All are valid infinite loops."),
(2, NULL, "Which of these is NOT a valid while loop?", "while x < 5:|while (x < 5):|while x < 5 do:|while True:", "published", "while x < 5 do: is not valid."),
(2, NULL, "How do you exit a while loop early?", "break|continue|exit|stop", "published", "break exits the loop."),
(2, NULL, "What is the output of while False: print('hi')?", "Nothing|hi|error|infinite loop", "published", "The loop never runs."),
(2, NULL, "Which of these is used to skip to the next iteration in a while loop?", "continue|break|pass|skip", "published", "continue skips to the next iteration."),
(2, NULL, "What is the output of x=3; while x: print(x); x-=1?", "3 2 1|2 1 0|3 2 1 0|1 2 3", "published", "It prints 3, 2, 1."),
(2, NULL, "Can while loops have an else clause?", "Yes|No|Only in Python 2|Only with break", "published", "while loops can have an else clause."),
(2, NULL, "What is the output of x=0; while x<2: x+=1; print(x)?", "2|1 2|0 1 2|1", "published", "It prints 2."),
-- dot notation
(2, NULL, "What does the dot (.) operator do in Python?", "Accesses attributes or methods|Multiplies numbers|Divides numbers|Comments code", "published", "The dot operator is used to access attributes or methods of objects in Python."),
(2, NULL, "Which of these uses dot notation?", "str.upper()|list.append()|dict.keys()|all of the above", "published", "All use dot notation."),
(2, NULL, "How do you access the append method of a list l?", "l.append|l.append()|append(l)|l->append()", "published", "l.append accesses the method."),
(2, NULL, "What is the output of 'abc'.upper()?", "ABC|abc|Abc|error", "published", "The upper() method returns 'ABC'."),
(2, NULL, "Which of these is NOT accessed using dot notation?", "len(list)|list.append|str.lower|dict.keys", "published", "len(list) is a function, not a method."),
(2, NULL, "What is the output of [1,2,3].count(2)?", "1|2|3|error", "published", "count(2) returns the number of times 2 appears."),
(2, NULL, "Which of these is a method of string?", "replace|append|pop|insert", "published", "replace is a string method."),
(2, NULL, "How do you access the keys of a dictionary d?", "d.keys()|keys(d)|d.keys|d->keys()", "published", "d.keys() uses dot notation."),
(2, NULL, "Which of these is NOT a valid use of dot notation?", "list.length|str.upper()|dict.items()|set.add()", "published", "list.length is not valid."),
(2, NULL, "What is the output of type([].append)?", "<class 'builtin_function_or_method'>|<class 'function'>|<class 'method'>|<class 'list'>", "published", "append is a method of list objects.");
