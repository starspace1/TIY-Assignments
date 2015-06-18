require './card'

class Hand
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
    return val if num_aces == 0
    # If there's an ace, it's worth 10
    # Unless that will make you bust, then it's worth 1 
    if num_aces >= 1
      val += 10 unless val + 10 > 21
    end
    val
  end
end
