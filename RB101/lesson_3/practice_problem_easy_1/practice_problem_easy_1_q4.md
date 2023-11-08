The Ruby Array class has several methods for removing items from the array.  
Two of them have very similar names. Let's see how they differ:

`numbers = [1, 2, 3, 4, 5]`

What do the following method calls do (assume we reset numbers to the  
original array between method calls)?

```ruby
numbers.delete_at(1)
numbers.delete(1)
```
> `delete` Delete all occurrences of an array
> `delete_at` Delete element(s) based on index of that array