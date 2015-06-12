require './board'
require './player'

class Game

  attr_reader :board, :player_x, :player_o, :winner

  def initialize()
    @board = Board.new
    @player_x = Player.new(:X)
    @player_o = Player.new(:O)
    @winner = nil
  end

  def game_over?
    @board.available_spaces.size == 0
  end

  def check_for_winner

    # This is horrificly ugly and inefficient

    if (@board.spaces.values_at(0, 1, 2).uniq == [:X] ||
        @board.spaces.values_at(3, 4, 5).uniq == [:X] ||
        @board.spaces.values_at(6, 7, 8).uniq == [:X] ||
        @board.spaces.values_at(0, 3, 6).uniq == [:X] ||
        @board.spaces.values_at(1, 4, 7).uniq == [:X] ||
        @board.spaces.values_at(2, 5, 8).uniq == [:X] ||
        @board.spaces.values_at(0, 4, 8).uniq == [:X] ||
        @board.spaces.values_at(2, 4, 6).uniq == [:X])
    
      @winner = @player_x

    elsif (@board.spaces.values_at(0, 1, 2).uniq == [:O] ||
           @board.spaces.values_at(3, 4, 5).uniq == [:O] ||
           @board.spaces.values_at(6, 7, 8).uniq == [:O] ||
           @board.spaces.values_at(0, 3, 6).uniq == [:O] ||
           @board.spaces.values_at(1, 4, 7).uniq == [:O] ||
           @board.spaces.values_at(2, 5, 8).uniq == [:O] ||
           @board.spaces.values_at(0, 4, 8).uniq == [:O] ||
           @board.spaces.values_at(2, 4, 6).uniq == [:O])

    @winner = @player_o

    end


  end


end