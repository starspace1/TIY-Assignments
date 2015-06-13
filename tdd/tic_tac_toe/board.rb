class Board

  attr_reader :spaces

  def initialize
    @spaces = [nil]*9
  end

  def place_mark(space, mark)
    
    if space_valid?(space) && space_available?(space)
      @spaces[space] = mark
    end
    
  end

  def available_spaces
    spaces.select {|space| space==nil}
  end

  def space_available? space
    @spaces[space] == nil
  end

  def space_valid? space
    (0..9).include? space
  end

  def build_grid

    print "\n\n"

    (0..8).each do |i|

      if spaces[i] # space is occupied with X or O
        print spaces[i]
      else # space i is nil, just print the space #
        print i
      end

      # Add some formatting to make the grid
      if ![2, 5, 8].include? i
        print " | "
      end

      if [2, 5].include? i
        print "\n----------\n"
      end

    end

    print "\n\n\n"

  end #def build_grid

end