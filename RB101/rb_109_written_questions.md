
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

> On line 1, local variable `a` is initialized and references the string object `Hello`. On line 2, local variable `b` is initialized and references the same object as `a`. On line 3, `a` is reassigned string object `Goodbye`.  On the last 2 lines, `puts` method is called and get passed `a` and `b` as arguments

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

> On line 1, local variable `a` is initialized and references the integer object `4`. On line 3, `loop` method is called and gets passed a `do..end` block as an argument. Inside of the block, `a` is reassigned to `5`. On line 5, local variable `b` is initialized and references integer object `3`.

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

6.

```ruby
arr = [1, 2, 3, 4]
counter = 0
sum = 0

loop do
  sum += arr[counter]
  counter += 1
  break if counter == arr.size
end

puts "Your total is #{sum}"
```

- The output is `10` and the return is `nil`
- On line 1, we initialize a local variable called `arr` to the array `[1,2,3,4]`.  We also initialize two more local variable called `counter` and `sum` to the integer `0`.  On line 4, we call `loop` method and pass it a `do..end` block. Inside of the block, we reassign local variable `sum`  to the return value of method `Integer#+` called on the return value of  method `Array#[]` which is called on local variable `arr`  and pass it local variable `counter` as an argument. We then reassign local variable `counter` to the return value of the `Integer#+` method called on local variable `counter` with the integer `1` passed to it as an argument. We break out of the loop using keyword `break` if the value of the object that local variable `counter` is referencing is equal to the return value of  `size` method called on local variable `arr`. On the last line, we call `puts` method and pass it string `Your total is #{sum}`. Inside the string, we called `String interpolation` method and pass it local variable `sum`
- This problem demonstrate local variable scope concept.

7.

```ruby
a = 'Bob'

5.times do |x|
  a = 'Bill'
end

p a
```

- The output is `Bill` and the return value is `Bill`
- On line 1, we initialize local variable  called `a` to the string `Bob` . We call `times` method on the integer `5` and pass it a `do..end` block. Inside the block, we initialize local variable `x`, we then reassign local variable `a` to the  string `Bill`. On the last line, we call `p` method and pass it the value `Bill` that local variable `a` is referencing.
- This problem demonstrate local variable scope concept.

8.

```ruby
animal = "dog"

loop do |_|
  animal = "cat"
  var = "ball"
  break
end

puts animal
puts var
```

- The outputs are `cat` then `unidentified local variable 'var'` and the return value is `nil`
- On line 1, we initialize local variable called `animal` to the string `dog`. We call `lopop` method on line 3 and pass it a `do..end` block as an argument. Inside the block, we initialize new local variable called `_`. We then reassign local variable `animal` to the string `cat`.  On line 5, we initialize new local variable called `var` to the string `ball`. We break out of the loop using keyword `break`. On line 9, we call `puts` method and pass it the value `cat` that local variable `animal` is referencing. On line 10, we call `puts` method and pass it the value `ball` that local variable `var` is referencing. This would raise an error since local variable `var` is not defined in this scope. Local variable `var`  that is initialized in the block passed to the `loop` method has a scope that is local to that block.
- This problem demonstrate local variable scope concept.

#### Variable Shadowing

1.

```ruby
a = 4

b = 22.times do |a|
	a = 5
	puts a
end

puts a
puts b
```

- The outputs is 22 times `5` and `4` then `22` and the return value is `nil`
- On line 1, we initialize a local variable called `a` to the integer `4`. On line 3, we initialize local variable `b` to the return value of `times` method that is called on integer `22`. We also pass a `do..end` block as an argument to the  `times` method. Inside of the `do..end` block, we initialize local variable also called `a` to the integer `5`. On line 5, we call `puts` method and pass the value `5` that local variable `a` is referencing.  On the last 2 lines, we call `puts` method and pass them the values that `a` and `b` are referencing as arguments. When we run the program, the `puts` method inside the block will get run first, hence we see the program output 22 times of `5` on terminal. After that, local variable `b` is assigned to `22` which is the return value of `times` method called on the integer `22`. Because of variable shadowing rule, Ruby will block access to local variable `a` in the outer scope. Hence, local variable `a` is still referencing integer `4`.

