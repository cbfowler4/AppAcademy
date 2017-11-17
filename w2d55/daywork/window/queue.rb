class Queue
  
  def initialize(array)
    @array = array
    @small_el = @array.min
    @largest_el = @array.max
  end
  
  def shift(num)
    self.array.shift
    self.array.push(num)
    self.dup
  end
  
  def max_range
    @largest_el - @small_el
  end
  
  
  
end