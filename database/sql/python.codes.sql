INSERT OR IGNORE INTO quizzes(id, user_id, title, description,status) 
VALUES (4 , 6038394083, "Python codes", "Simple python codes questions for starter!","published");

DELETE FROM questions;

INSERT INTO questions(quiz_id, media_url, question, options, status, explanation)
VALUES
(
    4,
    NULL,
    '*What will this code output?*\n
    ```
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
    ```
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
    ```
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
    ```
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
    ```
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
    ```
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
    ```
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
    ```
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
    ```
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
    ```
    print(list(range(1, 5)))
    ```',
    '[1, 2, 3, 4]|[1, 2, 3, 4, 5]|[1, 2, 3, 4, 5, 6]|Error',
    'published',
    'range(1,5) generates numbers 1 to 4. Output: [1, 2, 3, 4].'
)
