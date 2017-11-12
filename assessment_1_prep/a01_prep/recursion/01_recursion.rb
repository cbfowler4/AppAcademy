require 'byebug'
 
def range(min, max)
  return [max] if min == max 
  
  [min] + range(min+1, max)
end

def sum_iter(nums)
  
end

def sum_rec(nums)
  
end

def exp1(base, power)
  return 1 if power == 0
  
  base*exp1(base,power-1)
end

def exp2(base, power)
  return base if power == 1
  
  power.odd? ? base*(exp2(base, (power-1)/2)**2) : exp2(base,(power)/2)**2
end

class Array
  def deep_dup
    return self.dup unless self.any? {|el| el.is_a?(Array)}
    
    self.map {|el| el.is_a?(Array) ? el.deep_dup : el}
  end
end

def fibs_iter(n)
  fibs = [0,1]
  return [] if n == 0
  return fibs[0..n-1] if n <=2
  i = 1
  while i < n 
    fibs << fibs[i-1]+fibs[i]
    i+=1
  end 
  fibs 
end

def fibs_rec(n)
  if n<=2
    [0,1].take(n)
  else 
    fibs = fibs_rec(n-1)
    fibs << fibs[-2] + fibs[-1]
  end 
end

class Array
  def subsets
    
  end
end

def permutations(array)
  
end

def bsearch(nums, target)
  return nil if nums.empty?
  half_pos = nums.length/2
  return half_pos if nums[half_pos] == target
  
  left = nums.take(half_pos)
  right = nums.drop(half_pos+1)
  
  if nums[half_pos] > target
    bsearch(left, target)
  else 
    result = bsearch(right,target)
    result.nil? ? nil : result + half_pos + 1
  end
end

class Array
  def merge_sort

  end

  def merge(left, right)

  end 
  
end

def make_change(target, coins = [25, 10, 5, 1])
  
end
