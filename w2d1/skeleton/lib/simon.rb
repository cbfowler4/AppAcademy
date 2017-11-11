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
      add_random_color
    end
  end

  def show_sequence
    add_random_color
    print @seq
    print '\n'
  end

  def require_sequence
    print "#{COLORS} \n"
    puts "Enter a color:"
    input = gets.chomp
    valid_input?(input)
  rescue

    retry
  end

  def valid_input?(input)
    raise "Not valid input! Try again" unless COLORS.include?(input)
  end



  def add_random_color
    @seq << COLORS[rand(4)]
  end

  def round_success_message
    puts "Great job bruh, totes keep it going!"
  end

  def game_over_message
    puts "Hey you freakin lost, try again you mo freaker"
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
