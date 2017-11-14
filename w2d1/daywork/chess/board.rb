require_relative "pieces"
require 'byebug'


class Board

  attr_reader :grid

  PIECE_HASH = {
    P: Pawn.new(:black),
    N: Knight.new(:black),
    R: Rook.new(:black),
    B: Bishop.new(:black),
    Q: Queen.new(:black),
    K: King.new(:black),
    O: NullPiece.instance,
    p: Pawn.new(:white),
    n: Knight.new(:white),
    r: Rook.new(:white),
    b: Bishop.new(:white),
    q: Queen.new(:white),
    k: King.new(:white),
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
        col.to_sym == :O ? PIECE_HASH[col.to_sym] : PIECE_HASH[col.to_sym].dup
      end
    end
    parsed_board
  end

  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    raise InvalidMoveError.new("No piece selected") if piece.is_a?(NullPiece)

    path = piece.get_moves(start_pos, end_pos) #all of the squares on the board traversed to get to end pos, including end pos
    valid_move?(start_pos, path)



    capture_piece(self[end_pos])
    self[start_pos] = NullPiece.instance
    self[end_pos] = piece

    puts "Black king in check!" if black_in_check?
  end

  def capture_piece(piece) #TODO make logic, determine if white or black, put in corresponding array, if nil, do nothing
    puts 'undefined'
  end

  def valid_move?(start_pos, path)
    current_piece = self[start_pos]
    raise InvalidMoveError.new("One of your pieces is occupying that position!") if color_eq?(start_pos, path.last)

    if current_piece.is_a?(King)
      raise InvalidMoveError.new("Moving to end position will result in check!") if in_check?(current_piece.color, path.last)
    end

    if current_piece.is_a?(Pawn)
      debugger
      if start_pos[1] == path.last[1] && !self[path.last].is_a?(NullPiece)
        raise InvalidMoveError.new("There is an opposing piece in the way!")
      elsif start_pos[1] != path.last[1] && self[path.last].is_a?(NullPiece)
        raise InvalidMoveError.new("Cannot attack that position!")
      end

    else
      path[0...-1].each do |pos|
        raise InvalidMoveError.new("There are pieces in the way!") unless self[pos].is_a?(NullPiece)
      end
    end
  end

  def color_eq?(start_pos, end_pos)
    self[start_pos].color == self[end_pos].color
  end

  def find_king(color)
    scan_board do |piece, row_idx, col_idx|
      if piece.is_a?(King) && piece.color == color
        [row_idx, col_idx]
      end
    end
  end

  def find_all_pieces(color)
    scan_board do |piece, row_idx, col_idx|
      if piece.color == color
        [row_idx, col_idx]
      end
    end
  end



  def get_all_moves(color, opponent_color)
    #debugger
    start_points = find_all_pieces(color)
    end_points = find_all_pieces(opponent_color) + find_all_pieces(nil)

    moves = []
    start_points.each do |start_pos|
      end_points.each do |end_pos|
        begin
          path = self[start_pos].get_moves(start_pos, end_pos)
          debugger
          valid_move?(start_pos, path)
          moves << end_pos
        rescue
        end
      end
    end

    moves
  end




  def in_check?(color, king_pos = nil)
    king_pos ||= find_king(color)
    opponent_color = color == :black ? :white : :black
    get_all_moves(opponent_color, color)
  end




  def scan_board(&prc)
    result = []
    @grid.each_with_index do |row, row_idx|
      row.each_with_index do |piece, col_idx|
        proc_result = prc.call(piece, row_idx, col_idx)
        next if proc_result.nil?
        result << proc_result
      end
    end
    result
  end


end