2.

```ruby
n = 101.times do |n|
	n = 11
end
puts n
```

- The outputs is `101` and the return value is `nil`
- One line 1, we initialize a local variable called `n` to the return value of `times` method which is called on integer `101`. We also pass a `do..end` block to the `times` method as an argument. Inside of the block, we initialize local variable `n` which is the same name as the local variable `n` that is initialized outside of the block. We then assign local variable `n` in the block to the integer `11`.  Lastly, we call `puts` method and pass it the value `101` that  local variable `n` is referencing.
- This problem demonstrates Variable Shadowing concept.

3.

```ruby
animal = "dog"
loop do |animal|
	animal = "cat"
	break
end

puts animal
```

- The outputs is `dog` and return value is `nil`
- On line 1, we initialize a local variable called `animal` to the string `dog`. On line 3, we call `loop` method and pass it a `do..end` block as an argument. Inside of the block, we initialize a local variable also called `animal`. We assign local variable `animal` to the string `cat`. We break out of the loop using keyword `break`. On the last line, we call `puts` method and pass it the value `dog` that local variable scoped in `main` is referencing.
- This problem demonstrates variable shadowing concept.

#### Object Passing/Variables as Pointers

1. What are a and b?

```ruby
a = "hi there"
b = a
a = "not here"

puts a, b
```

- The output is `not here` then `hi there` and the return value is `nil`
- On line one we initialize local variable called `a` to the string `hi there`. We then initialize a local variable called `b` to the value that local variable `a` is referencing which is `hi there`. On line 3, we reassign local variable `a` to the string `not here`. On the last line, we call `puts` method and pass it the values that local variables `a` and `b` are referencing  that are `not here` and `hi there`
- This problem demonstrates variables as pointers concept.

2. What are a and b?

```ruby
a = "hi there"
b = a
a << ", Bob"

puts a,b
```

- The outputs are the same `hi there, Bob` and the return value is `nil`
- On line 1, we initialize local variable called `a` to the string `hi there`. We also initialize local variable called `b` to the value `hi there` that local variable `a` is referencing. On line 3, we call the `String#<<` method on local variable `a` and pass it the string `, Bob` as an argument. This method is mutating string `hi there` On the last line, we call `puts` method and pass it the values that both local variable `a` and `b` are referencing which is `hi there , Bob`.
- This problem demonstrates variables as pointers concept.

3. What are a, b, and c? What if the last line was `c = a.uniq!`?

```ruby
a = [1, 2, 3, 3]
b = a
c = a.uniq
#=>  What if the last line was `c = a.uniq!`?
puts a,b,c
```

- The outputs are `[1,2,3,3]` for both local variable `a` and `b`, the output is `[1,2,3]` for local variable `c`. The return value is `nil`
- On line 1, we initialize a local variable called `a` to the array `[1,2,3,3]`. We initialize local variable called `b` to the value `[1,2,3,3]` that local variable `a` is referencing. On line 3, we initialize local variable called `c` to the return value `[1,2,3]` of calling the `uniq` method on the value `[1,2,3,3]` that local variable `a` is referencing. On the last line, we call `puts` method and pass it the values that local variable `a`, `b` and `c` is referencing that are `[1,2,3,3]`, `[1,2,3,3]` and `[1,2,3]`
- What if the last line was `c = a.uniq!`? The answer is the outputs for local variable `a`, `b` and `c` will be all the same which is `[1,2,3]`
- This problem demonstrates variable as pointers concept.

4. What is `a`? What if we called `map!` instead of `map`?

```ruby
def test(b)
	b.map {|letter| "I like the letter: #{letter}"}
end

a = ['a', 'b', 'c']
test(a)
```

