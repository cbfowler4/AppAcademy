require_relative 'move_rules.rb'

module Sliding
  include MoveRules

  DIAGNOL_MOVES = [
    [-1, -1],
    [-1, 1],
    [1, -1],
    [1, 1]
  ]

  LINEAR_MOVES = [
    [-1, 0],
    [1, 0],
    [0, -1],
    [0, 1]
  ]

  def get_slides(start_pos, shifts)
    moves = []

    shifts.each do |shift|
      vector = []
      next_pos = add_shift(start_pos, shift)
      while in_bounds?(next_pos)
        vector << next_pos
        next_pos = add_shift(next_pos, shift)
      end
      moves << vector
    end
    moves
  end

  def bishop_moves(start_pos)
    get_slides(start_pos, DIAGNOL_MOVES)
  end

  def rook_moves(start_pos)
    get_slides(start_pos, LINEAR_MOVES)
  end

  def queen_moves(start_pos)
    bishop_moves(start_pos) + rook_moves(start_pos)
  end

end





class Test
  include Sliding
end
