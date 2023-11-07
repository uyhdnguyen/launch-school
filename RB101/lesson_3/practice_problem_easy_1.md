#### What would you expect the code below to print out?

```ruby
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
```
>[!note]
> - Uniq is a non-destructive method in Ruby.
> - `numbers.uniq` returns new array which is `[1,2,3]`
> - `puts number` prints out `[1,2,2,3` since the original numbers array still  
points to the same value.
