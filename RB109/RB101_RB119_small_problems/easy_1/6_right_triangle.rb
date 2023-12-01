# Write a method that takes a positive integer, n, as an argument, and displays
# a right triangle whose sides each have n stars. The hypotenuse of the triangle
# (the diagonal side in the images below) should have one end at the lower-left
# of the triangle, and the other end at the upper-right.
SPACE = ' '
ASTERISK = '*'

def triangle_up(num)
  space_counter = num - 1
  asterisk_counter = 1

  num.times do |index|
    puts SPACE * space_counter + ASTERISK * asterisk_counter
    space_counter -= 1
    asterisk_counter += 1
  end
end

def triangle_down(num)
  space_counter = 0
  asterisk_counter = num

  num.times do |index|
    puts SPACE * space_counter + ASTERISK * asterisk_counter
    space_counter += 1
    asterisk_counter -= 1
  end
end

def triangle_right(num)
  space_counter = num - 1
  asterisk_counter = 1

  num.times do |index|
    puts ASTERISK * asterisk_counter + SPACE * space_counter
    space_counter -= 1
    asterisk_counter += 1
  end
end

def triangle_left(num)
  space_counter = 0
  asterisk_counter = num

  num.times do |index|
    puts ASTERISK * asterisk_counter + SPACE * space_counter
    space_counter += 1
    asterisk_counter -= 1
  end
end

triangle_down(5)

triangle_up(5)

triangle_right(5)

triangle_left(5)