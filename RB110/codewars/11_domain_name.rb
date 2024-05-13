=begin
FIRST TRY TOOK 36 MINS

Extract the domain name from a URL

(https://www.codewars.com/kata/514a024011ea4fb54200004b/train/ruby)

5 kyu

=begin

Write a function that when given a URL as a string, parses out just the domain name and returns it as a string. For

example:

domain_name("http://github.com/carbonfive/raygun") == "github"

domain_name("http://www.zombie-bites.com") == "zombie-bites"

domain_name("https://www.cnet.com") == "cnet"


p domain_name("http://google.com") == "google"

p domain_name("http://google.co.jp") == "google"

p domain_name("www.xakep.ru") == "xakep"

p domain_name("https://youtube.com") == "youtube"

PROBLEM
-------
- input: string that represents URL 
- output: string that represents just the domain name

- http://
- http://www.
- https://
- https://www.
- www.
- domain name
- "." end of domain name

- domain name can contain dashes

EXAMPLES
--------
"http://github.com/carbonfive/raygun"
->  "github"

"http://www.zombie-bites.com"
-> "zombie-bites"

"https://www.cnet.com"
-> "cnet"

"www.xakep.ru"
-> "xakep"

DATA STRUCTURES
---------------
- ARRAY contains prefixes
  - http://
  - http://www.
  - https://
  - https://www.
  - www.
- ARRAY contains the alphabet and "-" and numbers

ALGORITHM
---------
- HELPER METHOD `clean_up_url`
  - input: string as url
  - output: cleaned up prefix  url

  - create `clean_url` string
  - create ARRAY contains prefixes
    - `url_prefixes`
  - find which prefix for given url
    - iterate through `url_prefixes`
    - if given url include prefix
      - delete the prefix
  - return cleaned url
---------------------------------------------------------
- create resul domain name
  - `domain_name`
- create ARRAY contains the alphabet and "-" and numbers  
  - `dictionary` ("a".."z").to_a + "-" + (0..9).to_a
- find domain name
  - iterate trhough cleaned up string
    `clean_url`
  - if char is in `dictionary`
    - add char to `domain_name`
  - else   if char == "."
    - break
- return `domain_name`
=end

def clean_up_url(url)
  url_prefixes = %w(https://www. http://www. http://  https://  www.)
  
  clean_url = ''

  url_prefixes.each do |prefix|
    if url.include?(prefix)
      clean_url = url.gsub(prefix, "") 
      break
    end
  end

  clean_url
end

def domain_name(url)
  domain_name = ""

  dictionary = ("a".."z").to_a + ["-"] + ("0".."9").to_a

  clean_url = clean_up_url(url)

  clean_url.each_char do |chr|
    if dictionary.include?(chr)
      domain_name.concat(chr)
    elsif chr == "."
      break
    end
  end

  domain_name
end

p domain_name("http://github.com/carbonfive/raygun") == "github"

p domain_name("http://www.zombie-bites.com") == "zombie-bites"

p domain_name("https://www.cnet.com") == "cnet"

p domain_name("http://google.com") == "google"

p domain_name("http://google.co.jp") == "google"

p domain_name("www.xakep.ru") == "xakep"

p domain_name("https://youtube.com") == "youtube"

