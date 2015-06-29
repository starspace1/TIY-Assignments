class Card
  attr_reader :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def value
    if @value.is_a?(Integer)
      @value
    else
      if @value == :A
        1
      else
        10
      end
    end
  end

  def to_s
    "#{@value} of #{@suit}"
  end
end