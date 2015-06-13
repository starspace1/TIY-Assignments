class Player

  attr_reader :symbol, :spaces

  def initialize(symbol)
    @symbol = symbol
    @spaces = []
  end

  def place_mark(position, board)
    success = board.place_mark(position, @symbol)
    spaces.push(position) if success
    return success
  end

end