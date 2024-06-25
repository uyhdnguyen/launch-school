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
	res = []
	ctr = 0
	
	while ctr < arr.size
		cur_ele = arr[ctr]

		res << cur_ele if yield(cur_ele)

		ctr += 1
	end

	res
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true
