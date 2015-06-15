require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './board'

class BoardTest < MiniTest::Test
  def setup
    @board = Board.new
  end

  def test_board_exists
    assert Board
  end

  def test_can_get_array_of_spaces
    assert @board.spaces.is_a?(Array)
  end

  def test_board_starts_with_9_available_spaces
    assert_equal 9, @board.num_available_spaces
  end

  def test_can_place_mark_on_board
    assert @board.place_mark(0, :X)
  end

  def test_cannot_place_mark_on_occupied_space
    @board.place_mark(0, :X)
    refute @board.place_mark(0, :O)
  end

  def test_cannot_place_mark_on_space_10
    refute @board.place_mark(10, :X)
  end

  def test_cannot_place_mark_on_space_negative_one
    refute @board.place_mark(-1, :X)
  end

  def test_placing_x_on_0_occupies_0_with_x
    @board.place_mark(0, :X)
    assert_equal :X, @board.spaces[0]
  end

  def test_placing_o_on_3_occupies_3_with_o
    @board.place_mark(3, :O)
    assert_equal :O, @board.spaces[3]
  end

  def test_can_get_spaces_occupied_by_x
    @board.place_mark(0, :X)
    @board.place_mark(2, :X)
    @board.place_mark(1, :X)
    assert_equal [0, 1, 2], @board.spaces_occupied_by(:X)
  end
end
