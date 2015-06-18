require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './deck'

class DeckTest < MiniTest::Test
  def setup
    @deck = Deck.new
  end
  
  def test_deck_exists
    assert Deck
  end

  def test_deck_has_cards
    assert @deck.cards
  end

  def test_deck_has_52_cards
    assert_equal 52, @deck.cards.size
  end
end