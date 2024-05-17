=begin
Count Items
Write a method that takes an array as an argument, and a block that returns true or false depending on the value of the array element passed to it. The method should return a count of the number of times the block returns true.

You may not use Array#count or Enumerable#count in your solution.

Examples:
=end
def count(arr)
  counter = 0

  arr.each do |ele|
    counter += 1 if yield(ele)
  end

  counter
end

def count(arr)
  counter = 0
  total = 0
  while counter < arr.size
    total += 1 if yield(arr[counter])
    counter += 1
  end

  total
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2