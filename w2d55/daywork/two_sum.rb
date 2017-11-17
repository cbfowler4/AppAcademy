def bad_two_sum?(arr, target_sum)
  new_arr = []
  (0...arr.length-1).to_a.each do |i|
    (i+1..arr.length-1).to_a.each do |j|
      return true if arr[i]+arr[j] == target_sum
    end 
  end
  false
end 

def okay_two_sum?(arr, target_sum)
  sorted_arr = arr.sort
  sorted_arr.each_with_index do |el, idx|
    new_target = target_sum - el
    new_sorted_arr = sorted_arr.dup
    new_sorted_arr.delete_at(idx)
    return true if (binary_search(new_sorted_arr, new_target))
  end 
  false
end

def binary_search(arr, target)
  return nil if arr.empty?
  
  half_pos = arr.length/2
  
  left = arr.take(half_pos)
  right = arr.drop(half_pos+1)
  
  if arr[half_pos] > target
    binary_search(left, target)
  elsif arr[half_pos] < target 
    results = binary_search(right, target)
    return nil if results.nil?
    results + half_pos + 1
  else
    half_pos
  end 
  
end 

def two_sum?(arr, target_sum)
  arr_hashed = Hash.new {|h,k| h[k]=true}
  
  arr.each do |el|
    arr_hashed[el]
  end 
  
  dup_hsh = arr_hashed.dup 
  
  arr_hashed.keys.each do |num|
    dup_hsh.delete(num)
    return true if dup_hsh.key?(target_sum - num)
  end
  
  false
end

