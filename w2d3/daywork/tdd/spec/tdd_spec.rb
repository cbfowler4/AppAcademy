require 'tdd'

describe Array do 
  
  describe "#my_uniq" do
    
    it "removes repeated elements" do 
      expect([1,2,1,3,3].my_uniq).to eq([1,2,3])
    end 
    
    it "returns elements in order of appearance" do 
      expect([9,1,2,1,3,3].my_uniq).to eq([9,1,2,3])
    end 
    
    it "if given empty array, returns an empty array" do
      expect([].my_uniq).to be_empty
    end 
    
    it "does not alter original array" do
      arr = [9,1,2,1,3,3]
      new_arr = arr.my_uniq
      expect(arr).to eq([9,1,2,1,3,3])
    end 
    
    it "returns a new array" do
      arr = [1,2,3]
      new_arr = arr.my_uniq
      expect(arr).to_not equal(new_arr)
    end 
    
  end 
  
  describe "#two_sum" do
    
    it "returns a new array" do
      arr = [0,0,-1,2,1]
      new_arr = arr.two_sum
      expect(arr).to_not equal(new_arr)
    end 
    
    it "does not modify the original array" do
      arr = [0,0,-1,2,1]
      new_arr = arr.two_sum
      expect(arr).to_not equal([0,0,-1,2,1])
    end
    
    it "returns an array of index pairs who's elements sum to zero" do
      arr = [0,0,-1,2,1]
      new_arr = arr.two_sum 
      expect(new_arr).to eq([[0,1],[2,4]])
    end
    
    it "does not return duplicate pairs" do 
      arr = [0,0,-1,2,1]
      new_arr = arr.two_sum
      expect(new_arr.length).to eq(2)
    end 
  
  end 
  
  describe "#my_transpose" do
    subject(:arr) {[[1,2,3],[4,5,6]]}
    it "returns new array" do
      expect(arr.my_transpose).to_not equal(arr)
    end
    
    it "does not modify the original array" do
      arr.my_transpose
      expect(arr).to eq([[1,2,3],[4,5,6]])  
    end
    
    it "returns the transpose of the array" do
      new_arr = arr.my_transpose
      expect(new_arr).to eq([[1,4],[2,5],[3,6]]) 
    end
    
  end
  
  
end 

describe "Stock Picker" do
  subject(:days) {[7,3,1,2,5,3,2,6]}
  it "returns the most profitable pair of days" do
    expect(stock_picker(days)).to eq([2,7])
  end
  
  it "checks if the sell day is after the buy day" do
    expect(stock_picker(days)).to eq([2,7])
  end
  
  it "returns an array of nil days if there are no profitable trades" do
    arr = [3, 2, 1]
    expect(stock_picker(arr)).to eq([nil,nil])
  end
    
end

describe TowersOfHanoi do
  subject(:toh) {TowersOfHanoi.new("Bryan")}
  
  describe "::initialize" do
    it "initializes with a name" do
      expect(toh.name).to eq("Bryan")
    end
    
    it "initializes board with proper starting array" do
      expect(toh.board).to eq([[3,2,1],[],[]])
    end
  end
  
  describe "#won?" do
    it "recognizes second tower win" do
      toh = TowersOfHanoi.new("Bryan", [[], [3,2,1],[]])
      expect(toh.won?).to be(true)
    end
    
    it "recognizes third tower win" do
      toh = TowersOfHanoi.new("Bryan", [[], [], [3,2,1]])
      expect(toh.won?).to be(true)
    end
    
    it "does not recognize improperly declared win" do
      toh = TowersOfHanoi.new("Bryan", [[1], [2], [3]])
      expect(toh.won?).to be(false)
    end 
  end
  
  describe "#move" do
    it "calls a valid move" do
      toh.move(0,1)
      expect(toh.board).to eq([[3,2], [1], []])
    end
    
    it "does not execute an invalid move" do
      toh = TowersOfHanoi.new("Bryan", [[1], [2], [3]])
      toh.move(2,0)
      expect(toh.board).to eq([[1], [2], [3]])
    end 
    
  end

  
  
end




  
  
  
  
  
  
  
  
  
  
  
  
  