require_relative 'player'
require 'byebug'
class Board

  attr_accessor :cups

  def initialize(name1, name2)
    @cups = place_stones
    @player1 = Player.new(name1, 1)
    @player2 = Player.new(name2, 2)
  end


  def place_stones
    arr = Array.new(14) {Array.new(4) {:stone}}
    arr[6] = []
    arr[13] = []
    arr
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(1,14)
    raise "Invalid starting cup" unless start_pos != 13
    raise "Invalid starting cup" unless start_pos != 6
  end

  def make_move(start_pos, current_player_name)
    current_player = get_player(current_player_name)
    stones = @cups[start_pos].dup
    @cups[start_pos] = []

    while stones.length > 0
      current_idx = start_pos + 1
      next if current_player.side == 1 && current_idx == 6
      next if current_player.side == 2 && current_idx == 13
      @cups[current_idx] << stones.pop
    end


  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
  end

  def get_player(name)
    return @player1 if name == @player1.name
    return @player2 if name == @player2.name
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
