# def reduce(arr, starting_acc = 0)
#   if arr.all? { |ele| ele.is_a? Array}
#     starting_acc = []
#   elsif arr.all? { |ele| ele.is_a? String}
#     starting_acc = ""
#   elsif arr.all? { |ele| ele.is_a? Integer}
#     starting_acc = 0
#   end

#   accumulator = starting_acc

#   if block_given?
#     counter = 0

#     while counter < arr.size
#       current_element = arr[counter]
#       accumulator = yield(accumulator, current_element)
#       counter += 1
#     end
#   end

#   accumulator
# end

def reduce(arr, strt_val = nil)
  ctr = strt_val.nil? ? 1 : 0
  res = strt_val.nil? ? arr.first : strt_val

  while ctr < arr.size
    res = yield(res, arr[ctr])
    ctr += 1
  end

  res
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']