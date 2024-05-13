=begin

 Given a sequence of one or more consecutive natural numbers concatenated into
 a string, return the smallest possible first number in the sequence.
 Numbers will never be truncated.

 Examples
 "123" -> [1, 2, 3] -> 1
 "91011" -> [9, 10, 11] -> 9
 "17181920" -> [17, 18, 19, 20] -> 17
 "9899100" -> [98, 99, 100] -> 98
 "121122123" -> [121, 122, 123] -> 121
 "1235" -> [1235] -> 1235
 "101" -> [101] -> 101

=end

def split_numbers_with_length(numbers, length)
  result = []
  counter = 0

  loop do
    result << numbers.slice(counter, length).join
    counter += 2
    break if counter >= numbers.length - 1
  end

  result.map(&:to_i)
end

def solution(string)

  numbers = string.split('').map(&:to_i)

  left = 0
  right = 1
  size = nil

  loop do
    if numbers[right] - numbers[left] == 1
      size = 1
    else

    end

    break if endright >= numbers.size - 1
  end

end

p solution ('123')
p solution ('4567')
p solution ('91011')
p solution ('17181920')
# p split_numbers_with_length([1, 7, 1, 8, 1, 9, 2, 0], 2)
