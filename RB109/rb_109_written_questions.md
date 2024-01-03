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
  The output would be `Goodbye` and `Hello`. The return value is `nil`.