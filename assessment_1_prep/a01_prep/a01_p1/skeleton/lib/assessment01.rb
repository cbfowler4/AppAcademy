require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &prc)
    arr = self
    if accumulator.nil?
      accumulator = self.first 
      arr = self.drop(1)
    end
    
    i = 0
    while i < arr.length 
      accumulator = prc.call(accumulator, arr[i])
      i+=1
    end
    
    accumulator
  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  (2...num).to_a.none? {|x| num % x == 0}
end

def primes(num)
  arr = []
  i = 2
  until arr.length >= num
    if is_prime?(i)
      arr << i 
    end 
    i +=1
  end 
  arr 
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1

  previous_facs = factorials_rec(num-1)
  previous_facs << previous_facs.last * (num-1)
  previous_facs
end


class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hsh = Hash.new {|h,k| h[k] = []}
    self.each_with_index {|el,idx| hsh[el] << idx}
    
    hsh.select {|k,v| hsh[k].length > 1}
    
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    subsets = self.subsets
    
    subsets.select {|word| word.palindrome?}
  end
  
  def subsets
    arr = []
    self.chars.each_with_index do |char, idx|
      (idx...self.length).each do |j|
        arr << self[idx..j] if self[idx..j].length > 1
      end 
    end 
    arr
  end 
  
  def palindrome?
    self == self.reverse
  end 
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    prc ||= Proc.new {|x,y| x<=>y}
    return self if self.length <= 1
    
    
    
    half_pos = self.length/2
    left = self.take(half_pos)
    right = self.drop(half_pos)
    
    Array.merge(left.merge_sort(&prc), right.merge_sort(&prc), &prc)
  end

  private
  def self.merge(left, right, &prc)
    arr = []
    while !left.empty? && !right.empty?
      case prc.call(left.first, right.first) 
        when -1
          arr << left.shift 
        when 0, 1
          arr << right.shift
      end 
    end 

    arr + left + right 
    
  end
end
