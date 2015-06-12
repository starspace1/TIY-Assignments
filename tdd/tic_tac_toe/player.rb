class Player

  attr_reader :symbol

  def initialize(symbol)
    @symbol = symbol
  end

  def place_mark(position, board)
    board.place_mark(position, @symbol)
  end

end