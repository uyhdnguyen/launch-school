
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

- On line 1, we initializes a local variable called `a` to the string `Hello`. On line 2, we initializes local variable called `b` and assigns it to string  `Hello` that local variable a is referencing. On line 3, we reassign local variable `a` to the string `Goodbye`. On line 5, we call the `puts` method and pass it local variable `a` as an argument. We call `puts` method and pass it local variable `b` as an argument.

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
- On line 1, we initializes local variable called `a` to integer `4`. On line 3, we call method `loop` and pass it a `do..end` block as an argument. Inside of the block, we reassign local variable `a` to the integer `5`.  We then initializes new local variable called `b` to the integer `3`. We break out of the loop with the keyword `break`. We then call the `puts` method and pass it the value `5` that local variable `a` is referencing. Lastly, we call `puts` method and pass it the value that `b` is referencing but it would raise an error since variable `b` is scoped inside the `loop` method so we does not have access to local variable `b`
- This problem demonstrates local variable scope concept.

3.

```ruby
a = 4
b = 2

loop do
  c = 3
  a = c
  break
end

puts a
puts b
```

- The outputs are `3` then `2` and the return value is `nil`
- We initialize local variable `a` to the integer `4` on line 1. On line 2, we initialize local variable called `b` to integer `2`. We then call the `loop` method on line 4 and pass it a `do..end` block. Inside the block, we initialize new local variable called `c` to the integer `3`. We then reassign local variable `a` to the value that local variable `c` is referencing which is `3`.  We break out of the loop using keyword `break`. The last two lines of code, we call method `puts` and pass it the value that `a` and `b` are referencing. In this case, `a` is referencing `3` and `b` is referencing `2`
- This problem demonstrates local variable scope concept.

4.

```ruby
def example(str)
  i = 3
  loop do
    puts str
    i -= 1
    break if i == 0
  end
end

example('hello')
```

- The outputs are 3 times `hello` and the return is `nil`
- On line 1, we define method called `example` that take one parameter named `str`. Inside of the method, we initialize local variable called `i` to the integer `3`. We called the loop method on line 3 and pass it a `do..end` block as an argument. Inside the block, we call `puts` method and pass it the value that local variable `str` is referencing. On line 5, we reassign local variable `i ` to the return value of `Integer#-` method called on the local variable `i` with the integer `1` passed to it as an argument. We break out of the loop with keyword `break` if the value of the object that local variable `i` is referencing is equal to `0`. Finally, we call method `example` and pass the `string` `hello` as argument.
- This problem demonstrate local variable scope concept.

5.

```ruby
def greetings(str)
  puts str
  puts "Goodbye"
end

word = "Hello"
greetings(word)
```

- The output is `Hello` and `Goodbye` and the return value is `nill`
- On line 1, we define method called `greetings` that takes one argument named `str`. On line 2, we call method `puts` and pass it local variable `str`. On line 3, we call method `puts` and pass it string `Goodbye`. We then initialize local variable called `word` to the string 'Hello' on line 5. Lastly, we call `greetings` method and pass it the value `Hello` that local variable `word` is referencing.
- This problem demonstrate local variable scope concept.
