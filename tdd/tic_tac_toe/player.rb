class Player
  attr_reader :symbol, :spaces, :computer

  def initialize(symbol, computer = false)
    @symbol = symbol
    @spaces = []
    @computer = computer
  end

  def place_mark(position, board)
    success = board.place_mark(position, @symbol)
    spaces.push(position) if success
    success
  end
end
