INSERT OR IGNORE INTO quizzes(id, user_id, title, description,status) 
VALUES (5 , 6038394083, "Javascript codes", "Simple JavaScript codes questions for starter!","published");

DELETE FROM questions WHERE quiz_id = 5;

INSERT INTO questions(quiz_id, media_url, question, options, status, explanation) VALUES
(5, NULL,
'*What will this code output?*\n```JavaScript\n
console.log(typeof undefined)\n```', 'undefined|null|string|object', 'published', 'typeof undefined is "undefined"'),
(5, NULL, '*What will this code output?*\n```JavaScript\nconsole.log(10 / 2)\n```', '5|2|0|Error', 'published', '10 divided by 2 is 5'),
(5, NULL, '*What will this code output?*\n```JavaScript\nconsole.log("5" * 2)\n```', '10|52|NaN|Error', 'published', 'String "5" is coerced to number'),
(5, NULL, '*What will this code output?*\n```JavaScript\nconsole.log([].push(1))\n```', '1|0|undefined|Error', 'published', 'push returns new length of array'),
(5, NULL, '*What will this code output?*\n```JavaScript\nconsole.log(Math.max(1, 5, 3))\n```', '5|3|1|undefined', 'published', 'Math.max returns largest value'),
(5, NULL, '*What will this code output?*\n```JavaScript\nconsole.log(Boolean(0))\n```', 'false|true|undefined|Error', 'published', '0 is falsy'),
(5, NULL, '*What will this code output?*\n```JavaScript\nconsole.log("abc".toUpperCase())\n```', 'ABC|abc|Abc|undefined', 'published', 'toUpperCase returns uppercase string'),
(5, NULL, '*What will this code output?*\n```JavaScript\nconsole.log([1,2,3].length)\n```', '3|2|1|undefined', 'published', 'Array length is 3'),
(5, NULL, '*What will this code output?*\n```JavaScript\nconsole.log(typeof NaN)\n```', 'number|NaN|undefined|string', 'published', 'typeof NaN is "number"'),
(5, NULL, '*What will this code output?*\n```JavaScript\nconsole.log(2 > 1)\n```', 'true|false|undefined|Error', 'published', '2 is greater than 1'),
(5, NULL, '*What will this code output?*\n```JavaScript\nconsole.log("a" + "b")\n```', 'ab|a b|a|b', 'published', 'String concatenation'),
(5, NULL, '*What will this code output?*\n```JavaScript\nconsole.log([1,2,3].reverse()[0])\n```', '3|1|2|undefined', 'published', 'reverse reverses array'),
(5, NULL, '*What will this code output?*\n```JavaScript\nconsole.log(typeof function(){})\n```', 'function|object|undefined|string', 'published', 'typeof function is "function"'),
(5, NULL, '*What will this code output?*\n```JavaScript\nconsole.log(4 % 2)\n```', '0|2|1|undefined', 'published', '4 modulo 2 is 0'),
(5, NULL, '*What will this code output?*\n```JavaScript\nconsole.log("5" - 2)\n```', '3|7|NaN|Error', 'published', 'String "5" is coerced to number'),
(5, NULL, '*What will this code output?*\n```JavaScript\nconsole.log([1,2,3].includes(2))\n```', 'true|false|undefined|Error', 'published', 'includes checks if array contains value'),
(5, NULL, '*What will this code output?*\n```JavaScript\nconsole.log("abc".indexOf("b"))\n```', '1|0|2|-1', 'published', 'indexOf returns index of substring'),
(5, NULL, '*What will this code output?*\n```JavaScript\nconsole.log(typeof [])\n```', 'object|array|undefined|string', 'published', 'typeof array is "object"'),
(5, NULL, '*What will this code output?*\n```JavaScript\nconsole.log(1 + true)\n```', '2|1|true|Error', 'published', 'true is coerced to 1'),
(5, NULL, '*What will this code output?*\n```JavaScript\nconsole.log("10" / "2")\n```', '5|2|NaN|Error', 'published', 'Strings are coerced to numbers'),
(5, NULL, '*What will this code output?*\n```JavaScript\nconsole.log(typeof "")\n```', 'string|object|undefined|boolean', 'published', 'typeof empty string is "string"'),
(5, NULL, '*What will this code output?*\n```JavaScript\nconsole.log([1,2,3].shift())\n```', '1|2|3|undefined', 'published', 'shift removes and returns first element'),
(5, NULL, '*What will this code output?*\n```JavaScript\nconsole.log("abc".replace("b", "d"))\n```', 'adc|abc|dbc|abd', 'published', 'replace replaces first occurrence'),
(5, NULL, '*What will this code output?*\n```JavaScript\nconsole.log(2 < 1)\n```', 'false|true|undefined|Error', 'published', '2 is not less than 1'),
(5,
NULL, 
 '*What will this code output?*
 ```JavaScript
 console.log(typeof null === "object")
 ```', 
 'true|false|undefined|Error', 
 'published', 
 'typeof null is "object"'),
 (5,
 NULL, 
 '*What will this code output?*
 ```JavaScript
 var fan = function(text){
    console.log(text)
 };
 fan("Groot")
 ```', 
 'Groot|GROOT|text|Error', 
 'published', 
 'typeof null is "object"');