require 'byebug'
# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.

def caesar_cipher(str, shift) ##try this multiple times ## 
  str_arr = str.split(" ")
  shift = shift % 26 

  full_arr = str_arr.map do |word|
    cipher(word, shift)
  end

  full_arr.join(" ")
end

def cipher(word, shift)
  alphabet = ("a".."z").to_a
  cipher = ""
    
  word.chars.each do |char|
    char_idx = alphabet.find_index(char)
    new_idx = calc_shift(char_idx, shift)
    cipher << alphabet[new_idx]
  end 
  cipher
end 

def calc_shift(char_idx, shift)
  return char_idx+shift if shift+char_idx < 25
  (shift+char_idx)-26
end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

def digital_root(num)
  return num if num < 10
  sum = digital_root_step(num)

  digital_root(sum)
end

def digital_root_step(num)
  num_arr = []
  while num > 10
    num_arr << num%10
    num /= 10
  end 
  num_arr << num 
  num_arr.reduce(:+)
end 

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
  if alphabet.nil?
    alphabet = ("a".."z").to_a
  end 
  
  jumbled_string = str.chars.sort_by {|char| alphabet.find_index(char)}
  jumbled_string.join
end


class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum
    pairs = []
    
    (0...length).each do |i|
      ((i+1)...length).each do |j|
        pairs << [i,j] if self[i]+self[j] == 0
      end
    end 
    pairs 
  end 

end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
    sub_words = self.subwords
    real_words = sub_words.select {|word| dictionary.include?(word)}
    real_words.uniq
  end
  
  def subwords
    arr = []
    self.chars.each_with_index do |el, idx|
      j = idx
      while j < self.length 
        arr << self[idx..j]
        j += 1
      end 
    end 
    arr
  end 

end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  (1..num).select {|el| num % el == 0}
end


