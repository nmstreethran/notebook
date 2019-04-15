# [Python notes from the Sololearn Python 3 Tutorial](https://www.sololearn.com/Course/Python/) <!-- omit in toc -->

## Table of contents <!-- omit in toc -->
- [Basic concepts](#basic-concepts)
  - [Floats and integers](#floats-and-integers)
  - [Other numerical operations](#other-numerical-operations)
    - [Exponentiation](#exponentiation)
    - [Quotient](#quotient)
    - [Remainder](#remainder)
  - [Strings](#strings)
  - [Input and output](#input-and-output)
  - [String operations](#string-operations)
    - [Concatenation](#concatenation)
    - [Multiplication](#multiplication)
  - [Type conversions](#type-conversions)
  - [Variables](#variables)
  - [In-place operators](#in-place-operators)
- [Control structures](#control-structures)
  - [Booleans and comparisons](#booleans-and-comparisons)
  - [`if` and `else`](#if-and-else)
    - [`if` statements](#if-statements)
    - [`else` statements](#else-statements)
    - [`elif` statements](#elif-statements)
  - [Boolean logic](#boolean-logic)
  - [Operator precedence](#operator-precedence)
  - [`while` loops](#while-loops)
  - [Lists](#lists)
  - [List operations](#list-operations)
  - [List functions](#list-functions)
  - [Range](#range)
  - [Loops](#loops)

## Basic concepts

### Floats and integers

Floats are numbers that are not integers. e.g., 0.5 and 1.333. Running an operation on two floats, or on a float and integer, returns floats. Using operations such as division on integers also return floats. e.g.:
```python
>>> 16/4
4.0
```

> Computers can't store floats perfectly accurately, in the same way that we can't write down the complete decimal expansion of 1/3 (0.3333333333333333...). Keep this in mind, because it often leads to infuriating bugs!

### Other numerical operations

#### Exponentiation

```python
>>> 2**5
32
>>> 9 ** (1/2)
3.0
```

#### Quotient

The quotient of a division is determined using the floor division `//`. 6 goes into 20 three times, so the quotient is 3:

```python
>>> 20 // 6
3
```

#### Remainder

The remainder of a division is determined using the modulo operator `%`. The remainder when 1.25 is divided by 0.5 is 0.25:

```python
>>> 1.25 % 0.5
0.25
```

### Strings

A string is created by entering text between two single or double quotation marks. It is generally displayed in single quotes in the Python console:

```python
>>> "Hello world!"
'Hello world!'
```

To use single or double quotes in single or double quote strings respectively, use backslashes to escape these characters:

```python
>>> 'Brian\'s mother: He\'s not the Messiah. He\'s a very naughty boy!'
'Brian's mother: He's not the Messiah. He's a very naughty boy!'
```

`\n` represents a new line. Alternatively, create a string with three sets of quotes, and newlines that are created by pressing Enter are automatically escaped for you:

```python
>>> """Customer: Good morning.
Owner: Good morning, Sir. Welcome to the National Cheese Emporium."""

'Customer: Good morning.\nOwner: Good morning, Sir. Welcome to the National Cheese Emporium.'
```

Quotes will not be displayed when using `print` on a string:

```python
>>> print("Hello\nWorld!")
Hello
World!
```

### Input and output

To get input from the user in Python, you can use the intuitively named input function. The function prompts the user for input, and returns what they enter as a string (with the contents automatically escaped).

```python
>>> input("Enter something please: ")
Enter something please: This is what\nthe user enters!

'This is what\nthe user enters!'
```

### String operations

#### Concatenation

Adding strings:

```python
>>> "Spam" + 'eggs'
'Spameggs'

>>> print("First string" + ", " + "second string")
First string, second string
```

Strings and integers cannot be concatenated. Even if your strings contain numbers (in quotes), they are still added as strings rather than integers.

```python
>>> "2" + "2"
'22'
```

#### Multiplication

Multiplying by integers produces a repeated version of the original string. Strings cannot be multiplied by floats, even if the floats are whole numbers.

```python
>>> print("spam" * 3)
spamspamspam

>>> 4 * '2'
'2222'
```

### Type conversions

Converting strings to integers before performing the operation:

```python
>>> int("2") + int("3")
5
```

Turning user input (which is a string) to numbers (integers or floats), to allow for the performance of calculations:

```python
>>> float(input("Enter a number: ")) + float(input("Enter another number: "))
Enter a number: 40
Enter another number: 2
42.0
```

### Variables

```python
>>> x = 7
>>> print(x)
7
>>> print(x + 3)
10
```

Variables do not have specific types, so you can assign a string to a variable, and later assign an integer to the same variable. However, it is not good practice. To avoid mistakes, try to avoid overwriting the same variable with different data types.

Characters that may be used in Python variable names are letters, numbers, and underscores. Python is a case sensitive programming language.

### In-place operators

In-place operators allow you to write code like `x = x + 3` more concisely, as `x += 3`. The same thing is possible with other operators such as `-`, `*`, `/` and `%`. It can be used for numbers and strings.

```python
>>> x = 2
>>> print(x)
2
>>> x += 3
>>> print(x)
5
```

## Control structures

### Booleans and comparisons

One equals sign `=` for assignment; two equals signs `==` for comparison. 

Comparing values using the equal operator `==`:

```python
>>> 2 == 3
False
>>> "hello" == "hello"
True
```

The not equal operator (`!=`), evaluates to `True` if the items being compared are not equal, and `False` if they are:

```python
>>> 1 != 1
False
>>> "eleven" != "seven"
True
>>> 2 != 10
True
```

Operators that determine whether one number (float or integer) is greater than or smaller than another:

```python
>>> 7 > 5
True
>>> 10 < 10
False
```

Greater than or equal to, and smaller than or equal to operators (return `True` when comparing equal numbers):

```python
>>> 7 <= 8
True
>>> 9 >= 9.0
True
```

### `if` and `else`

#### `if` statements

Nested `if` statements (the inner if statement is the statement part of the outer one): 

```python
num = 12
if num > 5:
   print("Bigger than 5")
   if num <=47:
      print("Between 5 and 47")
      if num <=10:
        print("Between 5 and 10")
        if num ==12:
            print("Equals 12)
>>>
Bigger than 5
Between 5 and 47
>>>
```

#### `else` statements

An `else` statement follows an if statement, and contains code that is called when the `if` statement evaluates to `False`.

```python
num = 7
if num == 5:
  print("Number is 5")
else: 
  if num == 11:
    print("Number is 11")
  else:
    if num == 7:
      print("Number is 7")
    else: 
      print("Number isn't 5, 11 or 7")
>>>
Number is 7
>>> 
```

#### `elif` statements

The `elif` (short for else if) statement is a shortcut to use when chaining `if` and `else` statements. A series of if `elif` statements can have a final `else` block, which is called if none of the `if` or `elif` expressions is True. 

### Boolean logic

Python's Boolean operators are `and`, `or`, and `not`. 

`not` only takes one argument, and inverts it. The result of `not True` is `False`, and `not False` goes to `True`.

```python
>>> not 1 == 1
False
>>> not 1 > 7
True
```

### Operator precedence

`==` has a higher precedence than `or`:

```python
>>> False == False or True
True
>>> False == (False or True)
False
>>> (False == False) or True
True
```

> Python's order of operations is the same as that of normal mathematics: parentheses first, then exponentiation, then multiplication/division, and then addition/subtraction.

![OperatorPrecedence](/images/operatorprecedence.jpg)

### `while` loops

A `while` statement can be run more than once. The statements inside it are repeatedly executed (iterated), as long as the condition holds. Once it evaluates to `False`, the next section of code is executed. 

```python
i = 1
while i <=5:
   print(i)
   i = i + 1
print("Finished!")
>>>
1
2
3
4
5
Finished!
>>>
```

An example of an infinite loop (indefinitely runs until the execution is terminated using `Ctrl + C`):

```python
while 1==1:
  print("In the loop") 
```

To end a while loop prematurely, the `break` statement can be used. When encountered inside a loop, the `break` statement causes the loop to finish immediately.

```python
i = 0
while 1==1:
  print(i)
  i = i + 1
  if i >= 5:
    print("Breaking")
    break
print("Finished")
>>>
0
1
2
3
4
Breaking
Finished
>>>
```

Unlike `break`, `continue` jumps back to the top of the loop, rather than stopping it (i.e., it stops the current iteration and continues with the next one).

```python
i = 0
while True:
   i = i +1
   if i == 2:
      print("Skipping 2")
      continue
   if i == 5:
      print("Breaking")
      break
   print(i)
print("Finished")
>>>
1
Skipping 2
3
4
Breaking
Finished
>>>
```

### Lists

```python
words = ["Hello", "world", "!"]
print(words[0])
print(words[1])
print(words[2])
>>>
Hello
world
!
>>>
```

> The first list item's index is 0, rather than 1.

An empty list is created with an empty pair of square brackets.

```python
empty_list = []
print(empty_list)
>>>
[]
>>>
```

Typically, a list will contain items of a single item type, but it is also possible to include several different types. Lists can also be nested within other lists.

```python
number = 3
things = ["string", 0, [1, 2, number], 4.56]
print(things[1])
print(things[2])
print(things[2][2])
>>>
0
[1, 2, 3]
3
>>>
```

> Lists of lists are often used to represent 2D grids, as Python lacks the multidimensional arrays that would be used for this in other languages.

Some types, such as strings, can be indexed like lists. Indexing strings behaves as though you are indexing a list containing each character in the string.

```python
str = "Hello world!"
print(str[6])
>>>
w
>>>
```

### List operations

The item at a certain index in a list can be reassigned.

```python
nums = [7, 7, 7, 7, 7]
nums[2] = 5
print(nums)
>>>
[7, 7, 5, 7, 7]
>>>
```

Lists can be added and multiplied in the same way as strings.

```python
nums = [1, 2, 3]
print(nums + [4, 5, 6])
print(nums * 3)
>>>
[1, 2, 3, 4, 5, 6]
[1, 2, 3, 1, 2, 3, 1, 2, 3]
>>>
```

To check if an item is in a list, the `in` operator can be used. It returns `True` if the item occurs one or more times in the list, and `False` if it does not.

```python
words = ["spam", "egg", "spam", "sausage"]
print("spam" in words)
print("egg" in words)
print("tomato" in words)
>>>
True
True
False
>>>
```

To check if an item is not in a list, you can use the not operator in one of the following ways:

```python
nums = [1, 2, 3]
print(not 4 in nums)
print(4 not in nums)
print(not 3 in nums)
print(3 not in nums)
>>>
True
True
False
False
>>>
```

### List functions

Using the `append` method adds an item to the end of an existing list.

```python
nums = [1, 2, 3]
nums.append(4)
print(nums)
>>>
[1, 2, 3, 4]
>>>
```

To get the number of items in a list, use the `len` function.

```python
nums = [1, 3, 5, 2, 4]
print(len(nums))
>>>
5
>>>
```

The insert method is similar to append, except that it allows you to insert a new item at any position in the list, as opposed to just at the end.

```python
words = ["Python", "fun"]
indx = 1
words.insert(indx, "is")
print(words)
>>>
['Python', 'is', 'fun']
>>>
```

The `index` method finds the first occurrence of a list item and returns its index.

```python
letters = ['p', 'q', 'r', 's', 'p', 'u']
print(letters.index('r'))
print(letters.index('p'))
print(letters.index('z'))
>>>
2
0
ValueError: 'z' is not in list
>>> 
```

> There are a few more useful functions and methods for lists. 
> * `max(list)`: Returns the list item with the maximum value
> * `min(list)`: Returns the list item with minimum value
> * `list.count(obj)`: Returns a count of how many times an item occurs in a list
> * `list.remove(obj)`: Removes an object from a list
> * `list.reverse()`: Reverses objects in a list

### Range

The `range` function creates a sequential list of numbers.

```python
numbers = list(range(10))
print(numbers)
>>>
[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
>>>
```

If it is called with two arguments, it produces values from the first to the second.

```python
numbers = list(range(3, 8))
print(numbers)
print(range(20) == range(0, 20))
>>>
[3, 4, 5, 6, 7]
True
>>>
```

`range` can have a third argument (must be an integer), which determines the interval of the sequence produced.

```python
numbers = list(range(5, 20, 2))
print(numbers)
>>>
[5, 7, 9, 11, 13, 15, 17, 19]
>>>
```

### Loops

```python
words = ["hello", "world", "spam", "eggs"]
counter = 0
max_index = len(words) - 1
while counter <= max_index:
   word = words[counter]
   print(word + "!")
   counter = counter + 1 
>>>
hello!
world!
spam!
eggs!
>>>
```

The same code from the previous example can be written with a `for` loop:

```python
words = ["hello", "world", "spam", "eggs"]
for word in words:
  print(word + "!")
>>>
hello!
world!
spam!
eggs!
>>>
```

The `for` loop is commonly used to repeat some code a certain number of times. This is done by combining for loops with `range` objects.

```python
for i in range(5):
  print("hello!")
>>>
hello!
hello!
hello!
hello!
hello!
>>>
```