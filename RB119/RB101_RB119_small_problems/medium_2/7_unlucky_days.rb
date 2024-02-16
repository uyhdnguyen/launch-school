=begin
PROBLEM
=======
- write a method that returns the number of Friday 13th
- the year is passed in as an argumenmt
- the year > 1752 
- 52 weeks in 1 year
- 

EXAMPLES
========
friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2

DATA STRUCTURES
===============
- input: integer that represent the given year
- maybe an array to keep track of the number of times
  - Date method
  - friday? method
  - initialize Date object
- output: integer that represent how many Friday 13th

ALGORITHM
=========
- create place holder for the end of the given year
  - Date.new method
- create an array to hold all of the Friday 13th
- select all of the Friday 13th
  - step method
- return result array

=end

require 'date'

def friday_13th(year)
  (1..12).select.count do |month|
    date = Date.new(year, month, 13) 
    date.friday?
  end
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2