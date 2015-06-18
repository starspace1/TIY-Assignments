require './card'

class Deck
  attr_reader :cards

  def initialize
    @cards = []
    values = [:A, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K]
    suits = %w{Spades Hearts Diamonds Clubs}
    suits.each do |suit|
      values.each do |value|
        @cards << Card.new(value, suit)
      end
    end
    @cards.shuffle!
  end

  def draw
    @cards.pop
  end

  def contains? card
    @cards.include? card
  end
end
