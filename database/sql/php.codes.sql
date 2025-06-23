-- Insert or ignore existing quiz entry
INSERT OR IGNORE INTO quizzes(id, user_id, title, description, status)
VALUES (6, 6038394083, "Php codes", "Simple Php codes questions for starter!", "published");

-- Delete existing questions for this quiz to avoid duplication
DELETE FROM questions WHERE quiz_id = 6;

-- Insert 30 PHP Questions
INSERT INTO questions(quiz_id, media_url, question, options, status, explanation) VALUES

-- 1
(
    6, 
    NULL, 
    'What is the correct way to declare a variable in PHP?
```php
<?php
# Which line correctly declares a variable?
?>
```',
    '$var|var $var|int $var|variable $var', 
    'published', 
    'Variables in PHP start with a dollar sign ($).'
),

-- 2
(
    6, 
    NULL, 
    'Which of the following is NOT a valid data type in PHP?
```php
<?php
// No code needed
?>
```',
    'Integer|String|Boolean|Float|None of these', 
    'published', 
    'All listed are valid PHP data types. PHP supports integers, floats, strings, booleans, arrays, objects, etc.'
),

-- 3
(
    6, 
    NULL, 
    'What is the output?
```php
<?php
$x = "5";
$y = 5;
echo $x + $y;
?>
```',
    '10|55|Error|0', 
    'published', 
    'PHP automatically converts string "5" to integer when using arithmetic operators.'
),

-- 4
(
    6, 
    NULL, 
    'What does the following code print?
```php
<?php
$a = true;
$b = false;
if ($a || $b) {
    echo "True";
} else {
    echo "False";
}
?>
```',
    'True|False|Error|Nothing', 
    'published', 
    'Logical OR (||) returns true if at least one operand is true.'
),

-- 5
(
    6, 
    NULL, 
    'What is the result of this comparison?
```php
<?php
$a = "5";
$b = 5;
echo ($a === $b);
?>
```',
    'false|1|Empty|true', 
    'published', 
    'Strict equality (===) checks both value and type. String "5" is not equal to integer 5.'
),

-- 6
(
    6, 
    NULL, 
    'What is the output?
```php
<?php
$x = 10;
$y = 20;
if ($x > 15 xor $y < 30) {
    echo "Yes";
} else {
    echo "No";
}
?>
```',
    'Yes|No|Error|Nothing', 
    'published', 
    'XOR returns true only if exactly one condition is true. Here, first is false, second is true → XOR = true.'
),

-- 7
(
    6, 
    NULL, 
    'What is the output?
```php
<?php
$i = 1;
while ($i <= 3) {
    echo $i;
    $i++;
}
?>
```',
    '123|1 2 3|1|Infinite loop', 
    'published', 
    'The while loop runs as long as $i <= 3, printing 1, then 2, then 3.'
),

-- 8
(
    6, 
    NULL, 
    'What is the output?
```php
<?php
for ($i = 0; $i < 3; $i++) {
    echo "*";
}
?>
```',
    '***|**|*|Error', 
    'published', 
    'The loop runs 3 times, echoing "*" each time → "***".'
),

-- 9
(
    6, 
    NULL, 
    'Which keyword is used to define a function in PHP?
```php
<?php
function myFunction() {
    echo "Hello";
}
?>
```',
    'function|func|def|define', 
    'published', 
    'Functions are defined using the "function" keyword.'
),

-- 10
(
    6, 
    NULL, 
    'What is the output?
```php
<?php
function sayHello() {
    return "Hello!";
}
echo sayHello();
?>
```',
    'Hello!|Nothing|Function not found|Error', 
    'published', 
    'The function returns "Hello!" which is echoed.'
),

-- 11
(
    6, 
    NULL, 
    'What is the output?
```php
<?php
$colors = array("Red", "Green", "Blue");
echo count($colors);
?>
```',
    '3|2|0|Error', 
    'published', 
    'count() returns the number of elements in an array → 3.'
),

-- 12
(
    6, 
    NULL, 
    'What is the output?
```php
<?php
$name = "John";
echo "Hello $name";
?>
```',
    'Hello John|Hello $name|Error|Hello ', 
    'published', 
    'Variables inside double quotes are parsed and replaced with their value.'
),

-- 13
(
    6, 
    NULL, 
    'What is the output?
```php
<?php
$a = 5;
$b = ++$a;
echo $b;
?>
```',
    '6|5|0|Error', 
    'published', 
    'Pre-increment (++$a) increments $a before assigning it to $b.'
),

-- 14
(
    6, 
    NULL, 
    'What is the output?
```php
<?php
$a = 10;
$b = $a % 3;
echo $b;
?>
```',
    '1|3|0|10', 
    'published', 
    'Modulus (%) returns remainder: 10 % 3 = 1.'
),

-- 15
(
    6, 
    NULL, 
    'What is the output?
```php
<?php
$names = ["Alice", "Bob"];
echo $names[1];
?>
```',
    'Bob|Alice|Error|Nothing', 
    'published', 
    'Array indexes start from 0 → $names[1] is Bob.'
),

