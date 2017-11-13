require_relative 'display'

class Game

  attr_reader :board, :display

  def initialize(board_file = 'boards/default.txt')
    @board = Board.new(board_file)
    @display = Display.new(@board)
  end

  def take_turn
    display.render
    start_pos, end_pos = display.get_move
    board.move_piece(start_pos, end_pos)
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  while true
    game.take_turn
  end
end
