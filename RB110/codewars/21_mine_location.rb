=begin
FIRST TRY 17 MINS

21. Find the Mine!

(https://www.codewars.com/kata/528d9adf0e03778b9e00067e/train/ruby)

6 kyu

You've just discovered a square (NxN) field and you notice a warning sign. The sign states that there's a single bomb in

the 2D grid-like field in front of you.

Write a function mine_location/mine_location that accepts a 2D array, and returns the location of the mine. The mine is

represented as the integer 1 in the 2D array. Areas in the 2D array that are not the mine will be represented as 0s.

The location returned should be an array (Tuple<int, int> in C#) where the first element is the row index, and the second

element is the column index of the bomb location (both should be 0 based). All 2D arrays passed into your function will

be square (NxN), and there will only be one mine in the array.

PROBLEM
-------
- input: array that is a 2D array
- output: array that is the location of the mine

- `mine_location`
- mine is int 1 in the input
- the rest are 0 as there are no mines in those location
- mine location
  - first index is row
  - second index is collumn
- only 1 mine in the array

EXAMPLES
--------
[1, 0, 0]
[0, 0, 0]
[0, 0, 0]

-> [0,0]
Row : 1
Collum : 1

[0, 0, 0]
[0, 1, 0]
[0, 0, 0]

-> [1, 1]
Row : 2
Collum : 2

[0, 0, 0]
[0, 0, 0]
[0, 1, 0]

-> [2,1]
Row : 3
Collum : 1

DATA STRUCTURES
---------------
- array contains the location of the mine

ALGORITHM
---------
- array contains the location of the mine
  - location/ []
- FIND the location of the mine
  - iterate through all of the rows of given field
    - return the index of row if that row has the mine as row
    - return the index of the mine as collumn
- RETURN the location
=end

def mine_location(field)
  field.each_with_object([]) do |row, location|
    if row.include?(1)
      location << field.index(row)
      location << row.index(1)
    end
  end
end

p mine_location( [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ] ) == [0, 0]

p mine_location( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] ) == [1, 1]

p mine_location( [ [0, 0, 0], [0, 0, 0], [0, 1, 0] ] ) == [2, 1]

p mine_location([ [1, 0], [0, 0] ]) == [0, 0]

p mine_location([ [1, 0, 0], [0, 0, 0], [0, 0, 0] ]) == [0, 0]

p mine_location([ [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0] ]) == [2, 2]
