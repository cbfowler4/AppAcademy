require 'byebug'

class Stack
  def initialize(array)
    @stack = array
  end
    
  def add(el)
    @stack.push(el)
  end
  
  def remove
    @stack.pop
  end
  
  def show
    @stack
  end
  
end


class Queue
  def initialize(array)
    @queue = array
  end
  
  def enqueue(el)
    @queue.unshift(el)
  end
  
  def dequeue
    @queue.pop
  end
  
  def show
    @queue 
  end
end

class Map 
  def initialize(array = [])
    @map = array
  end
  
  def assign(key, value)
    if include?(key)
      self.remove(key)
    end
    
    @map << [key, value]
  end
  
  def lookup(key)
    return nil if @map.include?(key)
    key_arr = keys
    key_idx = key_arr.find_index(key)
    @map[key_idx][1]
  end
  
  def keys
    @map.map {|pairs| pairs[0]}
  end
  
  def include?(el)
    keys.include?(el)
  end
  
  def remove(key)
    key_idx = keys.find_index(key)
    return nil if !self.include?(key)
    @map.delete_at(key_idx)
  end
end

