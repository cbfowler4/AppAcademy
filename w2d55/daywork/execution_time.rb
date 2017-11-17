require 'byebug'
def my_min1(list) # O(n^2)
  list.each do |num1|
    min = true
    
    list.each do |num2|
      min = false if num2 < num1
    end
    
    return num1 if min
  end
end

def my_min2(list) # O(n)
  min = list.first
  
  list.each do |num|
    min = num if num < min
  end
  
  min
end 

def sub_sum1(list) #O(n^2)
  totalarr = []
  
  (0...list.length).each do |idx1|
    (idx1...list.length).each do |idx2|
      totalarr << list[idx1..idx2]
    end
  end  
  totalarr.map{|arr| arr.reduce(:+)}.max
end

def sub_sum2(list) #O(n)
  return list.max if list.all?{|num| num <=0}
  ultimate_max = list.first
  current_max = list.first
  
  list.drop(1).each do |num|
    if current_max + num > 0
      current_max += num
    else 
      current_max = 0
    end
    
    if current_max > ultimate_max
      ultimate_max = current_max
    end
  end   
  ultimate_max
  
end