-- 16
(
    6, 
    NULL, 
    'Which function is used to check if a variable is set and not NULL?
```php
<?php
$x = null;
if (isset($x)) {
    echo "Set";
} else {
    echo "Not Set";
}
?>
```',
    'isset()|empty()|is_null()|exists()', 
    'published', 
    'isset() checks whether a variable is declared and not NULL.'
),

-- 17
(
    6, 
    NULL, 
    'What is the output?
```php
<?php
$x = null;
if (is_null($x)) {
    echo "Yes";
} else {
    echo "No";
}
?>
```',
    'Yes|No|Error|Nothing', 
    'published', 
    'is_null() checks if a variable is NULL → returns true.'
),

-- 18
(
    6, 
    NULL, 
    'Which function is used to convert a string to lowercase?
```php
<?php
$str = "HELLO WORLD";
echo strtolower($str);
?>
```',
    'strtolower()|tolower()|lower()|lcfirst()', 
    'published', 
    'strtolower() converts all characters in a string to lowercase.'
),

-- 19
(
    6, 
    NULL, 
    'What is the output?
```php
<?php
$str = "hello world";
echo ucfirst($str);
?>
```',
    'Hello world|HELLO WORLD|hello World|Error', 
    'published', 
    'ucfirst() makes the first character uppercase → Hello world.'
),

-- 20
(
    6, 
    NULL, 
    'What is the output?
```php
<?php
$arr = [1, 2, 3];
array_push($arr, 4);
print_r($arr);
?>
```',
    '[1,2,3,4]|[1,2,3]|Error|[4,3,2,1]', 
    'published', 
    'array_push() adds one or more elements to the end of an array.'
),

-- 21
(
    6, 
    NULL, 
    'Which function removes the last element of an array?
```php
<?php
$arr = [1, 2, 3, 4];
array_pop($arr);
print_r($arr);
?>
```',
    'array_pop()|array_shift()|array_unshift()|array_remove()', 
    'published', 
    'array_pop() removes the last element of an array.'
),

-- 22
(
    6, 
    NULL, 
    'What is the output?
```php
<?php
$x = 5;
function test() {
    echo $x;
}
test();
?>
```',
    'Error|5|Nothing|0', 
    'published', 
    'Variables inside a function have local scope. $x is not accessible inside the function.'
),

-- 23
(
    6, 
    NULL, 
    'How do you access a global variable inside a function?
```php
<?php
$x = 10;
function show() {
    global $x;
    echo $x;
}
show();
?>
```',
    'global|$GLOBALS|Both|None', 
    'published', 
    'You can use either global or $GLOBALS array to access global variables inside functions.'
),

-- 24
(
    6, 
    NULL, 
    'What is the output?
```php
<?php
$a = 10;
function change(&$a) {
    $a = 20;
}
change($a);
echo $a;
?>
```',
    '20|10|Error|0', 
    'published', 
    'Passing by reference (&) allows the function to modify the original variable.'
),

-- 25
(
    6, 
    NULL, 
    'Which function is used to include a PHP file, and produce a fatal error if missing?
```php
<?php
require("missing_file.php");
?>
```',
    'require()|include()|require_once|Both require and require_once', 
    'published', 
    'require() produces a fatal error if the file is missing.'
),

-- 26
(
    6, 
    NULL, 
    'Which function is used to include a PHP file, and only generates a warning if missing?
```php
<?php
include("missing_file.php");
?>
```',
    'include()|require()|require_once|None', 
    'published', 
    'include() generates a warning (E_WARNING) if the file is missing but script continues.'
),

-- 27
(
    6, 
    NULL, 
    'Which function ensures a file is included only once?
```php
<?php
include_once("config.php");
?>
```',
    'include_once|include|require|None', 
    'published', 
    'include_once() ensures that a file is included only once during execution.'
),

-- 28
(
    6, 
    NULL, 
    'What is the output?
```php
<?php
$a = 5;
$b = 10;
list($a, $b) = array($b, $a);
echo "$a $b";
?>
```',
    '10 5|5 10|Error|0 0', 
    'published', 
    'list() assigns values from an array to multiple variables. This swaps $a and $b.'
),

-- 29
(
    6, 
    NULL, 
    'Which statement is used to exit a loop early?
```php
<?php
for ($i = 0; $i < 10; $i++) {
    if ($i == 5) break;
    echo $i;
}
?>
```',
    'break|continue|exit|stop', 
    'published', 
    'The break statement exits the current loop immediately.'
),

-- 30
(
    6, 
    NULL, 
    'Which statement skips the current iteration of a loop?
```php
<?php
for ($i = 0; $i < 5; $i++) {
    if ($i == 2) continue;
    echo $i;
}
?>
```',
    'continue|break|return|next', 
    'published', 
    'continue skips the rest of the current loop iteration and starts the next one.'
);