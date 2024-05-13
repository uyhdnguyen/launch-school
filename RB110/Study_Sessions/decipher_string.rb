def switch_chars(word)
  return word if word.size <= 2
  word[1..-1] + word[0]
end

def decipher_this(string)
  numbers = ("0".."9").to_a
  result = []
  sentence = string.split(" ")

  first_chars = sentence.map  { |word| word.to_i.chr }
  
  sentence.map do |word| 
    temp_word = word.chars.each_with_object("") do |char, cached_word|
      cached_word << char unless numbers.include?(char)
    end
    result << temp_word
  end

  result.map.with_index { |word, index| word.prepend(first_chars[index])}.map{|tmp| tmp[1], tmp[-1] = tmp[-1], tmp[1]}

end

p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") 

# p decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") == "The more he saw the less he spoke"
# p decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") == "The less he spoke the more he heard"
# p decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") == "Why can we not all be like that wise old bird"
# p decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") == "Thank you Piotr for all your help"

