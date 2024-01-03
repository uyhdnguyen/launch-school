RB109 Written Questions

- What does the code output? What are the return values?
- Reasons behind the output/return?
- What concept does the problem demonstrates?

#### Local Variable Scope
1.

```ruby
a = “Hello”
b = a
a = “Goodbye”

puts a
puts b
```

- The outputs are `Goodbye` then `Hello`. The return value is `nil`.

- On line 1, we initializes a local variable called `a` to the string `Hello`.
- On line 2, we initializes local variable called `b` and assigns it to string
- `Hello` that local variable a is referencing.
- On line 3, we reassign local variable `a` to the string `Goodbye`.
- On line 5, we call the `puts` method and pass it local variable `a` as an argument.
- We call `puts` method and pass it local variable `b` as an argument.

- This problem demonstrates local variable scope concept.

2.

```ruby
a = 4

loop do
  a = 5
  b = 3

  break
end

puts a
puts b
```

- The outputs are `5` then `error` for unknown variable
- On line 1, we initializes local variable called `a` to integer `4`.
-   On line 3, we call method `loop` and pass it a `do..end` block as an argument.
-   Inside of the block, we reassign local variable `a` to the integer `5`.
-   We then initializes new local variable called `b` to the integer `3`
-   We break out of the loop with the keyword `break`
-   We then call the `puts` method and pass it the value `5` that local variable `a` is referencing.
-   Lastly, we call `puts` method and pass it the value that `b` is referencing but it would raise an error since variable `b` is scoped inside the `loop` method so we does not have access to local varialbe `b`
- This problem demonstrates local variable scope concept.