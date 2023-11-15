=begin
Find all pairs

You are given array of integers, your task will be to count all pairs in 
that array and return their count.

Notes:

Array can be empty or contain only one value; in this case return 0
If there are more pairs of a certain number, count each pair only once. 
E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)
Random tests: maximum array length is 1000, range of values in array 
is between 0 and 1000

Examples
[1, 2, 5, 6, 5, 2]  -->  2
...because there are 2 pairs: 2 and 5

[1, 2, 2, 20, 6, 20, 2, 6, 2]  -->  4
...because there are 4 pairs: 2, 20, 6 and 2 (again)

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3 
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0
=end

# Given array of integers

# Check if array is empty or only one value
    # return 0
# Check if given array is valid (the array length is between 2 and 1000)
    # Initialize counter 
    # Iterate through array length
        # If each value count == 2
            # Increase counter by 1
        # Else if each value count % 2 = 0
            # Increase counter by value count / 2
        # Else if there's no count
            # Return 0
    # Return counter

def pairs(array)
    counter = 0
    
    if array.length.between?(0,1)
        return counter
    elsif array.length.between?(2,1000)
        
        counted_hash = Hash.new(0)
        
        array.each{ |element| counted_hash[element] += 1}
        
        counted_hash.each do |k,v|
            if v >= 2 && v.even?
                counter += v / 2
            elsif v >= 2 && v.odd?
                counter += (v-1) / 2
            end
        end
        return counter
    end
end

p pairs([1, 2, 5, 6, 5, 2])
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2])
p pairs([0, 0, 0, 0, 0, 0, 0])
p pairs([1000, 1000])
p pairs([])
p pairs([54])