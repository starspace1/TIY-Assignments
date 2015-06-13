require './board'
require './player'

class Game

  attr_reader :board, :player_x, :player_o, :winner

  WINNING_TRIPLES = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def initialize()
    @board = Board.new
    @player_x = Player.new(:X)
    @player_o = Player.new(:O, true) # Player O is computer
    @winner = nil
    @current_player = nil
  end #def initialize()

  def game_over?
    self.check_for_winner
    @board.available_spaces.size == 0 || @winner != nil
  end #def game_over?

  def check_for_winner

    @winner = @player_x if WINNING_TRIPLES.include? @player_x.spaces.sort
    @winner = @player_o if WINNING_TRIPLES.include? @player_o.spaces.sort

  end #def check_for_winner

  def start_game

    puts "Welcome to tic-tac-toe. You are player X."

    self.choose_first_player

    while !self.game_over?

      if @current_player == @player_x #your turn

        @board.build_grid
        
        success = false

        while !success

          print "Please choose an available space [0-8]: "

          # Save the space the player wants to occupy
          selected_space = gets.chomp.to_i

          # Make sure that the space is available and valid
          if @player_x.place_mark(selected_space, @board)
            success = true
          else
            puts "You have selected an invalid space."
          end

        end

        @current_player = @player_o
      
      else #computer's turn

        puts "\nPlayer O's turn."
        selected_space = self.random_available_space
        @player_o.place_mark(selected_space, @board)
        puts "Player O selected space #{selected_space}."
        @current_player = @player_x

      end

    end

    @board.build_grid

    puts "Game is over."
    
    if @winner
       puts "Winner is player #{@winner.symbol}."
    else
      puts "Tie."
    end


  end #def start_game

  def choose_first_player

    if rand(2) == 0
      @current_player = @player_o
    else
      @current_player = @player_x
    end

    puts "Player #{@current_player.symbol} goes first."

  end #def choose_first_player

  def random_available_space

    found_space = false

    while !found_space

      # Get a random number between 0 and 8
      space = rand(9)

      #Check the board to see if this space is available
      found_space = @board.space_available? space

    end

    space

  end #def random_available_space

end #class Game
