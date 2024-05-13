=begin

  Complete the solution so that the function will break up camel casing,
  using a space between words.

  Example
  "camelCasing"  =>  "camel Casing"
  "identifier"   =>  "identifier"
  ""             =>  ""

=end

def solution(string)
  string = string.chars

  result = []

  string.each do |char|
    if char =~ /[A-Z]/
      result << ' ' << char
    else
      result << char
    end
  end

  result.join
end

def solution(string)
  string.chars.map { |char| char == char.downcase ? char : " #{char}" }.join
end

p solution ('camelCase')
p solution ('identifier')
p solution ('')