- The output is nothing since there no method call to display information to the screen. The return value is `['I like the letter: a','I like the letter: b','I like the letter: c' `. Local variable `a` is `['a', 'b', 'c']`
- On line 1 we define a method called `test` that takes one parameter named `b`. Inside the method `test`, we call  `map` method on the value that local variable `b` is referencing and we also pass to the `map` method a `{..}` block as an argument. Inside the block, we initialize local variable called `letter` and we transform each value of the value(s) that local variable `b` is referencing to `I like the letter: #{letter}`. On line 5, we initialize local variable called `a` to the array `['a', 'b', 'c']`. On the last line, we called method `test` and pass  it `['a', 'b', 'c']` the value that local variable `a` is referencing.
- If we called `map!` instead of `map`, local variable `a` would be mutated and the value that `a` is referencing is `['I like the letter: a','I like the letter: b','I like the letter: c' `
- This problem demonstrates object passing concept.

5. What is `a` and `b`? Why?

```ruby
a = 5.2
b = 7.3
a = b
b += 1.1
```

- Local variable `a` is referencing float `7.3` and local variable `b` is referencing float `8.4`
- One line 1, we initialize local variable called `a` to the float `5.2`. Next, we initialize local variable called `b` to the float `7.3`. On line 3, we reassign local variable `a` to the value that local variable `b` is referencing which is `7.3`. On the last line, we reassign local variable `b` to the return value of the `Float#+` method called on the local variable `b` with the float `1.1` passed to it as an argument. Hence, local variable `b` is referencing the result of `7.3 + 1.1` which is `8.4`
- This problem demonstrates variable as pointers concept.

6.

 ```ruby
 def test(str)
	 str  += '!'
	 str.downcase!
 end
 test_str = 'Written Assessment'
 test(test_str)
 puts test_str
```

- The output value is `Written Assessment` and the return value is `nil`
- On line 1, we define a method called `test` that takes one parameter named `str`. Inside of the method, we reassign local variable `str` to the return value of `String#+` method called on local variable `str` with the string `!` passed to it as an argument. This method call create a new string object `Written Assessment!` and bind local variable `str` to it. On line 3, we call `downcase!` method on local variable `str`. Thus, the return value is `written assessment!`.  On line 5, we initialize a local variable called `test_str` to the string `Written Assesment`. We call method `test` and pass local variable `test_str` as an argument. We call the `puts` method on the last line and pass local variable `test_str` as an argument
- This problem demonstrates object passing and variable as pointers concept.

7.

```ruby
def plus(x, y)
	x = x + y
end

a = 3
b = plus(a, 2)

puts a
puts b
```

- The outputs are `3` and `5` and the return value is `nil`
- On line 1, we define method called `plus` which takes 2 parameters named `x` and `y`.  Inside of the method, we reassign local variable `x` to the return value of the `Integer#+` method called on local variable `x` with the local variable `y` passed to it as an argument. On line 5, we initialize local variable called `a` to the integer `3`.  On line 6, we initialize local variable called `b` to the return value of calling the `plus` method with local variable `a` and integer `2` passed to it as arguments. On the last 2 lines, we call `puts` method and pass local variables `a` and `b` as arguments.
- This problem demonstrates object passing and variable as pointers.

8.

```ruby
def increment(x)
	x << 'b'
end

y = 'a'
increment(y)
puts y
```

- The output is `ab` and the return value is `nil`
- On line 1, we define method called `increment` which takes 1 parameter named `x`. Inside of the method, we call `String#<<` on variable `x` and pass it string `b` as an argument.  On line 5, we initialize local variable called `y` to the string `a`. We then call `increment` method and pass it local variable `y` as an argument. On line 7, we call `puts` method and pass it local variable `y` as an argument.
- This problem demonstrates object passing and variable as pointers.

9.

```ruby
def change_name(name)
name = 'bob'  # does this reassignment change the object outside the method?
end

name = 'jim'
change_name(name)
puts name
```

- The output is `jim` and the return value is `nil`
- On line 1, we define method called `change_name` which takes 1 parameter named `name`. Inside of the method, we assign local variable `name` to the string `bob`. On line 5, we initialize a local variable called `name` to the string `jim`. On the next line, we call `change_name` method and pass local variable `name` as an argument. On the last line, we call `puts` method and pass local variable `name` as argument.
- This problem demonstrate object passing and variable as pointers

10.

```ruby
def cap(str)
	str.capitalize!   # does this affect the object outside the method?
end

name = "jim"
cap(name)
puts name
```

