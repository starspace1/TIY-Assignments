require 'set'

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

  def take_turn(board)
    puts "\nPlayer #{@symbol}'s turn."
    if @computer
      computer_turn(board)
    else
      human_turn(board)
    end
  end

  def computer_turn(board)
    selected_space = pick_space(board)
    place_mark(selected_space, board)
    puts "Player O selected space #{selected_space}."
  end

  def human_turn(board)
    board.build_grid
    success = false
    until success
      print 'Please choose an available space [0-8]: '
      selected_space = gets.chomp.to_i
      if place_mark(selected_space, board)
        success = true
      else
        puts 'You have selected an invalid space.'
      end
    end
  end

  def pick_space(board)
    # First, see if O can win by marking the third space (if has 2/3 of a winning pair)
    o_spaces_set = board.spaces_occupied_by(:O).to_set
    WINNING_TRIPLES.each do |triple|
      triple_set = triple.to_set
      spaces_needed = triple_set.difference(o_spaces_set).to_a
      return spaces_needed[0] if (spaces_needed.size == 1) && board.valid_space?(spaces_needed[0])
    end   
    # If we get here, we couldn't win in a move
    # Now defense begins...if X occupies any two of 3 winning pairs, mark the third space if it's available
    x_spaces_set = board.spaces_occupied_by(:X).to_set
    WINNING_TRIPLES.each do |triple|
      triple_set = triple.to_set
      spaces_to_block = triple_set.difference(x_spaces_set).to_a
      return spaces_to_block[0] if (spaces_to_block.size == 1) && board.valid_space?(spaces_to_block[0])
    end
    # If we get here, we couldn't win in a move, or defend if X is about to win.
    # So, just return a random available space (for now.)
    return board.random_available_space
  end
end
