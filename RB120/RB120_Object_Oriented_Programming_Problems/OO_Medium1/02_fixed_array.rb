=begin

A fixed-length array is an array that always has a fixed number of elements. Write a class that implements a fixed-length array, and provides the necessary methods to support the following code:

BEHAVIORS(#) && STATE(+)
=======================
> FixedArray
  + elements : certain number, passed as argument on instantiation
    - each element implicitly initialized to reference `nil`
  #to_a
    - 
  #to_s
  #[]
    - if argument is out of bounds, throw an IndexError
    - use `Array#fetch`
  #[]=
    - if argument is out of bounds, throw an IndexError

The code below should output true 16 times.
=end

class FixedArray
  
  def initialize(max_size)
    @max_size = max_size
    @array = Array.new(max_size)
  end

  def to_s
    @array.to_s
  end

  def to_a
    @array
  end

  def [](index)
    @array.fetch(index)
  end
  
  def []=(index, new_val)
    @array.fetch(index)
    @array[index] = new_val
  end

end

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end
