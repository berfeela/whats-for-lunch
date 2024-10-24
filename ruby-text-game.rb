# app>controllers
# app>views>(app_name)
# app>assets>javascripts

# 🌟 Ruby Text Adventure Game 🌟

class AdventureGame
  attr_accessor :player_name

  def initialize
    @player_name = ""
  end

  def start
    introduction
    choose_path
  end

  private

  def introduction
    puts "✨ Welcome, brave adventurer! ✨"
    print "What is your name, hero? "
    @player_name = gets.chomp.capitalize
    puts "\nHello, #{@player_name}! Your journey begins in a dark forest..."
  end

  def choose_path
    puts "\nYou see two paths ahead:"
    puts "1. A narrow, eerie path disappearing into the fog."
    puts "2. A bright, inviting path lined with flowers."
    print "\nWhich path will you choose (1 or 2)? "
    path = gets.chomp.to_i

    case path
    when 1
      foggy_path
    when 2
      flower_path
    else
      puts "\nThat’s not a valid choice, #{@player_name}. Choose again!"
      choose_path
    end
  end

  def foggy_path
    puts "\nYou step into the fog, and suddenly... a wild beast appears!"
    puts "You draw your sword and fight valiantly, but alas, the beast overpowers you."
    game_over
  end

  def flower_path
    puts "\nYou walk along the flower path, feeling the warmth of the sun on your face."
    puts "Ahead, you see a beautiful castle and a wise old sage invites you in for a feast."
    victory
  end

  def game_over
    puts "\n💀 Game Over, #{@player_name}! You fought bravely."
  end

  def victory
    puts "\n🎉 Victory, #{@player_name}! You have found peace and prosperity!"
  end
end

# 🌟 Start the Adventure 🌟
game = AdventureGame.new
game.start
