class Piece
  attr_reader :icon, :white
  def initialize(white)
    @white = white
  end

  def valid_move?(start_pos, end_pos)
    true
  end
end

 ### STEPPING ####
 class Knight < Piece
   def initialize(white)
     @icon = :N
     super
   end
 end

 class King < Piece
   def initialize(white)
     @icon = :K
     super
   end
 end


 ### SLIDDING ####
class Bishop < Piece
  def initialize(white)
    @icon = :B
    super
  end
end

class Queen < Piece
  def initialize(white)
    @icon = :Q
    super
  end
end

class Rook < Piece
  def initialize(white)
    @icon = :R
    super
  end
end


### PAWN ###
class Pawn < Piece
  def initialize(white)
    @icon = :P
    super
  end
end


### NULL PIECE ###
class NullPiece < Piece
  def initialize(white=nil)
    @white = nil
    @icon = ' '
  end
end