- The output is `Jim` and the return value is `nil`
- On line 1, we define method named `cap` which takes 1 parameter named `str`. Inside of the method, we call `capitalize!` method on local variable `str` that mutates local variable `str`. On line 5, we initialize local variable called `name` to the string `jim`. On line 6, we call the `cap` method and pass it local variable `name` as an argument. On  line 7, we call `puts` method with local variable `name` passed in as an argument.
- This problem demonstrates object passing and variable as pointers.

11.

```ruby
a = [1, 3]
b = [2]
arr = [a, b]
arr[1] = 5
p arr
```

- The output is `[[1,3],5` and the return value is `[[1,3],5`
- On line 1, we initialize local variable called `a` to the array `[1,3]`. On line 2, we initialize local variable called `b` to the array `[2]`. On line 3, we initialize local variable called `arr` to the array `[a,b]`. Thus, `arr` is referencing the array `[[1,3],2]`. On line 4, we reassign `index 1` of the local variable `arr` to the integer `5`. On the last line, we call `p` method with local variable `arr` passed in as an argument.
- This problem demonstrates object passing and variable as pointers.

12.

```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup

arr2.map! do |char|
	char.upcase
end

puts arr1
puts arr2
```

- The outputs are `a`,`b` and `c` for line 8, and `A`, `B` and `C` for line 9. The return value is `nil`
-
	- On line 1, we initialize local variable called `arr1` to the array `["a", "b", "c"]`.
	- On line 2, we initialize local variable called `arr2` to the return value of  `dup` method called on local variable `arr1`.This invocation makes the local variable `arr2` reference a new copy of the array `["a", "b", "c"]` as the result.
	- On line 4, we call `map!` method on local variable `arr2` and pass it a `do..end` block which takes 1 parameter named `char`.  The `char` parameter represents each element as `map!` method iterates through the array. This invocation will mutate each element of `arr2`  to `["A", "B", "C"]`
	- Inside of the block, we call `upcase` method on `char` parameter. This transforms each element of the `arr2` to upcased letter(s)
	- On the last 2 lines, we call `puts` method and pass them local variables `arr1` and `arr2`. This invocation will output `["a", "b", "c"]` and `["A", "B", "C"]` and return `nil`
- This concept demonstrates object passing and variable as pointer concepts.

#### Object Mutability/ Mutating Methods

1. What values do `s` and `t` have? Why?

```ruby
def fix(value)
	value.upcase!
	value.concat('!')
	value
end
s = 'hello'
t = fix(s)
```

The value that `s` is referencing is `HELLO!`  and the value that `t` is referencing is `HELLO!`

On line 1, we define method called `fix` which takes 1 parameter named `value`. Inside the method, we call `upcase!` method on local variable `value`. This invocation mutates the value that local variable `value` is referencing.  On line 2, we call `concat` method on local variable `value` with string `!` passed in as an argument. This invocation also mutate the value that local variable `value` is referencing by adding string `!` at the end. On line 3, we return local variable `value`.

On line 6, we initialize local variable called `s` to the string `hello`. On line 7, we initialize local variable called `t` to the return value of `fix` method with local variable `s` passed in as an argument.

This problem demonstrate object mutability and mutating methods concepts.

2. What values do `s` and `t` have? Why?

```ruby
def fix(value)
	value = value.upcase
	value.concat('!')
ed
s = 'hello'
t = fix(s)
```

The value that `a` is referencing is `hello` and the value that `t` is referencing is `HELLO!`

On line 1, we define method called `fix` which takes 1 parameter named `value`. Inside the method, we reassign local variable `value` to the return value of `upcase` method called on local variable `value`. This invocation returns new object that is assigned to local variable `value`

On line 3, we call `concat` method on local variable `value` with the string `!` passed to it as an argument.  This invocation mutates the value that local variable `value` is referencing by adding string `!` at the end.

On line 5, we initialize a local variable called `s` to the string `hello`. On line 6, we initialize local variable called `t` to the return value of `fix` method with local variable `s` passed in as an argument.

This problem demonstrates object mutability and mutating methods.

3. What values do `s` and `t` have? Why?

