require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './player'

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

end