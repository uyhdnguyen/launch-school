def common_chars(arr)
  arr = arr.map{|word| word.dup}

  first_word = arr.shift.chars
  result = []

  first_word.each do |char|
    result << char if arr.all? {|word| word.include?(char)}
    arr.map! {|word| word.sub(char,"")}
  end
  result
end

 p common_chars(["bella", "label", "roller"])
#  p common_chars(["cool", "lock", "cook"])
#  p common_chars(["hello", "goodby","booya", "random"])