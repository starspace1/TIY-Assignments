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

  def hit!
    success = @player_hand.hit(@deck.draw)
    print_hands
    check_for_winner(@player_hand, @dealer_hand)
    success
  end

  def stay
    dealer_response(@dealer_hand)
  end

  def dealer_response(dealer_hand)
    dealer_hit = @dealer_hand.hit(@deck.draw) if dealer_hand.value < 17
    if dealer_hit
      puts "Dealer hits."
      print_hands
    else
      puts "Dealer stays."
    end
    check_for_winner(@player_hand, @dealer_hand)
    dealer_hit
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
    check_for_blackjack(player_hand, dealer_hand)
    check_for_bust(player_hand, dealer_hand)
    compare_hands(player_hand, dealer_hand)
    @winner
  end

  def check_for_bust(player_hand, dealer_hand)
    if player_hand.bust?
      @winner = "Dealer"
      puts "You bust. Dealer wins."
    end
    if dealer_hand.bust?
      @winner = "You"
      puts "Dealer busts. You win!"
    end
  end

  def check_for_blackjack(player_hand, dealer_hand)
    if player_hand.blackjack?
      if !dealer_hand.blackjack?
        @winner = "Player"
        puts "Blackjack! Player wins." 
      elsif dealer_hand.blackjack?
        @winner = "Tie"
        puts "Push! No winner."
      end
    end
  end

  def compare_hands(player_hand, dealer_hand)
    if player_hand.value < 21
      if (dealer_hand > player_hand) && (!dealer_hand.bust?)
        @winner = "Dealer"
        puts "Game over. Dealer wins."
      elsif (dealer_hand < player_hand) && (!dealer_hand.bust?)
        @winner = "You"
        puts "Game over. You win."
      end
    end
  end
end
