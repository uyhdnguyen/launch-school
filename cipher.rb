=begin
Write a program that conforms to the above instructions and encrypts text strings with the following simple (and very unsecure) cipher:

Replace each letter in the original string with another letter.
The first letter of the alphabet should be replaced with the last.
The second letter of the alphabet should be replaced with the next to last.
The third letter of the alphabet should be replace with the second from the last.
Continue on in this manner throughout the alphabet.
For example, the word money gets encrypted as nlmvb.


=end



class Cipher
  CUSTOM_ALPHABET = ("a".."z").zip(("a".."z").to_a.reverse).to_h
  NUMBER = ("0".."9").to_a
  
  def self.encode(str)
    result = []
    strings = str.downcase.chars
  
    strings.each do |chr|
      if CUSTOM_ALPHABET.has_key?(chr)
        result << CUSTOM_ALPHABET[chr]
      elsif NUMBER.include?(chr)
        result << chr
      end
    end
  
    result.each_slice(5).map(&:join).join(" ")
  end
end

