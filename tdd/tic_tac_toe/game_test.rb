require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './game'

class GameTest < MiniTest::Test

  def setup
    @game = Game.new
  end

  def test_game_exists
    assert Game
  end

  def test_game_has_board
    assert @game.board.is_a?(Board)
  end

  def test_game_has_player_x
    assert @game.player_x.is_a?(Player)
  end

  def test_game_has_player_o
    assert @game.player_o.is_a?(Player)
  end

  def test_game_has_no_winner_at_start
    refute @game.winner
  end

  def test_game_allows_player_x_to_place_mark_on_0
    @game.player_x.place_mark(0, @game.board)
    assert_equal :X, @game.board.spaces[0]
  end

  def test_game_allows_player_o_to_place_mark_on_8
    @game.player_o.place_mark(8, @game.board)
    assert_equal :O, @game.board.spaces[8]
  end

  def test_game_disallows_player_x_to_mark_over_player_o
    @game.player_o.place_mark(3, @game.board)
    @game.player_x.place_mark(3, @game.board)
    assert_equal :O, @game.board.spaces[3]
  end

  def test_player_x_wins_when_occupying_diagonal
    @game.player_x.place_mark(0, @game.board)
    @game.player_x.place_mark(4, @game.board)
    @game.player_x.place_mark(8, @game.board)
    @game.check_for_winner
    assert_equal @game.player_x, @game.winner
  end

  def test_player_o_wins_when_occupying_left_column
    @game.player_o.place_mark(0, @game.board)
    @game.player_o.place_mark(3, @game.board)
    @game.player_o.place_mark(6, @game.board)
    @game.check_for_winner
    assert_equal @game.player_o, @game.winner
  end

end