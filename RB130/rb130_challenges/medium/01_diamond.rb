=begin
PROBLEM
-------
  - programs that takes string letter input
  - create diamond shape
  - diamond always start with "A"
  - supplied letter at the widest point
  - first row one "A"
  - last row one "A"
  - letters form the shape of diamond
  - all other rows have exactly two identical letters
  - diamond is horizontally and vertically symmetric
  - diamond's width and height are equal
  - top half in ascending ordr
  - bottom half in descending order
  - the four corners are triangles ???

EXAMPLES
--------
  - C
1   A
2  B B
3 C   C
2  B B
1   A

  - E
    A
   B B
  C   C
 D     D
E       E
 D     3 
  C   C
   B B
    A

1 "    A    \n"\
2 "   B B   \n"\
3 "  C   C  \n"\
4 " D     D \n"\
5 "E       E\n"\
4 " D     D \n"\
3 "  C   C  \n"\
2 "   B B   \n"\
1 "    A    \n"

DATA STRUCTURES
---------------
- INPUT: string that is supplied letter to create diamond
- OUTPUT: string that forms diamond shape

- INTERMEDIATE:
  - range for top half of diamond
  - range for bottom half of diamond

ALGORITHM
---------
- create class  Diamond
- create class method `make_diamond` that takes one parameter
  - def self.make_diamond(chr)
  
  - return "A" if supplied letter is "A"

  - create alphabet from B-Z hash with keys are letters and values are required spaces 
    - alphabet = []
    - 1.step(51, 2) {|n| alphabet <<  n}
    - ("B".."Z").zip(alphabet).to_h

  - create max size of the diamond
    - diamond_size = alphabet[chr]

  - create default row
    - default_row = "A".center(diamond_size)
  - create diamond result array
    - top_half_diamond = [default_row]

  - create top half of the diamond
    - iterate through alphabet
      - alphabet.each do |ch, s|    
      - if ch < chr, append the `ch` and spaces to `diamond`
        - current_line = (ch + " " * alphabet[ch] + ch).center(diamond_size)
        - diamond << current_line  if ch < chr
  
  - create middle row
    - middle_row = (chr + " " * alphabet[chr] + chr).center(diamond_size)

  - create bottom half of the diamond
    - bottom_half_diamond = top_half_diamond.reverse
        
  - return diamond
    - (top_half_diamond + middle_row + bottom_half_diamond).join("\n")
=end

class Diamond
  def self.make_diamond(chr)
    return "A\n" if chr == "A"

    alphabet = []
    1.step(51, 2) {|n| alphabet <<  n}
    alphabet_hash = ("B".."Z").zip(alphabet).to_h
    
    diamond_size = alphabet_hash[chr] + 2

    default_row = "A".center(diamond_size)

    top_half_diamond = [default_row]

    alphabet_hash.each do |ch, sp|    
      current_line = (ch + (" " * sp) + ch).center(diamond_size)
      top_half_diamond << current_line  if ch < chr
    end

    middle_row = [(chr + (" " * alphabet_hash[chr]) + chr).center(diamond_size)]

    bottom_half_diamond = top_half_diamond.reverse

    (top_half_diamond + middle_row + bottom_half_diamond).join("\n") + "\n"
  end
end

p Diamond.make_diamond("B")

require 'minitest/autorun'
# require_relative '10_diamond'
require 'minitest/reporters'
Minitest::Reporters.use!

class DiamondTest < Minitest::Test
  def test_letter_a
    answer = Diamond.make_diamond('A')
    assert_equal "A\n", answer
  end

  def test_letter_b
    # skip
    answer = Diamond.make_diamond('B')
    assert_equal " A \nB B\n A \n", answer
  end

  def test_letter_c
    # skip
    answer = Diamond.make_diamond('C')
    string = "  A  \n"\
             " B B \n"\
             "C   C\n"\
             " B B \n"\
             "  A  \n"
    assert_equal string, answer
  end

  def test_letter_e
    # skip
    answer = Diamond.make_diamond('E')
    string = "    A    \n"\
             "   B B   \n"\
             "  C   C  \n"\
             " D     D \n"\
             "E       E\n"\
             " D     D \n"\
             "  C   C  \n"\
             "   B B   \n"\
             "    A    \n"
    assert_equal string, answer
  end
end
