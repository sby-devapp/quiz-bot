INSERT OR IGNORE INTO quizzes(id, user_id, title, description,status) 
VALUES (5 , 6038394083, "Javascript codes", "Simple JavaScript codes questions for starter!","published");

DELETE FROM questions WHERE quiz_id = 5;

INSERT INTO questions(quiz_id, media_url, question, options, status, explanation) VALUES
(5, NULL,
'*What will this code output?*
```javascript
console.log(typeof undefined)
```', 
'undefined|null|string|object', 
'published', 
'typeof undefined is "undefined"'),

(5, NULL, 
'*What will this code output?*
```javascript
console.log(10 / 2)
```', 
'5|2|0|Error', 'published', '10 divided by 2 is 5'),
(5, NULL, 
'*What will this code output?
```javascript
var str = "5" * 2
console.log(str)
```',
 '10|52|NaN|Error', 'published', 'String "5" is coerced to number'),
(5, NULL, 
'*What will this code output?*
```javascript
console.log([].push(1))
```', 
'1|0|undefined|Error', 'published', 'push returns new length of array'),
(5, NULL, 
'*What will this code output?*
```javascript
console.log(Math.max(1, 5, 3))
```', '5|3|1|undefined', 'published', 'Math.max returns largest value'),
(5, NULL, 
'*What will this code output?*
```javascript
console.log(Boolean(0))
```', 'false|true|undefined|Error', 'published', '0 is falsy'),
(5, NULL, 
'*What will this code output?*
```javascript
var str = "abc".toUpperCase()
console.log(str)
```', 
'ABC|abc|Abc|undefined', 'published', 'toUpperCase returns uppercase string'),
(5, NULL, 
'*What will this code output?*
```javascript
var li = [1,2,3]
console.log(li.length)
```', 
'3|2|1|undefined', 'published', 'Array length is 3'),
(5, NULL, 
'*What will this code output?*
```javascript
console.log(typeof NaN)
```', 
'number|NaN|undefined|string', 'published', 'typeof NaN is "number"'),
(5, NULL, 
'*What will this code output?*
```javascript
console.log(2 > 1)
```', 
'true|false|undefined|Error', 'published', '2 is greater than 1'),
(5, NULL, 
'*What will this code output?*
```javascript
console.log("a" + "b")
```', 
'ab|a b|a|b', 'published', 'String concatenation'),
(5, NULL, 
'*What will this code output?*
```javascript
li = [1,2,3].reverse()[0]
console.log(li)
```', 
'3|1|2|undefined', 'published', 'reverse reverses array'),
(5, NULL, 
'*What will this code output?*
```javascript
console.log(typeof function(){})
```', 
'function|object|undefined|string', 'published', 'typeof function is "function"'),
(5, NULL, 
'*What will this code output?*
```javascript
console.log(4 % 2)
```', 
'0|2|1|undefined', 'published', '4 modulo 2 is 0'),
(5, NULL, 
'*What will this code output?*
```javascript
console.log("5" - 2)
```', 
'3|7|NaN|Error', 'published', 'String "5" is coerced to number'),
(5, NULL, 
'*What will this code output?*
```javascript
var li = [1,2,3]
console.log(li.includes(2))
```', 
'true|false|undefined|Error', 'published', 'includes checks if array contains value'),
(5, NULL, 
'*What will this code output?*
```javascript
var str = "abc"
console.log(str.indexOf("b"))
```', 
'1|0|2|-1', 'published', 'indexOf returns index of substring'),
(5, NULL, 
'*What will this code output?*
```javascript
console.log(typeof [])
```', 
'object|array|undefined|string', 'published', 'typeof array is "object"'),
(5, NULL, 
'*What will this code output?*
```javascript
console.log(1 + true)
```', 
'2|1|true|Error', 'published', 'true is coerced to 1'),
(5, NULL, 
'*What will this code output?
```javascript
console.log("10" / "2")
```', 
'5|2|NaN|Error', 'published', 'Strings are coerced to numbers'),
(5, NULL, 
'*What will this code output?*
```javascript
console.log(typeof "")
```', 
'string|object|undefined|boolean', 'published', 'typeof empty string is "string"'),
(5, NULL, 
'*What will this code output?*
```javascript
var li1 = [1,2,3]
var li2 = li1.shift()
console.log(li2)
```', 
'1|2|3|undefined', 'published', 'shift removes and returns first element'),
(5, NULL, 
'*What will this code output?*
```javascript
var txt = "abc"
console.log(txt.replace("b", "d"))
```', 
'adc|abc|dbc|abd', 'published', 'replace replaces first occurrence'),
(5, NULL, 
'*What will this code output?*
```javascript
console.log(2 < 1)
```', 
'false|true|undefined|Error', 'published', '2 is not less than 1'),
(5,
NULL, 
 '*What will this code output?*
 ```javascript
 console.log(typeof null === "object")
 ```', 
 'true|false|undefined|Error', 
 'published', 
 'typeof null is "object"'),
 (5,
 NULL, 
 '*What will this code output?*
 ```javascript
 var fan = function(text){
    console.log(text)
 };
 fan("Groot")
 ```', 
 'Groot|GROOT|text|Error', 
 'published', 
 'typeof null is "object"');