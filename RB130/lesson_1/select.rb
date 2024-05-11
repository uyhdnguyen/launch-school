# def select(arr)
#   result = []

#   if block_given?
#     counter = 0

#     while counter < arr.size
#       temp = yield(arr[counter])
#       result << arr[counter] if !!temp
#       counter += 1
#     end
#   end

#   result
# end

def select(arr)
  result = []

  if block_given?
    counter = 0

    while counter < arr.size
      current_element = arr[counter]
      result << current_element if yield(current_element)
      counter += 1
    end
  end

  result
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }
p select(array) { |num| puts num }
p select(array) { |num| num + 1 }