```ruby
def fix(value)
	value << 'xyz'
	value = value.upcase
	value.concat('!')
end
s = 'hello'
t = fix(s)
```

The value that `a` is referencing is `helloxyz` and the value that `t` is referencing is `HELLOXYZ!`

On line 1, we define method called `fix` which takes 1 parameter named `value`. Inside of the method, we call `String#<<` method on local variable `value` with string `xyz` passed in as an argument. This invocation mutates the value that local variable `value` is referencing by adding string `xyz` to the end. On line 3, we reassign local variable `value` to the return value of `upcase` method called on the local variable `value`. This invocation returns a new value and assigns it to local variable `value`. On line 4, we call `concat` method on local variable `value` with the string `!` passed in as an argument. This invocation mutates current value that local variable `value` is referencing.

On line 6, we initialize local variable called `s` to the string `hello`. We initialize local variable called `t` to the return value of `fix` method with local variable `s` passed in as an argument.

This problem demonstrates object mutability and mutating methods.

4. What values do `s` and `t` have? Why?

```ruby
def fix(value)
	value = value.upcase!
	value.concat('!')
end

s = 'hello'
t = fix(s)
```

The value that `a` is referencing is `HELLO!` and the value that `t` is referencing is `HELLO!`

> On  line 6, local variable `s` is initialized and references  the string object `hello`. On line 7, local variable `t` is initialized and references the return value of calling `fix` method and pass it `s` as an argument, binding its value to the method's parameter `value`. Inside of the method, `value`is reassigned to the return value of calling `upcase!` method on `value` which mutates and returns the string `HELLO`. On line 3,  `concat` method is called on `value` and get passed the string `!` as an argument which also mutates `value` and returns `HELLO!`. Because this is the last line of the method, it implicitly returns the string `HELLO!`.

5. What values do `s` and `t` have? Why?

```ruby
def fix(value)
	value[1] = 'x'
	value
end

s = 'abc'
t = fix(s)
```

The value that `s` is referencing is `axc` and the value that `t` is referencing is `axc`

6.

```ruby
def a_method(string)
	string << ' world'
end

a = 'hello'
a_method(a)
p a
```

The value that `a` is referencing is `hello world`

7.

```ruby
a = %w(a b c)
a[1] = '-'
p a
```

The value that `a` is referencing is `["a", "-", "c"]`

8.

```ruby
num = 3
num = 2 * num
```

> On line 1, local variable `num` is initialized and references the integer object `3`. On line 2, `num` is reassigned to the return value of calling `*` method on the integer `2` with `num` passed in as argument

9.

```ruby
def add_name(arr, name)
arr = arr + [name]
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```

> On line 5, local variable `names` is initialized and references the array object `['bob', 'kim']`. On line 6, `add_name` method is called and gets passed `names` and the string `jim` as arguments, binding `names`'s value to parameter `arr` and binding the string `jim` to parameter `name` of the method. Inside the method, `arr` is reassigned to the return value of calling `+` method on `arr` and gets passed `[name]` as an argument which does not mutate the original array `['bob', 'kim']` return `['bob', 'kim', 'jim']`. Because this is the last line of the method, `['bob', 'kim', 'jim']` is the return value of the method. On the last line, `names` is passed as an argument to the `puts` method invocation which outputs `'bob'`, `'kim'`  to the console

10.

```ruby
def add_name(arr, name)
arr = arr << name
end
names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```

> On line 5, local variable `names` is initialized and references the array object `['bob', 'kim']`. On line 6, `add_name` method is called and gets passed `names` and the string `jim` as arguments, binding `names`'s value to parameter `arr` and binding the string `jim` to parameter `name` of the method. Inside the method, `arr` is reassigned to the return value of calling `<<` method on `arr` and gets passed `[name]` as an argument which  mutates the original array `['bob', 'kim']` return `['bob', 'kim', 'jim']`. Because this is the last line of the method, `['bob', 'kim', 'jim']` is the return value of the method. On the last line, `names` is passed as an argument to the `puts` method invocation which outputs `'bob'`, `'kim'` and `'jim`  to the console
#### Each, Map, Select

1.

```ruby
array = [1, 2, 3, 4, 5]
array.select do |num|
	puts num if num.odd?
