class Card
  attr_reader :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def value
    if @value.is_a?(String)
      10
    else
      @value
    end
  end

  def to_s
    "#{@value} of #{@suit}"
  end
end