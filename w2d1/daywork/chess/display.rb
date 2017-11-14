require 'colorize'
require_relative 'helper/cursor.rb'
require_relative 'board.rb'
require 'byebug'


class Display
  attr_reader :cursor
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
    system('clear')
    puts "    " + ('a'..'h').to_a.join('   ')
    @board.grid.each_with_index do |row, idx|
      puts "#{idx + 1} | #{render_row(row, idx)}"
    end
  end

  def render_row(row, row_idx)
    str = ""
    row.each_with_index do |piece, col_idx|
      str<< "#{colorize_space(piece, row_idx, col_idx)} | "
    end
    str
  end

  def colorize_space(piece, row_idx, col_idx)
    color = piece.color == :black ? :blue : :red
    background = nil
    background = :light_blue if [row_idx, col_idx] == @cursor.cursor_pos
    piece.icon.to_s.colorize(:color => color, :background => background)
  end

  def get_cursor_input
    loop do
      previous_position = @cursor.cursor_pos
      begin
        @cursor.get_input
        self.render
      rescue BoundsError
        puts "Out of bounds error!"
        retry
      end
      return @cursor.cursor_pos if previous_position == @cursor.cursor_pos
    end
  end

  def get_move
    puts "Please select a start position"
    start_pos = get_cursor_input
    puts "Please select an end position"
    end_pos = get_cursor_input

    move = [start_pos,end_pos]
  end

end
