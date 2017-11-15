require "rspec"
require 'card'

describe Card do
  subject(:card) {Card.new(:hearts, :queen)}
  describe '::initialize' do
    it "returns correct value" do
      expect(card.value).to eq(:queen)
    end
    
    it "returns the correct type" do
      expect(card.type).to eq(:hearts)
    end
    
    it "gets the color assigned to the type" do
      expect(card.color).to eq(:red)
      card = Card.new(:spades, :two)
      expect(card.color).to eq(:black)
      card = Card.new(:diamonds, :jack)
      expect(card.color).to eq(:red)
      card = Card.new(:clubs, :king)
      expect(card.color).to eq(:black)
      
    end
  end
end