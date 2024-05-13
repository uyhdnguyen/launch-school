=begin
Complete the function that takes an array of words.
You must concatenate the nth letter from each word to construct a new word which should be returned as a string,
where n is the position of the word in the list.
For example:
["yoda", "best", "has"] --> "yes"
^ ^ ^
n=0 n=1 n=2
Note: Test cases contain valid input only - i.e. a string array or an empty array; and each word will have enough letters.
=end

def nth_char(array_of_strings)
  result = ''
  array_of_strings.length.times do |index|
    result << array_of_strings[index][index]
  end
  result
end

p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No', 'No']) == 'No'
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) == 'Codewars'