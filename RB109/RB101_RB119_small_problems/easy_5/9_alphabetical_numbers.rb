# Write a method that takes an Array of Integers between 0 and 19, and returns
# an Array of those Integers sorted based on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven,
# twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

# Examples:

# alphabetic_number_sort((0..19).to_a) == [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ]

NUMBER_WORDS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)
# def alphabetic_number_sort(number)
#   number.sort_by { |num| NUMBER_WORDS[num] }
# end

# p alphabetic_number_sort((0..8).to_a)

def alphabetic_number_sort(numbers)
  # Create a list for numbers and its English names.
  list = {}
  counter = 0
  NUMBER_WORDS.each do |word|
    list[word] = counter
    counter += 1
  end
  # Sort number in theirs English form and retrieve corresponding numbers
  result = []
  NUMBER_WORDS.sort.each {|word| result << list[word]}
  result
end

p alphabetic_number_sort((0..19).to_a)
