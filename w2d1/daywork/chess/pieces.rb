require 'byebug'
require_relative 'helper/sliding'
require_relative 'helper/stepping'
require 'singleton'


class InvalidMoveError < StandardError; end

class Piece
  attr_reader :icon, :color

  def initialize(color)
    @color = color
  end

end


### PIECE CATEGORIES ###
class SlidingPiece < Piece
  include Sliding

  def initialize(color)
    super
  end

  def select_vector(vectors, end_pos)
    full_path = vectors.select {|vector| vector.include?(end_pos)}.first
    path = []
    until path.last == end_pos
      path << full_path.shift
    end
    path
  end

  def get_moves(start_pos, end_pos, vectors)
    raise InvalidMoveError.new("End position not a valid destination") if vectors.none? {|vector| vector.include?(end_pos)}
    select_vector(vectors, end_pos)
  end

end

class SteppingPiece < Piece
  include Stepping

  def initialize(color)
    super
  end

  def get_moves(start_pos, end_pos, moves)
   raise InvalidMoveError.new("End position not a valid destination") if !moves.include?(end_pos)
   [end_pos]
  end

end

class Pawn < Piece
  include Stepping

  def initialize(color)
    @icon = :P
    @has_moved = false
    super
  end

  def get_moves(start_pos, end_pos)
    moves = pawn_moves(start_pos)

    moves = pawn_color_moves(start_pos, moves)

    moves.pop if @has_moved
    raise InvalidMoveError.new("End position not a valid destination") if !moves.include?(end_pos)
    @has_moved = true
    [end_pos]
  end

  def pawn_color_moves(start_pos, moves)
    if @color == :white
      return moves.select {|move| start_pos[0]-move[0] < 0}
    else
      return moves.select {|move| start_pos[0]-move[0] > 0}
    end
  end
end

class NullPiece
  include Singleton
  attr_reader :icon, :color


  def initialize
    @color = nil
    @icon = ' '
  end
end


 ### STEPPING ####
class Knight < SteppingPiece
  def initialize(color)
    @icon = :N
    super
  end

  def get_moves(start_pos, end_pos)
    moves = knight_moves(start_pos)
    super(start_pos, end_pos, moves)
  end

end

 class King < SteppingPiece
   def initialize(color)
     @icon = :K
     super
   end

   def get_moves(start_pos, end_pos)
    moves = king_moves(start_pos)
    super(start_pos, end_pos, moves)
   end

 end


 ### SLIDING ####
class Bishop < SlidingPiece
  def initialize(color)
    @icon = :B
    super
  end

  def get_moves(start_pos, end_pos)
    vectors = bishop_moves(start_pos)
    super(start_pos, end_pos, vectors)
  end

end

class Queen < SlidingPiece
  def initialize(color)
    @icon = :Q
    super
  end

  def get_moves(start_pos, end_pos)
    vectors = queen_moves(start_pos)
    super(start_pos, end_pos, vectors)
  end

end

class Rook < SlidingPiece
  def initialize(color)
    @icon = :R
    super
  end

  def get_moves(start_pos, end_pos)
    vectors = rook_moves(start_pos)
    super(start_pos, end_pos, vectors)
  end

end
