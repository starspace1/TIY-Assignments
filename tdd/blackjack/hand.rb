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
    val += 10 if num_aces >= 1
    val -= 1 if num_aces == 2
    val -= 2 if num_aces == 3
    val
  end

  def num_aces
    @cards.count { |c| c.value == 1}
  end

  def hit(card)
    @cards << card
  end

  def contains? card
    @cards.include? card
  end
end
