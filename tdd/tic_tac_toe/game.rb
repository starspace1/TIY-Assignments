require './board'
require './player'

class Game
  attr_reader :board, :player_x, :player_o, :winner

  WINNING_TRIPLES = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                     [0, 3, 6], [1, 4, 7], [2, 5, 8],
                     [0, 4, 8], [2, 4, 6]]

  def initialize
    @board = Board.new
    @player_x = Player.new(:X)
    @player_o = Player.new(:O, true) # Player O is computer
    @winner = nil
    @current_player = nil
  end

  def game_over?
    check_for_winner
    @board.num_available_spaces == 0 || !@winner.nil?
  end

  def check_for_winner
    @winner = @player_x if WINNING_TRIPLES.include? @player_x.spaces.sort
    @winner = @player_o if WINNING_TRIPLES.include? @player_o.spaces.sort
  end

  def start_game
    puts "\nWelcome to tic-tac-toe. You are player X."

    choose_first_player

    until game_over?
      if @current_player == @player_x # your turn
        @board.build_grid
        human_turn
        @current_player = @player_o
      else # computer's turn
        computer_turn
        @current_player = @player_x
      end
    end
    print_result
  end

  def choose_first_player
    if rand(2) == 0
      @current_player = @player_o
    else
      @current_player = @player_x
    end
    puts "Player #{@current_player.symbol} goes first."
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

  def computer_turn
    puts "\nPlayer O's turn."
    selected_space = @board.random_available_space
    @player_o.place_mark(selected_space, @board)
    puts "Player O selected space #{selected_space}."
  end

  def human_turn
    success = false
    until success
      print 'Please choose an available space [0-8]: '

      # Save the space the player wants to occupy
      selected_space = gets.chomp.to_i

      # Make sure that the space is available and valid
      if @player_x.place_mark(selected_space, @board)
        success = true
      else
        puts 'You have selected an invalid space.'
      end
    end
  end
end
