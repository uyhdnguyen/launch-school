
# <center> Pseudo-Code </center>

### 1. A method that returns the sum of two integers

#### Casual pseudo-code

```

# Given two integers

Print welcome message

Ask user to input first number then save the value to fist variable
Ask user to input second number then save the value to second variable

Perform the sum and save the result

Print result variable

```

#### Formal pseudo-code

```

START

# Given two integers

PRINT message asking user for first number
    GET user input for first number
    SET first_number = user input
    
PRINT message asking user for second number
    GET user input for second number
    SET second_number = user input
    
SET sum = first_number + second_number

PRINT sum 

END

```

### 2. A method that takes an array of strings, and returns a string that is  
### all those strings concatenated together

#### Casual pseudo-code

```

# Given an array of strings

Initialize an empty string

Iterate through each element of the array
    Use Append method to add each element to the empty string
    
After iterating, return the concatenated string

```

#### Formal pseudo-code

```

START

# Given an array of strings

SET str = ' '
* SET iterator = 0

WHILE iterator <= length of the given array
    SET str.Append(iterator)
    SET iterator += 1
    
PRINT str

END

```

### 3. A method that takes an array of integers, and returns a new array with  
### every other element from the original array, starting with the first  
### element. For instance:


`every_other([1,4,7,2,5]) # => [1,7,5]`


#### Casual pseudo-code

```

# Given an array of integers

Initialize new empty array
Initialize counter

Iterate through the given array one by one
    If the index of given array divisible by 2
        Append index's value to new empty array
        
    Increase the counter by 2
    
After iterating through the array, return the new array

```

#### Formal pseudo-code

```

START

# Given an array of integers

SET new_array = []
SET counter = 0

WHILE counter <= length of given_array
    IF counter % 2 == 0
        new_array << given_array[counter]
        
    counter += 2
    
PRINT new_array

END

```

### 4. A method that determines the index of the 3rd occurrence of a given  
### character in a string. For instance, if the given character is 'x' and the  
### string is 'axbxcdxex', the method should return 6 (the index of the 3rd 'x')  
### If the given character does not occur at least 3 times, return nil.

#### Casual pseudo-code

```

# Given a string and a character

Define a method that has 2 parameters

Initialize a counter for character
Initialize iterator to loop given array

Convert the given string to an array with each character separated

Iterate through the new array one by one
    Compare given character to each value in the new array
    
        If given character is the same as the value
            Increase counter by 1
            
            If counter = 3
                Return iterator
            Else 
                Return nil
            
    Increase the iterator by 1
    
```

#### Formal pseudo-code

```

START

# Given a string and a character

SET iterator = 0
SET counter = 0

SET new_array = given_string.split(//)

WHILE iterator <= new_array.length
    IF given_char == new_array(iterator)
        counter += 1
        
        IF counter = 3
            PRINT iterator
        IF iterator = new_array.length && counter < 3
            PRINT nil
    iterator += 1

END

```

### 5. A method that takes two arrays of numbers and returns the result of  
### merging the arrays. The elements of the first array should become the  
### elements at the even indexes of the returned array, while the elements of  
### the second array should become the elements at the odd indexes.  
### For instance:

`merge([1, 2, 3], [4, 5, 6]) # => [1, 4, 2, 5, 3, 6]`

### You may assume that both array arguments have the same number of elements.

#### Casual pseudo-code

```

Given two arrays of numbers

Initialize an empty array called merged_array
Initialize iterator

Initialize the while loop
    Append index( iterator) of first_array value to merged_array
    Append index (iterator) of second_array value to merged_array
   
    Increase Iterator
    
Return merged_array

```

#### Casual pseudo-code

```

START

SET iterator = 0
SET merged_array = []

WHILE iterator <= first_array

    merged_array << first_array (iterator)
    merged_array << second_array (iterator)
    
    iterator += 1
    
    PRINT merged_array
    
END

```
