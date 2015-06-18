require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './hand'

class HandTest < MiniTest::Test
  def setup
    @hand = Hand.new(Card.new(3, "Hearts"), Card.new(:A, "Spades"))
  end
  
  def test_hand_exists
    assert Hand
  end

  def test_hand_has_cards
    assert @hand.cards
    assert_equal Card, @hand.cards[0].class
  end

  def test_hand_starts_with_two_cards
    assert_equal 2, @hand.cards.size
  end

  def test_hand_has_a_value
    assert @hand.value
  end

  def test_hand_value_is_12_when_ace_and_ace
    hand = Hand.new(Card.new(:A, "Spades"), Card.new(:A, "Clubs"))
    assert_equal 12, hand.value
  end

  def test_hand_value_is_15_when_5_and_jack
    hand = Hand.new(Card.new(5, "Diamonds"), Card.new(:J, "Hearts"))
    assert_equal 15, hand.value
  end

  def test_hand_value_is_16_when_5_and_ace
    hand = Hand.new(Card.new(5, "Diamonds"), Card.new(:A, "Hearts"))
    assert_equal 16, hand.value
  end

  def test_hand_can_hit
    assert @hand.hit(Card.new(4,"Spades"))
  end

  def test_card_is_added_when_hand_hits
    previous_size = @hand.cards.size
    new_card = Card.new(:K, "Diamonds")
    @hand.hit(new_card)
    assert_equal previous_size + 1, @hand.cards.size
    assert @hand.contains? new_card
  end

  def test_hand_value_is_14_when_5_8_and_ace
    hand = Hand.new(Card.new(5, "Diamonds"), Card.new(8, "Spades"))
    hand.hit(Card.new(:A, "Clubs"))
    assert_equal 14, hand.value   
  end

  def test_hand_value_is_17_when_5_and_two_aces
    hand = Hand.new(Card.new(5, "Diamonds"), Card.new(:A, "Spades"))
    hand.hit(Card.new(:A, "Clubs"))
    assert_equal 17, hand.value 
  end
end