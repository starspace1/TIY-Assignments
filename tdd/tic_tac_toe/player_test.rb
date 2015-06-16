require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './player'
require './board'

class PlayerTest < MiniTest::Test
  def setup
    @player = Player.new(:X)
  end

  def test_player_exists
    assert Player
  end

  def test_player_has_symbol
    assert @player.symbol
  end

  def test_player_defaults_to_human
    refute @player.computer
  end

  def test_player_can_be_initialized_as_computer
    @computer_player = Player.new(:O, true)
    assert @computer_player.computer
  end

  def test_player_can_place_mark_on_board
    @board = Board.new
    @player.place_mark(0, @board)
    assert_equal :X, @board.spaces[0]
  end
end
