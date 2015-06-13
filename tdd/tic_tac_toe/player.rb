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
    selected_space = board.random_available_space
    place_mark(selected_space, board)
    puts "Player O selected space #{selected_space}."
  end

  def human_turn(board)
    board.build_grid

    success = false
    until success
      print 'Please choose an available space [0-8]: '

      # Save the space the player wants to occupy
      selected_space = gets.chomp.to_i

      # Make sure that the space is available and valid
      if place_mark(selected_space, board)
        success = true
      else
        puts 'You have selected an invalid space.'
      end
    end
  end

end
