class Player

  attr_reader :symbol, :spaces

  def initialize(symbol)
    @symbol = symbol
    @spaces = []
  end

  def place_mark(position, board)
    spaces.push(position) if board.place_mark(position, @symbol)
  end

end