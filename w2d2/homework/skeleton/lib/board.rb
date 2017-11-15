class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = place_stones
  end

  def place_stones
    cups = Array.new(14) {Array.new}
    cups.each_with_index do |cup, idx|
      next if idx == 6 || idx == 13
      4.times { cup << :stone}
    end
    cups
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(1,12)
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos].dup
    @cups[start_pos] = []
    stones.each_with_index do |stone, idx|
      next if current_player_name == @name1 && start_pos+idx+1 == 13
      next if current_player_name == @name2 && start_pos+idx+1 == 6
      start_pos = -1 if start_pos+idx
      @cups[start_pos+idx+1] << :stone
    end
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
