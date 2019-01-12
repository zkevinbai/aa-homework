class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over 
      take_turn
    end 
    game_over_message
    reset_game
  end

  require "byebug"

  def take_turn
    unless @game_over
      # debugger
      show_sequence 
      response = require_sequence 
      if response == @seq
        round_success_message
        @sequence_length += 1
      else
        @game_over = true
      end 
    end 
  end

  def show_sequence
    add_random_color
    p @seq
  end

  def require_sequence
    p "give me the colors, format: red, blue, green, etc"
    response = gets.chomp
    if sequence_length == 1
      response = [response]
    else
      response = response.split(",")
    end 
    return response
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    "congratulations, you beat round #{@sequence_length}"
  end

  def game_over_message
    p "game over"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

game = Simon.new

game.play