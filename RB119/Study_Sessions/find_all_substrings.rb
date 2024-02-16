def substrings(string)
  result = [] 
  
  string.size.times do |start_index|

    substring = string[start_index..-1]

    substring.size.times do |index|
      result << substring[0..index]
    end
  end

  result.size
end

p substrings 'hello'
