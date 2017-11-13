require_relative "pieces"

class Board

  attr_reader :grid

  PIECE_HASH = {
    P: Pawn.new(true),
    N: Knight.new(true),
    R: Rook.new(true),
    B: Bishop.new(true),
    Q: Queen.new(true),
    K: King.new(true),
    O: NullPiece.new(true),
    p: Pawn.new(false),
    n: Knight.new(false),
    r: Rook.new(false),
    b: Bishop.new(false),
    q: Queen.new(false),
    k: King.new(false),
    o: NullPiece.new(false)
  }

  def initialize(board_file = 'boards/default.txt')
    @grid = parse_board_file(board_file)
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def parse_board_file(board_file)
    txt_board = File.readlines(board_file).map(&:chomp)
    parsed_board = txt_board.map do |row|
      row.chars.map do |col|
        PIECE_HASH[col.to_sym]
      end
    end
    parsed_board
  end

  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    begin
      piece.valid_move?(start_pos, end_pos)
    rescue InvalidMoveError #**define in pieces
      retry
    end
    capture_piece(self[end_pos])
    self[start_pos] = NullPiece.new()
    self[end_pos] = piece
  end

  def capture_piece(piece) #TODO make logic, determine if white or black, put in corresponding array, if nil, do nothing
    puts 'undefined'
  end

end
