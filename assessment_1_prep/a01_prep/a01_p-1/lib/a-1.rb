require 'byebug'
# Given an array of unique integers ordered from least to greatest, write a
# method that returns an array of the integers that are needed to
# fill in the consecutive set.

def missing_numbers(nums)
  (nums.first..nums.last).to_a - nums
end

# Write a method that given a string representation of a binary number will
# return that binary number in base 10.
#
# To convert from binary to base 10, we take the sum of each digit multiplied by
# two raised to the power of its index. For example:
#   1001 = [ 1 * 2^3 ] + [ 0 * 2^2 ] + [ 0 * 2^1 ] + [ 1 * 2^0 ] = 9
#
# You may NOT use the Ruby String class's built in base conversion method.

def base2to10(binary)
  bin_array = binary.chars.reverse
  i = 0
  sum = 0
  while i < bin_array.length
    sum += bin_array[i].to_i*(2**i)
    i+=1
  end
  sum
end

class Hash

  # Hash#select passes each key-value pair of a hash to the block (the proc
  # accepts two arguments: a key and a value). Key-value pairs that return true
  # when passed to the block are added to a new hash. Key-value pairs that return
  # false are not. Hash#select then returns the new hash.
  #
  # Write your own Hash#select method by monkey patching the Hash class. Your
  # Hash#my_select method should have the functionailty of Hash#select described
  # above. Do not use Hash#select in your method.

  def my_select(&prc)
    hash = Hash.new
    
    self.each do |k,v| 
      if prc.call(k,v)
        hash[k] = v
      end 
    end
    hash
  end

end

class Hash

  # Hash#merge takes a proc that accepts three arguments: a key and the two
  # corresponding values in the hashes being merged. Hash#merge then sets that
  # key to the return value of the proc in a new hash. If no proc is given,
  # Hash#merge simply merges the two hashes.
  #
  # Write a method with the functionality of Hash#merge. Your Hash#my_merge method
  # should optionally take a proc as an argument and return a new hash. If a proc
  # is not given, your method should provide default merging behavior. Do not use
  # Hash#merge in your method.

  def my_merge(hash, &prc)
    hsh = Hash.new
    prc ||= Proc.new {|k,oldval, newval| newval}
    self.each do |k,v| 
      if hash.key?(k)
        hsh[k] = prc.call(k, v, hash[k])
      else
        hsh[k] = v
      end
    end
    
    hash.each do |k, v|
      if !hsh.key?(k)
        hsh[k] = v
      end
    end
    
    hsh
  end

end

# The Lucas series is a sequence of integers that extends infinitely in both
# positive and negative directions.
#
# The first two numbers in the Lucas series are 2 and 1. A Lucas number can
# be calculated as the sum of the previous two numbers in the sequence.
# A Lucas number can also be calculated as the difference between the next
# two numbers in the sequence.
#
# All numbers in the Lucas series are indexed. The number 2 is
# located at index 0. The number 1 is located at index 1, and the number -1 is
# located at index -1. You might find the chart below helpful:
#
# Lucas series: ...-11,  7,  -4,  3,  -1,  2,  1,  3,  4,  7,  11...
# Indices:      ... -5, -4,  -3, -2,  -1,  0,  1,  2,  3,  4,  5...
#
# Write a method that takes an input N and returns the number at the Nth index
# position of the Lucas series.

def lucas_numbers(n)
  lucas_arr = [2, 1]
  reverse = false 
  
  if n < 0
    reverse = true 
    n *= -1
  end
  
  i = 1
  while i < n 
    lucas_arr << lucas_arr[i]+lucas_arr[i-1]
    i += 1
  end 
  
  return lucas_arr[n]*-1 if reverse && n.odd?
  lucas_arr[n]
end

# A palindrome is a word or sequence of words that reads the same backwards as
# forwards. Write a method that returns the longest palindrome in a given
# string. If there is no palindrome longer than two letters, return false.

def longest_palindrome(string)
  pal_arr = get_palindromes(string)
  return false if pal_arr.empty?
  sorted_arr = pal_arr.sort_by {|el| el.length}
  
  sorted_arr[-1].length
  
  
end

def get_palindromes(string)
  subsets = get_subsets(string)
  
  subsets.select do |word|
    word.length > 2 && palindrome?(word)
  end   
end 

def get_subsets(string)
  new_arr = []
  string.chars.each_index do |idx|
    j = idx 
    while j < string.length 
      new_arr << string[idx..j]
      j += 1
    end 
  end
  new_arr
end 

def palindrome?(string)
  string == string.reverse
end 
