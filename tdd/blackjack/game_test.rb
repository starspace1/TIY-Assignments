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

  def test_game_player_can_hit
    assert @game.hit!
  end

  def test_game_dealer_win
    player_hand = Hand.new(Card.new(7, "Diamonds"), Card.new(:A, "Hearts"))
    dealer_hand = Hand.new(Card.new(6, "Hearts"), Card.new(4, "Diamonds"))
    dealer_hand.hit(Card.new(:A, "Diamonds"))
    assert_equal "Dealer", @game.check_for_winner(player_hand, dealer_hand)
  end

  def test_game_player_win
    player_hand = Hand.new(Card.new(6, "Diamonds"), Card.new(5, "Hearts"))
    dealer_hand = Hand.new(Card.new(3, "Clubs"), Card.new(5, "Clubs"))
    player_hand.hit(Card.new(:Q, "Spades"))
    dealer_hand.hit(Card.new(:J, "Diamonds"))
    assert_equal "Player", @game.check_for_winner(player_hand, dealer_hand)
  end

  def test_game_tie
    player_hand = Hand.new(Card.new(6, "Diamonds"), Card.new(5, "Hearts"))
    dealer_hand = Hand.new(Card.new(6, "Clubs"), Card.new(5, "Clubs"))
    player_hand.hit(Card.new(:Q, "Spades"))
    dealer_hand.hit(Card.new(:J, "Diamonds"))
    assert_equal "Tie", @game.check_for_winner(player_hand, dealer_hand) 
  end

  def test_dealer_hits_if_less_than_17
    dealer_hand = Hand.new(Card.new(6, "Clubs"), Card.new(5, "Clubs"))
    assert @game.dealer_response(dealer_hand)
  end

  def test_dealer_stands_if_17_or_over
    dealer_hand = Hand.new(Card.new(:A, "Clubs"), Card.new(8, "Clubs"))
    refute @game.dealer_response(dealer_hand)
  end
end
