=begin
For a given non-empty string s find a minimum substring t and the maximum number
k, such that the entire string s is equal to t repeated k times. The input
string consists of lowercase latin letters. Your function should return
a tuple (in Python) (t, k) or an array (in Ruby and JavaScript) [t, k]

Example #1:
for string
s = "ababab"
the answer is
["ab", 3]

Example #2:
for string
s = "abcde"
the answer is
because for this string "abcde" the minimum substring t, such that s is t repeated k times, is itself.
=end

def f(string)
  right_pointer = 0
  result = ''
  is_done = false
  result_array = []
  repeated_times = nil

  loop do
    result << string[right_pointer]

    1.upto(string.length) do |i|
      if result * i == string
        is_done = true
        repeated_times = i
      end
    end

    right_pointer += 1

    break if is_done == true
  end
  result_array << result << repeated_times
end

p f("ababab") == ["ab", 3]
p f("ababababab") == ["ab", 5]
p f("abcde") == ["abcde", 1]
p f("abcdefg") == ["abcdefg",1]