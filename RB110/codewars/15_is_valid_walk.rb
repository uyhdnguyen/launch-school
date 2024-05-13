=begin
15. Take a Ten Minute Walk

(https://www.codewars.com/kata/54da539698b8a2ad76000228/train/ruby)

6 kyu

You live in the city of Cartesia where all roads are laid out in a perfect grid. You arrived ten minutes too early to an

appointment, so you decided to take the opportunity to go for a short walk. The city provides its citizens with a Walk

Generating App on their phones -- everytime you press the button it sends you an array of one-letter strings

representing directions to walk (eg. ['n', 's', 'w', 'e']). You always walk only a single block in a direction and you know it

takes you one minute to traverse one city block, so create a function that will return true if the walk the app gives you

will take you exactly ten minutes (you don't want to be early or late!) and will, of course, return you to your starting point.

Return false otherwise.

Note: you will always receive a valid array containing a random assortment of direction letters ('n', 's', 'e', or 'w' only). It

will never give you an empty array (that's not a walk, that's standing still!).

PROBLEM
-------
- input: an array contains only ['n', 's', 'w', 'e']
- ouput: true/false validates the 10 mins walk

- each direction is 1 minute
- total is 10 mins
  - from starting point -> travel -> back to starting point
- no empty arr
- the size of given arr is 10 (CHECK)

EXAMPLES
--------
['n','s','n','s','n','s','n','s','n','s']
-> true

['w','e','w','e','w','e','w','e','w','e','w','e']
-> false

['w']
-> false

['n','n','n','s','n','s','n','s','n','s']
-> false

DATA STRUCTURES
---------------
- hash contains the 4 directions
  - key is direction
  - value is 1 / -1

ALGORITHM
---------
- create hash contains the 4 directions with initial counts equal 0
  - `directions` 
- find  the counts for each direction from given array
- return the counts to `directions`

- return true/false
  - return true if 2 pairs of `directions` are equal
  - else, return false
=end


# def is_valid_walk(arr)
#   return false unless arr.size == 10

#   directions = {"n" => 0, "s" => 0, "w" => 0, "e" => 0}

#   directions.each do |dir, count|
#     directions[dir] = arr.count(dir) if arr.include?(dir)
#   end

#   return true if directions["n"] == directions["s"] && directions["e"] == directions["w"]
 
#   false
# end

def is_valid_walk(walk)
  walk.count('w') == walk.count('e') &&
  walk.count('n') == walk.count('s') &&
  walk.count == 10
end

p is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) == true

p is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == false

p is_valid_walk(['w']) == false

p is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false