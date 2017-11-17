# def my_perm(arr)
#   return [arr] if arr.length <=1
#   result = []
#   (0...arr.length).each do |i|
#     rotate_str = arr.rotate(i)
#     perms = my_perm(rotate_str.drop(1))
#     perms.each do |el|
#       result << arr.take(1) + el
#     end
#   end
#   result
# end
require "byebug"

def first_anagram?(first, second) # O(n!)
  string_perms = first.split("").permutation.to_a
  
  string_perms.map! {|arr| arr.join()}
  return true if string_perms.include?(second)
  false
end 

def second_anagram?(first, second) #O(n^2)
splitted_second = second.chars
splitted_first = first.chars
  first.chars.each do |char|
    found_char = splitted_second.find_index(char)
    if found_char
      splitted_second.delete_at(found_char)
      splitted_first.delete_at(splitted_first.find_index(char))
    end
  end
  return true if splitted_first.empty? && splitted_second.empty?
  false
end 

def third_anagram?(first,second) #O(nlogn)
  first.chars.sort == second.chars.sort
end

def fourth_anagram?(first, second)
  first_hsh = Hash.new(0)
  second_hsh = Hash.new(0)
  
  first.chars.each do |char|
    first_hsh[char] += 1
  end 
  
  second.chars.each do |char|
    second_hsh[char] += 1
  end 
  
  first_hsh == second_hsh
end 