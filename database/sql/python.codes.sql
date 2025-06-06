-- This SQL script inserts a published Python quiz and a set of multiple-choice questions into the database.
-- Each question presents a Python code snippet (formatted using Markdown code blocks with "Python" specified for syntax highlighting)
-- and asks for the output. The options and explanations are provided for each question.
-- The quiz is intended for beginners to test their understanding of basic Python concepts and behaviors.
INSERT OR IGNORE INTO quizzes(id, user_id, title, description,status) 
VALUES (4 , 6038394083, "Python codes", "Simple python codes questions for starter!","published");


INSERT INTO questions(quiz_id, media_url, question, options, status, explanation)
VALUES
(
    4,
    NULL,
    '*What will this code output?*\n
    ```Python\n
    x = [1, 2, 3]
    y = x
    y.append(4)
    print(x)
    ```',
    '[1, 2, 3, 4]|[1, 2, 3]|[4]|Error',
    'published',
    'Lists are mutable and y is a reference to x. So, appending to y also changes x. Output: [1, 2, 3, 4].'
),
(
    4,
    NULL,
    '*What will this code output?*\n
    ```Python\n
    a = 5
    b = 2
    print(a // b)
    ```',
    '2|2.5|3|Error',
    'published',
    'The // operator does integer division. 5 // 2 = 2.'
),
(
    4,
    NULL,
    '*What will this code output?*\n
    ```Python\n
    def foo(x=[]):
        x.append(1)
        return x
    print(foo())
    print(foo())
    ```',
    '[1]\n[1, 1]|[1]\n[1]|[1, 1]\n[1, 1]|Error',
    'published',
    'Default mutable arguments persist between calls. Output: [1]\n[1, 1].'
),
(
    4,
    NULL,
    '*What will this code output?*\n
    ```Python\n
    print("Hello" * 3)
    ```',
    'HelloHelloHello|Hello 3|Hello, Hello, Hello|Error',
    'published',
    'String multiplication repeats the string. Output: HelloHelloHello.'
),
(
    4,
    NULL,
    '*What will this code output?*\n
    ```Python\n
    x = [1, 2, 3]
    print(x[3])
    ```',
    'Error|3|None|[3]',
    'published',
    'IndexError: list index out of range, because valid indices are 0,1,2.'
),
(
    4,
    NULL,
    '*What will this code output?*\n
    ```Python\n
    print(bool([]))
    ```',
    'False|True|[]|Error',
    'published',
    'Empty lists are falsy in Python. Output: False.'
),
(
    4,
    NULL,
    '*What will this code output?*\n
    ```Python\n
    print(type(lambda x: x))
    ```',
    "<class 'function'>|<class 'lambda'>|function|Error",
    'published',
    'Lambdas are functions. Output: <class function>.'
),
(
    4,
    NULL,
    '*What will this code output?*\n
    ```Python\n
    x = "abc"
    print(x.upper())
    ```',
    'ABC|abc|Abc|Error',
    'published',
    'The upper() method returns the string in uppercase. Output: ABC.'
),
(
    4,
    NULL,
    '*What will this code output?*\n
    ```Python\n
    print(2 ** 3 ** 2)
    ```',
    '512|64|256|Error',
    'published',
    'Exponentiation is right-associative: 3**2=9, 2**9=512.'
),
(
    4,
    NULL,
    '*What will this code output?*\n
    ```Python\n
    print(list(range(1, 5)))
    ```',
    '[1, 2, 3, 4]|[1, 2, 3, 4, 5]|[1, 2, 3, 4, 5, 6]|Error',
    'published',
    'range(1,5) generates numbers 1 to 4. Output: [1, 2, 3, 4].'
),
(
    4,
    NULL,
    '*What will this code output?*\n
    ```Python\n
    print("a" + "b" * 2)
    ```',
    'abb|aabb|ab|Error',
    'published',
    'String multiplication has higher precedence. Output: abb.'
),
(
    4,
    NULL,
    '*What will this code output?*\n
    ```Python\n
    print([i for i in range(3)])
    ```',
    '[0, 1, 2]|[1, 2, 3]|[0, 1, 2, 3]|Error',
    'published',
    'List comprehension over range(3) gives [0, 1, 2].'
),
(
    4,
    NULL,
    '*What will this code output?*\n
    ```Python\n
    print({1, 2, 2, 3})\n
    ```',
    '{1, 2, 3}|{1, 2, 2, 3}|[1, 2, 3]|Error',
    'published',
    'Sets do not allow duplicates. Output: {1, 2, 3}.'
),
(
    4,
    NULL,
    '*What will this code output?*\n
    ```Python\n
    print("foo" == "Foo")\n
    ```',
    'False|True|foo|Error',
    'published',
    'String comparison is case-sensitive. Output: False.'
),
(
    4,
    NULL,
    '*What will this code output?*\n
    ```Python\n
    print(None == 0)
    ```',
    'False|True|None|Error',
    'published',
    'None is not equal to 0. Output: False.'
),
(
    4,
    NULL,
    '*What will this code output?*\n
    ```Python\n
    print(bool("False"))
    ```',
    'True|False|None|Error',
    'published',
    'Non-empty strings are truthy. Output: True.'
),
(
    4,
    NULL,
    '*What will this code output?*\n
    ```Python\n
    print(5 % 2)\n
    ```',
    '1|2|0|Error',
    'published',
    'Modulo operator gives remainder. Output: 1.'
),
(
    4,
    NULL,
    '*What will this code output?*\n
    ```Python\n
    print([1, 2] + [3, 4])
    ```',
    '[1, 2, 3, 4]|[1, 2][3, 4]|[4, 6]|Error',
    'published',
    'List concatenation. Output: [1, 2, 3, 4].'
),
(
    4,
    NULL,
    '*What will this code output?*\n
    ```Python\n
    print("abc".find("d"))
    ```',
    '-1|0|None|Error',
    'published',
    'find() returns -1 if not found. Output: -1.'
),
(
    4,
    NULL,
    '*What will this code output?*\n
    ```Python\n
    print(len({}))
    ```',
    '0|1|None|Error',
    'published',
    'Empty dict has length 0. Output: 0.'
),
(
    4,
    NULL,
    '*What will this code output?*\n
    ```Python\n
    print(type([]) == list)\n
    ```',
    'True|False|list|Error',
    'published',
    'type([]) is list. Output: True.'
),
(
    4,
    NULL,
    '*What will this code output?*\n
    ```Python\n
    print(" ".join(["a", "b", "c"]))\n
    ```',
    'a b c|abc|a, b, c|Error',
    'published',
    'join() joins with separator. Output: a b c.'
),
(
    4,
    NULL,
    '*What will this code output?*\n
    ```Python\n
    print([i*2 for i in [1, 2, 3]])
    ```',
    '[2, 4, 6]|[1, 2, 3, 2, 4, 6]|[1, 4, 9]|Error',
    'published',
    'List comprehension doubles each element. Output: [2, 4, 6].'
),
(
    4,
    NULL,
    '*What will this code output?*\n
    ```Python\n
    print("abc"[1])
    ```',
    'b|a|c|Error',
    'published',
    'Index 1 is b. Output: b.'
),
(
    4,
    NULL,
    '*What will this code output?*\n
    ```Python\n
    print(3 in [1, 2, 3])
    ```',
    'True|False|3|Error',
    'published',
    '3 is in the list. Output: True.'
),
(
    4,
    NULL,
    '*What will this code output?*\n
    ```
    print([].append(1))
    ```',
    'None|[1]|1|Error',
    'published',
    'append() returns None. Output: None.'
),
(
    4,
    NULL,
    '*What will this code output?*\n
    ```Python\n
    print("abc".replace("b", "d"))
    ```',
    'adc|abc|abd|Error',
    'published',
    'replace() replaces b with d. Output: adc.'
),
(
    4,
    NULL,
    '*What will this code output?*\n
    ```Python\n
    print(sum([1, 2, 3]))
    ```',
    '6|123|1|Error',
    'published',
    'sum() adds all elements. Output: 6.'
),
(
    4,
    NULL,
    '*What will this code output?*\n
    ```Python\n
    print(list("abc"))
    ```',
    '["a", "b", "c"]|[a, b, c]|abc|Error',
    'published',
    'list("abc") splits string into characters. Output: ["a", "b", "c"].'
),
(
    4,
    NULL,
    '*What will this code output?*\n
    ```Python\n
    print({i: i*i for i in range(2)})
    ```',
    '{0: 0, 1: 1}|{1: 1, 2: 4}|[0, 1]|Error',
    'published',
    'Dict comprehension for 0 and 1. Output: {0: 0, 1: 1}.'
),
(
    4,
    NULL,
    '*What will this code output?*\n
    ```Python\n
    print("Python".lower())
    ```',
    'python|PYTHON|Python|Error',
    'published',
    'lower() returns lowercase. Output: python.'
);
