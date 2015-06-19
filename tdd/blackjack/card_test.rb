require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './card'

class CardTest < MiniTest::Test
  def setup
    @card = Card.new(5, "Spades")
  end
  
  def test_card_exists
    assert Card
  end

  def test_card_has_value
    assert @card.value
  end

  def test_card_has_suit
    assert @card.suit
  end

  def test_card_can_be_initialized_with_value_and_suit
    card = Card.new(3, "Hearts")
    assert_equal 3, card.value
    assert_equal "Hearts", card.suit
  end

  def test_2_of_spades_has_value_2
    card = Card.new(2, "Spades")
    assert_equal 2, card.value
  end

  def test_king_of_hearts_has_value_10
    card = Card.new(:K, "Hearts")
    assert_equal 10, card.value
  end

  def test_printing_card_name
    assert_equal "5 of Spades", @card.to_s
  end
end
