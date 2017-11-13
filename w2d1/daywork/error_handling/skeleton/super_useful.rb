require 'byebug'
# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError => e
    nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

class CoffeeError < StandardError; end

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit.downcase == "coffee"
    raise CoffeeError.new("I really like coffee, give me more fruit")
  else
    raise StandardError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  begin
  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp

  reaction(maybe_fruit)
  rescue CoffeeError => e
    puts e.message
    retry
  end
end

class YearError < StandardError; end
class NameError < StandardError; end
class PastimeError < StandardError; end
# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    begin
      @yrs_known = yrs_known
      @name = name
      @fav_pastime = fav_pastime
      #debugger
      raise YearError if @yrs_known < 5
      raise NameError.new("You have not entered a name!") if @name.empty?
      raise PastimeError.new("You have not entered a pastime!") if @fav_pastime.empty?
    rescue YearError => e
      puts "You have not known each other for 5 year.\n
      Please tell me how long we've known each other:"
      yrs_known = gets.chomp.to_i
      retry
    end
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
