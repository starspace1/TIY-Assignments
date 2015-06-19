require './deck'
require './hand'

class Game
  attr_reader :deck, :winner, :dealer_hand, :player_hand

  def initialize
    @deck = Deck.new
    @winner = nil
    @dealer_hand = Hand.new(@deck.draw, @deck.draw)
    @player_hand = Hand.new(@deck.draw, @deck.draw)
  end

end