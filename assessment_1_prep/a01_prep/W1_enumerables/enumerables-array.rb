require 'byebug'
class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&prc)
    i = 0
    return_arr = []
    while i < self.length
      if prc.call(self[i])
        return_arr << self[i]
      end
      i+=1
    end
    return_arr
  end

  def my_reject(&prc)
    i = 0
    return_arr = []
    while i < self.length
      if !prc.call(self[i])
        return_arr << self[i]
      end
      i+=1
    end
    return_arr
  end

  def my_any?(&prc)
    i = 0
    while i < self.length
      if prc.call(self[i])
        return true
      end
      i +=1
    end
    false
  end

  def my_all?(&prc)
    i = 0
    while i < self.length
      if !prc.call(self[i])
        return false
      end
      i += 1
    end
    true
    
  end

  def my_flatten(arr = []) ##know what this does
    i = 0
    while i < self.length
      if self[i].class == Array
        self[i].my_flatten(arr)
      else
        arr << self[i]
      end
      i += 1
    end
    arr
  end

  def my_zip(*arrays) ### trouble spot ### 
    #creates a new array of size self, puts self element corresponding to position into pos 0
    #iterates over each array and puts element corresponding to position into pos at that index
    #if no pos exists, it puts nil there
    zipped_arr = Array.new(self.length) {Array.new()} ### trouble spot ###
    i = 0
    while i < zipped_arr.length
      zipped_arr[i] << self[i]
      arrays.my_each do |el|
        zipped_arr[i] << el[i]
      end
      i += 1
    end
    zipped_arr
  end

  def my_rotate(positions = 1) ## know what this does
    
    pos = positions % self.length
    
    self.drop(pos) + self.take(pos)
    
  end

  def my_join(separator = "")
    i = 0
    str = ""
    while i < self.length-1
      str << self[i].to_s << separator
      i +=1
    end
    str << self[-1].to_s
  end

  def my_reverse
    i = 0
    rev_arr = []
    while i < self.length
      rev_arr.unshift(self[i])
      i += 1
    end
    rev_arr
    
  end

end
