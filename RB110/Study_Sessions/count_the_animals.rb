
=begin

- PROBLEM
  - Input: array
  - Output: a hash contain the counted element as a key, and counts as values

  - Rules:
    - count elements in 2nd array is in the main array
    - if first array is empty, return empty hash
    - if both arrays is empty, return empty hash

- EXAMPLE
  - count_the_animals([], ['cat', 'dog', 'narwhal']) #== {}
  - count_the_animals([], []) #== {}
  - count_the_animals(animals, ['gecko', 'llama']) #== {'gecko'=> 5}
  
- DATA STRUCTURE
  - hash because the output is a hash

- ALGORITHM
  - CREATE result hash which contains the animal and its count
    - initialize a hash for counts and elements
      - 'result'
  - FIND all elements that available in both array
  - RETURN the counts and elements in first arrray to result
    - use assignment method to add count and element to 'result' 
  - RETURN the result
=end

animals = [
            'cat', 'dog', 'cat', 'cow', 'horse', 'lizard',
            'gecko', 'dog', 'cat', 'mouse', 'moose', 'moose',
            'bear', 'horse', 'cat', 'lizard', 'gecko', 'lizard',
            'lizard', 'gecko', 'cat', 'cat', 'bear', 'cat',
            'gecko', 'dog', 'cat', 'mouse', 'moose', 'moose',
            'lizard', 'gecko', 'cat', 'narwhal', 'bear', 'cat',
            'cat', 'dog', 'cat', 'cow', 'horse', 'lizard'
          ]

def count_the_animals(arr1, arr2)
  result = {}

  return result if arr1.empty?

  arr2.each{ |animal| result[animal] = arr1.count(animal) if arr1.include?(animal)}

  result
end


p count_the_animals([], ['cat', 'dog', 'narwhal']) #== {}
p count_the_animals(animals, ['cat', 'dog', 'narwhal']) #== {'cat'=> 12, 'dog'=> 4, 'narwhal'=> 1}
p count_the_animals(animals, ['gecko', 'llama']) #== {'gecko'=> 5}
p count_the_animals([], []) #== {}