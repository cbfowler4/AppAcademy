require_relative 'move_rules.rb'

module Stepping
  include MoveRules
  KNIGHT_MOVES = [
    [-2, 1],
    [-2, -1],
    [2, -1],
    [2, 1],
    [1, -2],
    [1, 2],
    [-1, -2],
    [-1, 2]
  ]

  KING_MOVES = [
    [1, 1],
    [1, 0],
    [0, 1],
    [-1, 1],
    [-1, 0],
    [-1, -1],
    [0, -1],
    [1, -1],
  ]

  PAWN_MOVES = [
    [1,0],
    [1,-1],
    [1,1],
    [2,0],
    [-1,0],
    [-1,-1],
    [-1,1],
    [-2,0]
  ]

  def get_steps(start_pos, shifts)
    positions = shifts.map {|shift| add_shift(start_pos, shift)}
    positions.select { |pos| in_bounds?(pos)}
  end

  def knight_moves(start_pos)
    get_steps(start_pos, KNIGHT_MOVES)
  end

  def king_moves(start_pos)
    get_steps(start_pos, KING_MOVES)
  end

  def pawn_moves(start_pos)
    get_steps(start_pos, PAWN_MOVES)
  end

end
