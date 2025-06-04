INSERT OR IGNORE INTO quizzes(id, user_id, title, description,status) 
VALUES (1 , 6038394083, "Php 101", "Simple php questions for starter!","published");

INSERT INTO questions(quiz_id, media_url, question, options, status, explanation)
VALUES
-- Type: int, float, string, bool, array, object, resource, null
(1, NULL, 'Which of these is NOT a PHP data type?', 'integer|string|character|array', 'published', 'PHP does not have a character data type.'),
(1, NULL, 'Which PHP data type is used to represent decimal numbers?', 'float|int|string|bool', 'published', 'float is used for decimal numbers.'),
(1, NULL, 'What is the output type of var_dump(true); in PHP?', 'bool|int|string|array', 'published', 'var_dump(true) outputs bool(true).'),
(1, NULL, 'Which of these is used to represent a collection of key-value pairs?', 'associative array|indexed array|object|string', 'published', 'Associative arrays represent key-value pairs.'),
(1, NULL, 'Which PHP type is used to store a database connection?', 'resource|object|array|string', 'published', 'resource is used for external resources like database connections.'),
(1, NULL, 'What is the value of $x after $x = null;?', 'null|0|false|empty', 'published', '$x is null.'),

-- Functions: definition, arguments, return, built-in, user-defined
(1, NULL, 'Which keyword is used to define a function in PHP?', 'function|def|define|func', 'published', 'function is used to define a function.'),
(1, NULL, 'How do you return a value from a function in PHP?', 'return|output|yield|send', 'published', 'return is used to return a value.'),
(1, NULL, 'Which of these is a built-in PHP function to get the length of a string?', 'strlen()|length()|count()|size()', 'published', 'strlen() returns the length of a string.'),
(1, NULL, 'How do you define a function with default arguments?', 'function foo($x = 1) {}|function foo($x) = 1 {}|function foo($x:1) {}|function foo($x) {}', 'published', 'function foo($x = 1) {} defines a default argument.'),
(1, NULL, 'Which function is used to check if a variable is an array?', 'is_array()|array_check()|check_array()|isarr()', 'published', 'is_array() checks if a variable is an array.'),
(1, NULL, 'How do you call a user-defined function named myFunc?', 'myFunc();|call myFunc;|run myFunc()|invoke myFunc;', 'published', 'myFunc(); calls the function.'),

-- More type-related
(1, NULL, 'Which of these values is considered FALSE in PHP?', '0|"0"|""|all of the above', 'published', 'All of the above are considered FALSE.'),
(1, NULL, 'What is the output of gettype(3.14);?', 'double|float|number|string', 'published', 'gettype(3.14) returns double (float).'),
(1, NULL, 'Which operator is used to cast a variable to integer?', '(int)|(integer)|both|none', 'published', 'Both (int) and (integer) can be used.'),

-- More function-related
(1, NULL, 'Which function is used to split a string into an array?', 'explode()|split()|str_split()|all of the above', 'published', 'explode() and str_split() can split strings.'),
(1, NULL, 'How do you check if a function exists before calling it?', 'function_exists("func")|isset(func)|exists(func)|defined(func)', 'published', 'function_exists("func") checks if a function exists.'),
(1, NULL, 'Which function is used to include and execute a PHP file?', 'include()|require()|both|import()', 'published', 'include() and require() both include and execute files.'),
(1, NULL, 'What is the output of count([1,2,3]);?', '3|2|1|0', 'published', 'count([1,2,3]) returns 3.'),
(1, NULL, 'Which function is used to remove whitespace from both ends of a string?', 'trim()|strip()|clean()|remove()', 'published', 'trim() removes whitespace from both ends.'),

-- Try Catch: error handling, exceptions
(1, NULL, 'Which keyword is used to handle exceptions in PHP?', 'try|catch|throw|all of the above', 'published', 'try, catch, and throw are all used for exception handling.'),
(1, NULL, 'How do you throw an exception in PHP?', 'throw new Exception()|raise Exception()|exception()|error()', 'published', 'throw new Exception() is used to throw an exception.'),
(1, NULL, 'Which block is used to catch exceptions?', 'catch|try|finally|error', 'published', 'catch is used to catch exceptions.'),
(1, NULL, 'What is the purpose of the finally block?', 'Execute code after try/catch|Handle errors|Throw exceptions|None', 'published', 'finally executes code after try and catch blocks.'),
(1, NULL, 'How do you catch multiple exception types?', 'Multiple catch blocks|Multiple try blocks|Use elseif|Not possible', 'published', 'You can use multiple catch blocks for different exception types.'),
(1, NULL, 'What happens if an exception is not caught?', 'Fatal error|Warning|Ignored|Continues', 'published', 'An uncaught exception results in a fatal error.'),

