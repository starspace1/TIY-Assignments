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
  end #def initialize()

  def game_over?
    @board.available_spaces.size == 0
  end #def game_over?

  def check_for_winner

    @winner = @player_x if WINNING_TRIPLES.include? @player_x.spaces.sort
    @winner = @player_o if WINNING_TRIPLES.include? @player_o.spaces.sort

  end #def check_for_winner

  def build_grid

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

end #class Game