require './deck'
require './hand'

class Game
  attr_reader :deck, :winner, :dealer_hand, :player_hand, :active_player

  def initialize
    @deck = Deck.new
    @winner = nil
    @dealer_hand = Hand.new(@deck.draw, @deck.draw)
    @player_hand = Hand.new(@deck.draw, @deck.draw)
    @active_player = "Player"
  end

  def hit!
    @player_hand.hit(@deck.draw)
    print_hands
    @active_player = "Dealer"
  end

  def stay
    @active_player = "Dealer"
  end

  def start
    puts "Welcome to Blackjack!"
    print_hands
  end

  def print_hands
    puts "Dealer Hand: " + @dealer_hand.to_s + " (value #{@dealer_hand.value})"
    puts "Your Hand: " + @player_hand.to_s + " (value #{@player_hand.value})"
  end

  def check_for_winner(player_hand, dealer_hand)
    if(dealer_hand.value < 21)
      @winner = "Player" if (player_hand.value > dealer_hand.value) || (player_hand.value == 21)
    elsif(dealer_hand.value > 21)
      @winner = "Player"
    elsif(dealer_hand.value == 21)
      if player_hand.value == 21
        @winner = "Tie"
      else
        @winner = "Dealer"
      end
    else
      @winner = "Dealer"
    end
    @winner
  end
end
