class Card
 COLORS = [:red, :black]
  attr_reader :color, :type, :value
  
  def initialize(type, value)
    @color = get_color(type)
    @type = type
    @value = value 
  end 
  
  private
  def get_color(type)
    if type == :spades || type == :clubs
      color = COLORS[1]
    else
      color = COLORS[0]
    end
  end 
    
end 