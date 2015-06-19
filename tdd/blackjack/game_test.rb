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

  def test_game_has_deck_of_cards
    assert @game.deck
    assert_equal Deck, @game.deck.class
  end

  def test_game_has_no_winner_at_start
    refute @game.winner
  end

  def test_game_has_dealer_hand
    assert @game.dealer_hand
    assert_equal Hand, @game.dealer_hand.class
  end

  def test_game_has_player_hand
    assert @game.player_hand
    assert_equal Hand, @game.player_hand.class
  end
end
