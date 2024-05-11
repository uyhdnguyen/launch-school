def reduce(arr, starting_acc = 0)
  if arr.all? { |ele| ele.is_a? Array}
    starting_acc = []
  elsif arr.all? { |ele| ele.is_a? String}
    starting_acc = ""
  elsif arr.all? { |ele| ele.is_a? Integer}
    starting_acc = 0
  end

  accumulator = starting_acc

  if block_given?
    counter = 0

    while counter < arr.size
      current_element = arr[counter]
      accumulator = yield(accumulator, current_element)
      counter += 1
    end
  end

  accumulator
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']