require 'set'
require './board'
require './player'

WINNING_TRIPLES = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                   [0, 3, 6], [1, 4, 7], [2, 5, 8],
                   [0, 4, 8], [2, 4, 6]]

class Game
  attr_reader :board, :player_x, :player_o, :winner

  def initialize
    @board = Board.new
    @player_x = Player.new(:X)
    @player_o = Player.new(:O, true) # Player O is computer
    @winner = nil
    @current_player = nil
  end

  def start_game
    puts "\nWelcome to tic-tac-toe. You are player X."
    check_for_human_opponent
    choose_first_player
    keep_playing = true
    while keep_playing
      @current_player.take_turn(@board)
      keep_playing = false if game_over?
      switch_players
    end 
    print_result
  end

  def switch_players
    if @current_player == @player_x
      @current_player = @player_o
    else
      @current_player = @player_x
    end
  end

  def check_for_human_opponent
    print "\nIs there another human player? [Y/N]: "
    ans = gets.chomp
    @player_o = Player.new(:O) if ["Y", "y"].include?(ans)
  end

  def choose_first_player
    if rand(2) == 0
      @current_player = @player_o
    else
      @current_player = @player_x
    end
    puts "Player #{@current_player.symbol} goes first."
  end

  def game_over?
    check_for_winner
    (@board.num_available_spaces == 0) || (!@winner.nil?)
  end

  def check_for_winner
    x_set = @player_x.spaces.to_set
    o_set = @player_o.spaces.to_set

    WINNING_TRIPLES.each do |triple|
      @winner = @player_x if x_set.superset?(triple.to_set)
      @winner = @player_o if o_set.superset?(triple.to_set)
    end
  end

  def print_result
    @board.build_grid
    puts 'Game is over.'
    if @winner
      puts "Winner is player #{@winner.symbol}."
    else
      puts 'Tie.'
    end
  end
end
