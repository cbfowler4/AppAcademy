class Array
  
  def my_uniq
    result = []
    self.each { |el| result << el unless result.include?(el) }
    result
  end
  
  def two_sum
    new_arr =[]
    (0...self.length-1).to_a.each do |i|
      ((i + 1)...self.length).to_a.each do |j|
        new_arr << [i,j] if self[i] +self[j] == 0
      end
    end
    new_arr
  end

  def my_transpose
    
    arr = Array.new(self[0].length) {Array.new(self.length)}
    
    self.each_with_index do |row,i|
      row.each_with_index do |el, j|
        arr[j][i] = self[i][j]
      end 
    end
    
    arr 
  end 
end

def stock_picker(days)
  max_profit = 0
  pair = [nil, nil]
  (0...days.length-1).to_a.each do |i|
    ((i + 1)...days.length).to_a.each do |j|
      profit = days[j] - days[i] 
      if profit > max_profit
        pair = [i,j]  
        max_profit = profit
      end
    end 
  end 
  pair
end


class TowersOfHanoi
  
  
  attr_reader :name, :board
  def initialize(name, board=[[3,2,1], [], []])
   @name = name 
   @board = board
  end
  
  def won?
    (self.board[0].empty? && self.board[1].empty?) || (self.board[0].empty? && self.board[2].empty?)  
  end
  
  def move(start, finish)
    begin
      valid_move?(start, finish)
      self.board[finish].push(self.board[start].pop)
    rescue InvalidMove
      puts "Invalid move"
    end
  end
  
  def valid_move?(start, finish)
    raise InvalidMove if self.board[start].empty?
    raise InvalidMove if !self.board[finish].empty? && self.board[finish].last < self.board[start].last
  end
    
  
end

class InvalidMove < StandardError;end













