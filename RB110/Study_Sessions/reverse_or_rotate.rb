=begin
[Kata Stats: Reverse or rotate? \| Codewars](https://www.codewars.com/kata/56b5afb4ed1f6d5fb0000991)
6 kyu
Reverse or rotate?
The input is a string str of digits. Cut the string into chunks (a chunk here is a substring of the initial string) of size size (ignore the last chunk if its size is less than size).

If a chunk represents an integer such as the sum of the cubes of its digits is divisible by 2, reverse that chunk; otherwise rotate it to the left by one position. Put together these modified chunks and return the result as a string.
if
size is <= 0 or if str is empty return ""
size is greater (>) than the length of str it is impossible to take a chunk of size size hence return "".


Examples:
revrot("66443875", 4) --> "4466 8753"
6644 => 6**3 + 6*6*6 + 4*4*4 + 4*4*4 = 560 / 2 => 6644 becomes 4466
3875 => 3**3 + 8**3 + 7**3 + 5**3 = 1007 not divisible by 2 so rotate by 1 take 1st digit and put it on the end

revrot("123456987654", 6) --> "234561876549"
=> 123456 => 1**3 + 2**3 + 3**3 + 4**3 + 5**3 + 6**3 == 441 => 234561
=>987654 => 9**3 + 8**3 + 7**3 + 6**3 + 5**3 + 4**3 = 1989 => 876549

p revrot("733049910872815764", 5) #== "330479108928157"
# p revrot("123456987654", 6) == "234561876549"
# p revrot("123456987653", 6) == "234561356789"
p revrot("66443875", 4) #== "44668753"
# p revrot("66443875", 8) == "64438756"
# p revrot("664438769", 8) == "67834466"
# p revrot("123456779", 8) == "23456771"
# p revrot("563000655734469485", 4) == "0365065073456944"

=end

def sum_of_the_cubes(string_num)
  sum = 0
  string_num.chars.each do |digit|
    sum += digit.to_i ** 3
  end
  sum
end

def reverse(string_num)
  string_num.reverse
end

def rotation(string_num)
  string_num[1..-1] + string_num[0]
end

def revrot (number, size)
  return "" if size <= 0 || number.empty? || size > number.length

  chunks = []
  counter = 0

  loop do 
    chunks << number.slice(counter, size)

    counter += size
    break if counter >= number.size - 1 
  end

  chunks.select {|chunk| chunk.size == size}
        .map do |num|
          if sum_of_the_cubes(num) % 2 == 0
            reverse(num)
          else
            rotation(num)
          end
        end.join
end

p revrot("733049910872815764", 5) == "330479108928157"
p revrot("123456987654", 6) == "234561876549"
p revrot("123456987653", 6) == "234561356789"
p revrot("66443875", 4) == "44668753"
p revrot("66443875", 8) == "64438756"
p revrot("664438769", 8) == "67834466"
p revrot("123456779", 8) == "23456771"
p revrot("563000655734469485", 4) == "0365065073456944"
