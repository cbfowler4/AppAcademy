require_relative 'card.rb'


class Deck
  
  TYPES = [:hearts, :diamonds, :spades, :clubs]
  VALUES = [:two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king, :ace]


  attr_reader :deck
  
  def initialize()
    @deck = new_shuffled_deck
  end 
  
  def new_shuffled_deck
    deck = []
    
    4.times do |type|
      13.times do |value|
        deck << Card.new(TYPES[type], VALUES[value])
      end
    end

    deck.shuffle!
  end
  
  def draw_card
    @deck.pop
  end
  
end 
