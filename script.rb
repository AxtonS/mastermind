# frozen_string_literal: true

# variables to be used by both computer and player
module InitialVariables
  def initialize
    @colors = %w[red orange yellow green blue violet]
    @code = []
  end
end

# methods to make the hidden code
class CodeMaker
  include InitialVariables
  attr_reader :code

  def random_code
    4.times { @code.push(@colors.sample) }
  end
end

# methods to input code guesses
class CodeBreaker
  include InitialVariables
  attr_reader :code

  def input
    4.times do
      color = gets.chomp.downcase
      unless @colors.include?(color)
        puts 'Please enter a valid color:'
        color = gets.chomp.downcase
      end
      @code.push(color)
    end
  end
end

secret = CodeMaker.new
secret.random_code
p secret.code
puts 'Welcome to Mastermind!'
puts 'The computer has generated a random code 4 items long, each item can be one of:'
puts 'RED, ORANGE, YELLOW, GREEN, BLUE, or VIOLET'
puts "\nYou have 12 guesses to figure out the code,"
puts 'Between each guess the computer will tell you how many items are the right color and in the right place,'
puts 'as well as how many are simply the right color but in the wrong place'
puts "\nPlease enter your guess one color at a time, pressing enter between each color:"
player = CodeBreaker.new
player.input
p player.code
