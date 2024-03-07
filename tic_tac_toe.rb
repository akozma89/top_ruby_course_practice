# frozen_string_literal: true

# This class represents the top level class of all games
class Game
  attr_accessor :players
  attr_reader :winner

  def initialize(number_of_players)
    self.players = Array.new(number_of_players)
    @winner = nil
    create_players
  end

  def create_players
    players.map!.with_index do |_, index|
      print "Name of Player #{index + 1}:"
      name = gets.chomp
      print "Sign of #{name}:"
      sign = gets.chomp
      Player.new(sign, name)
    end
  end

  def game_over
    !@winner.nil?
  end

  def winner_player(player)
    @winner = player
    stop_game
  end

  def stop_game
    puts "Game over, #{@winner.name} won!"
  end
end

# This class represents the Tic Tac Toe game
class TicTacToe < Game
  def initialize
    super(2)
    @current_player = nil
    initialize_fields
  end

  def initialize_fields
    @fields = Array.new(9) { Field.new }
    puts @fields
  end

  def draw_fields
    @fields.each_slice(3) do |row|
      puts row.map(&:value).join(" | ").center(10)
      puts "----------"
    end
  end

  def start_game
    puts "Let's start a Tic Tac Toe!"
    set_next_player
    make_turn
  end

  def set_next_player
    @current_player = players.find { |player| player != @current_player }
  end

  def make_turn
    until game_over
      draw_fields
      print "It's your turn #{@current_player.name}:"
      field_value @current_player.ask_step
      set_next_player
    end
  end

  def field_value(step)
    step_selector = ((step[0] - 1) * 3) + (step[1] - 1)
    @fields[step_selector].value = @current_player.sign
    puts @fields.flatten.flatten.map(&:value).join
  end
end

# This class represents a Player
class Player
  attr_accessor :name
  attr_reader :sign

  def initialize(sign = 'x', name = 'Player')
    @sign = sign
    @name = name
    @steps = []
  end

  def ask_step
    make_step gets.chomp.split('')
  end

  def make_step(selector)
    selectors = selector.map(&:to_i)
    @steps << selectors
    selectors
  end
end

# This class represents a Field on the board
class Field
  attr_accessor :value

  def initialize
    self.value = 0
  end

  def check_if_empty
    value != 0
  end
end

TicTacToe.new.start_game
