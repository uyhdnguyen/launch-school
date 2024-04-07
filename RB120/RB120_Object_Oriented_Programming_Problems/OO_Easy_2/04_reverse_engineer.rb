class Transform
  attr_accessor :string

  def initialize(string)
    self.string = string # calling setter method for string
  end

  def uppercase
    string.upcase # calling getter method for string
  end

  def self.lowercase(string)
    string.downcase # local variable string
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')

# Advance method
class Transform < String
  def uppercase
    self.upcase
  end

  def self.lowercase(input)
    input.downcase
  end
end