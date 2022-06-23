# frozen_string_literal: true

# input controls
module Input
  def initialize
    @colors = %w[red orange yellow green blue violet]
    @code = []
  end

  def input
    @code = []
    4.times do
      color = gets.chomp.downcase
      until @colors.include?(color)
        puts 'Please enter a valid color:'
        color = gets.chomp.downcase
      end
      @code.push(color)
    end
  end

  def random
    @code = []
    4.times { @code.push(@colors.sample) }
  end
end

# methods to make the hidden code
class CodeMaker
  include Input
  attr_reader :code

  def compare(guess)
    full_key = 0
    color_key = ((@code - guess).length - 4).abs
    @code.each_with_index do |color, index|
      if guess[index] == color
        full_key += 1
        color_key -= 1
      end
    end
    return true if full_key == 4

    puts "\n#{full_key} are perfect matches, #{color_key} other colors match but are in the wrong position."
  end
end

# methods to input code guesses
class CodeBreaker
  include Input
  attr_reader :code
end

def human_player
  secret = CodeMaker.new
  secret.random
  player = CodeBreaker.new
  x = 12
  while x.positive?
    x -= 1
    puts "\nPlease enter your guess one color at a time, pressing enter between each color:"
    player.input
    if secret.compare(player.code) == true
      puts "\nCongratulations, you've cracked the code! ^_^"
      return
    end
    if x.zero?
      puts "\nThis challenge has come to a close and you have failed dear sweet player Q_Q"
      return
    end
    puts "\nYou have #{x} attempts left."
  end
end

def computer_player
  secret = CodeMaker.new
  puts "\nPlease enter your code one color at a time, pressing enter between each color:"
  secret.input
  computer = CodeBreaker.new
  x = 12
  while x.positive?
    x -= 1
    computer.random
    puts "\nComputer guesses #{computer.code}"
    if secret.compare(computer.code) == true
      puts "\nComputer guessed it, you lose! >_<"
      return
    end
    if x.zero?
      puts "\nComputer failed to guess in time, victory is yours! ^_^"
      return
    end
    puts "\nComputer has #{x} attempts left."
  end
end

puts 'Welcome to Mastermind!'
puts "\n You will have 12 guesses to figure out the secret code comprised of 4 colors,"
puts 'the colors can be RED, ORANGE, YELLOW, GREEN, BLUE, or VIOLET and duplicates are allowed.'
puts "\nYou will have 12 guesses to figure out the code,"
puts 'between each guess the computer will tell you how many items are the right color and in the right place,'
puts 'as well as if the code includes a color you picked but in a different position in the secret code.'

puts "\nPlease type 'COMPUTER' if you want the computer to generate a secret code,"
puts "or type 'PLAYER' if you wish to enter a code yourself for a friend to play against."
loop do
  choice = gets.chomp.downcase
  case choice
  when 'computer'
    puts 'The computer has generated a random code'
    human_player
    return
  when 'player'
    computer_player
    return
  else
    puts "ERROR, please type out 'COMPUTER' or 'PLAYER"
  end
end