-- Loops: for, while, foreach, do...while
(1, NULL, 'Which loop is best for iterating over an array in PHP?', 'foreach|for|while|do...while', 'published', 'foreach is designed for iterating over arrays.'),
(1, NULL, 'Which keyword starts a for loop in PHP?', 'for|foreach|loop|while', 'published', 'for is used to start a for loop.'),
(1, NULL, 'How do you write a while loop in PHP?', 'while(condition) { }|while condition: end|loop(condition) { }|do while(condition)', 'published', 'while(condition) { } is the correct syntax.'),
(1, NULL, 'Which loop will always execute at least once?', 'do...while|while|for|foreach', 'published', 'do...while executes at least once.'),
(1, NULL, 'How do you break out of a loop in PHP?', 'break|exit|stop|end', 'published', 'break is used to exit a loop.'),
(1, NULL, 'Which loop is most suitable when the number of iterations is known?', 'for|while|foreach|do...while', 'published', 'for loop is best when the number of iterations is known.'),
(1, NULL, 'How do you skip the current iteration in a loop?', 'continue|skip|next|pass', 'published', 'continue skips the current iteration.'),
(1, NULL, 'What is the output of: for($i=0;$i<3;$i++){echo $i;}', '012|123|321|111', 'published', 'It outputs 012.'),
(1, NULL, 'Which loop is used to iterate over object properties?', 'foreach|for|while|do...while', 'published', 'foreach can be used to iterate over object properties.'),
(1, NULL, 'How do you write a foreach loop for an array $arr?', 'foreach($arr as $item) { }|for($i=0;$i<count($arr);$i++) { }|while($arr) { }|loop($arr) { }', 'published', 'foreach($arr as $item) { } is the correct syntax.'),

-- Lambda: anonymous functions, closures
(1, NULL, 'What is a lambda function in PHP?', 'An anonymous function|A named function|A class|A variable', 'published', 'A lambda function is an anonymous function.'),
(1, NULL, 'How do you define an anonymous function in PHP?', 'function() {}|lambda() {}|anonymous() {}|fn() {}', 'published', 'function() {} defines an anonymous function.'),
(1, NULL, 'Which keyword is used to access variables from the parent scope in a closure?', 'use|with|import|global', 'published', 'use is used to import variables into a closure.'),
(1, NULL, 'How do you assign an anonymous function to a variable?', '$fn = function() {}; |$fn = lambda() {}; |$fn = anonymous() {}; |$fn = fn() {};', 'published', '$fn = function() {}; assigns an anonymous function.'),
(1, NULL, 'How do you call an anonymous function stored in $fn?', '$fn();|call $fn;|run $fn()|invoke $fn;', 'published', '$fn(); calls the anonymous function.'),
(1, NULL, 'What is a closure in PHP?', 'A function with bound variables|A class|An array|A constant', 'published', 'A closure is an anonymous function with bound variables.'),
(1, NULL, 'Which PHP version introduced anonymous functions?', '5.3|5.0|7.0|4.4', 'published', 'Anonymous functions were introduced in PHP 5.3.'),
(1, NULL, 'How do you pass an anonymous function as a callback?', 'As a function argument|As a string|As a class|Not possible', 'published', 'You can pass an anonymous function as a function argument.'),
(1, 'https://www.php.net/manual/en/functions.anonymous.php', 'What is the output of array_map(function($x){return $x*2;}, [1,2,3]);?', '[2,4,6]|[1,2,3]|[1,4,9]|[2,3,4]', 'published', 'It outputs [2,4,6].'),
(1, NULL, 'Which keyword creates a short closure in PHP 7.4+?', 'fn|function|lambda|short', 'published', 'fn creates a short closure (arrow function) in PHP 7.4+' )
;
