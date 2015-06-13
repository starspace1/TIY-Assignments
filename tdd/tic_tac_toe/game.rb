require './board'
require './player'

class Game

  attr_reader :board, :player_x, :player_o, :winner

  WINNING_TRIPLES = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def initialize()
    @board = Board.new
    @player_x = Player.new(:X)
    @player_o = Player.new(:O)
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

  def build_grid

    print "\n\n"

    (0..8).each do |i|

      if @board.spaces[i] # space is occupied with X or O
        print @board.spaces[i]
      else # space i is nil, just print the space #
        print i
      end

      # Add some formatting to make the grid
      if ![2, 5, 8].include? i
        print " | "
      end

      if [2, 5].include? i
        print "\n----------\n"
      end

    end

    print "\n\n\n"

  end #def build_grid

  def start_game

    puts "Welcome to tic-tac-toe. You are player x."

    self.choose_first_player

    while !self.game_over?

      if @current_player == @player_x #your turn

        self.build_grid
        print "Please choose an available space [0-8]: "
        desired_space = gets.chomp.to_i
        @player_x.place_mark(desired_space, @board)
        @current_player = @player_o
      
      else #computer's turn

        @player_o.place_mark(0, @board)
        @current_player = @player_x

      end

    end

    self.build_grid

    puts "Game is over."
    
    if @winner
       puts "Winner is player #{@winner.symbol}."
    else
      puts "Tie."
    end


  end #def start_game

  def choose_first_player

    if rand(2) == 0
      @current_player == @player_o
      puts "The computer plays first."
    else
      @current_player = @player_x
      puts "You play first."
    end

  end #def choose_first_player

end #class Game

@game = Game.new

@game.start_game