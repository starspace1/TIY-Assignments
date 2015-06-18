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
    assert_equal Card, @deck.cards[0].class
  end

  def test_deck_has_52_cards
    assert_equal 52, @deck.cards.size
  end

  def test_can_draw_from_deck
    assert @deck.draw
  end

  def test_card_is_drawn_from_deck
    card = @deck.draw
    assert_equal Card, card.class
  end

  def test_two_consecutive_cards_drawn_are_unique
    card_1 = @deck.draw
    card_2 = @deck.draw
    refute_equal card_1.to_s, card_2.to_s
  end

  def test_drawing_a_card_removes_card_from_deck
    new_deck = Deck.new
    card = new_deck.draw
    refute new_deck.contains? card
    assert_equal 51, new_deck.cards.size
  end
end