require 'byebug'
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over =false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    
    unless game_over
      round_success_message
      @sequence_length+=1
    end
  end

  def show_sequence
    add_random_color
    puts
    print "The sequence is #{@seq}"
    puts
    sleep 1
    system("clear")
  end

  def require_sequence
    print "#{COLORS} \n"
    puts "Enter sequence, seperated by columns"
    input = gets.chomp
    input.include?(",") ? sequence_input = input.delete(" ").split(",") : sequence_input = [input.delete(" ")]
    sequence_input.each do |color|
      valid_input?(color)
    end
    @game_over = true if !round_success?(sequence_input)
  rescue
    puts "This input failed!"
    retry
  end

  def valid_input?(input)
    raise "Not valid input! Try again" unless COLORS.include?(input)
    true
  end



  def add_random_color
    @seq << COLORS[rand(4)]
  end

  def round_success?(input)
    input == @seq
  end 
  
  def round_success_message
    puts "Great job bruh, totes keep it going!"
  end

  def game_over_message
    puts "Hey you freakin lost, try again"
  end

  def reset_game
    @game_over = false
    @sequence_length = 1
    @seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new()
  game.play
end