end
```

> On line 1, local variable `array` is initialized and references the array object `[1,2,3,4,5]`. On line 2, `select` method is called on `array` and gets passed a `do..end` block which takes one parameter called `num`. Upon each iteration of `select` method, each element is bound to `num` which is  then checked by calling `odd?` method on `num` to see if it's an odd number. If it's evaluated as true, then `puts` method is called and gets passed `num` as an argument, outputting its value to the console.

2.

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr.select { |n| n.odd? }
```

> On line 1, local variable `arr` is initialized and references the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. On line 2, `select` method is called on `arr` and gets passed `{}` block as an argument which also takes one parameter called `n`. Inside of the block, `n` represents each element of `arr`. Upon each iteration, `odd?` method is called on `n` which returns `true` or `false` when `n`'s value is an odd number or not. The return value of calling `select` method is `[1, 3, 5, 7, 9]`

3.

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
new_array = arr.select do |n|
	n + 1
end
p new_array
```

> On line 1, local variable `arr` is initialized and references the array `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. On line 2, local variable `new_array` is initialized and references the return value of calling `select` method on `arr` with a `do..end` block, which takes one parameter called `n` , passed in as an argument. Inside of the block, `n` represents each element of `arr`. Upon each iteration, `+` method is called on `n` and gets passed integer object `1` as an argument returning the sum of `1` and each element of `arr`. Because each result is evaluated as true, `select` method returns a new array containing all of the original array's elements.

4.

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
new_array = arr.select do |n|
	n + 1
	puts n
end
p new_array
```

5.

```ruby
words = %w(jump trip laugh run talk)
new_array = words.map do |word|
	word.start_with?("t")
	end
p new_array
```

6.

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr.each { |n| puts n }
```

7.

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
incremented = arr.map do |n|
	n + 1
end
p incremented
```

8.

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
new_array = arr.map do |n|
	n > 1
end
p new_array
```

9.

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
new_array = arr.map do |n|
	n > 1
	puts n
end

p new_array
```

10.

```ruby
a = "hello"
[1, 2, 3].map { |num| a }
```

11.

```ruby
[1, 2, 3].each do |num|
	puts num
end
```

#### Other Collection Methods

1.

```ruby
[1, 2, 3].any? do |num|
	num > 2
end
```

2.

```ruby
{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|
	value.size > 4
end
```

3.

```ruby
[1, 2, 3].all? do |num|
	num > 2
end
```

4.

```ruby
{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|
	value.length >= 3
end
```

5.

```ruby
[1, 2, 3].each_with_index do |num, index|
	puts "The index of #{num} is #{index}."
end
```

6.

```ruby
{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
	array << pair.last
end
```

7.

```ruby
{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
	hash[value] = key
end
```

8.

```ruby
odd, even = [1, 2, 3].partition do |num|
	num.odd?
end

p odd
p even
```

> On line 1, `partition` method is called on array object `[1,2,3]` and gets passed `do..en` block which takes parameter `num`. Inside of the block, `odd?` method is called on `num` which evaluates to `true` if the checked element is an odd number and vice versa. Therefore, first array `[1,3]` is assigned to local variable `odd`'s initialization and second array `[2]` is assigned to local variable `even`'s initialization.
#### Truthiness

1.

```ruby
a = "Hello"
if a
	puts "Hello is truthy"
else
	puts "Hello is falsey"
end
```

> On line 1, local variable `a` is initialized and references the string object `Hello`. On line 2, an `if` statement is used which evaluates `a` as true. The string `Hello is truthy` is output

2.

```ruby
def test
	puts "written assessment"
end

var = test #var = nil => false

if var
	puts "written assessment"
else
	puts "interview"
end
```

> On line 5, `test` method is called which outputs `written assessment` to the console when the `puts` method is called and gets passed the string object `written assessment`. Because this is the last line of the method, `nil` is the return value which is assigned to local variable `var`'s initialization.  On line 8, `if` statement is used to evaluate truthiness of `var`. Since `var`'s value is `nil`, the `else` statement is used which enable the `puts` method is called and gets passed string object `interview` outputting its value to the console.

