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

  end
end

def fibs_iter(n)

end

def fibs_rec(n)

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
  def merge_sort(&prc)
    prc ||= Proc.new {|x,y| x<=>y}
    return self if self.length == 1
    half_pos = self.length/2
    
    left = self.take(half_pos)
    right = self.drop(half_pos)
    
    merge(left.merge_sort(&prc), right.merge_sort(&prc), &prc)
  end

  def merge(left, right, &prc)
    arr = []
    while !left.empty? && !right.empty?
      case prc.call(left.first, right.first)
      when -1
        arr << left.shift
      else
        arr << right.shift
      end 
    end
    arr + left + right

  end 
  
end



def make_change(target, coins = [25, 10, 5, 1])
  
end
