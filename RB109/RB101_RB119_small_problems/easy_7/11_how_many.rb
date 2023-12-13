# Write a method that counts the number of occurrences of each element in a
# given array.

# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]

# count_occurrences(vehicles)

# The words in the array are case-sensitive: 'suv' != 'SUV'. Once counted,
# print each element alongside the number of occurrences.

# Expected output:

# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

# def count_occurrences(array)
#   result = Hash.new(0)
#   array.each { |el| result[el.downcase] += 1 }
#   result.each { |element, count| puts "#{element} => #{count}" }
# end

def count_occurrences(array)
  occurrences = {}

  array.each do |element|
    occurrences[element] = array.count(element)
  end
  occurrences
  # occurrences.each do |element, count|
  #   puts "#{element} => #{count}"
  # end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

p count_occurrences(vehicles)