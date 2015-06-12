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

end