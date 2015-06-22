require './card'

class Hand
  include Comparable
  
  attr_reader :cards

  def initialize(card_1, card_2)
    @cards = []
    @cards << card_1
    @cards << card_2
  end

  def value
    val = @cards.inject(0) { |sum, c| sum + c.value }
    adjust_for_aces(val)
  end

  def blackjack?
    value == 21
  end

  def bust?
    value > 21
  end

  def num_aces
    @cards.count { |c| c.value == 1}
  end

  def hit(card)
    @cards << card
  end

  def contains?(card)
    @cards.include? card
  end

  def adjust_for_aces(val)
    # If there's an ace, it's worth 10
    # Unless that will make you bust, then it's worth 1 
    if num_aces >= 1
      val += 10 unless val + 10 > 21
    end
    val
  end

  def to_s
    @cards.map { |c| c.to_s }.join(", ")
  end

  def <=>(other_hand)
    value <=> other_hand.value
  end
end
