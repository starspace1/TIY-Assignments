require 'term/ansicolor'
include Term::ANSIColor

class Board
  attr_reader :spaces

  def initialize
    @spaces = [nil] * 9
  end

  def place_mark(space, mark)
    return false unless valid_space? space
    @spaces[space] = mark
  end

  def num_available_spaces
    spaces.count { |space| space.nil? }
  end

  def valid_space?(space)
    @spaces[space].nil? && (0..9).include?(space)
  end

  def build_grid
    print "\n\n"
    (0..8).each do |i|
      print_space i
      # Add some formatting to make the grid
      print ' | ' unless [2, 5, 8].include? i
      print "\n----------\n" if [2, 5].include? i
    end
    print "\n\n\n"
  end

  def print_space(i)
    if spaces[i] # space is occupied with X or O
      if spaces[i] == :O
        print magenta, bold, "#{spaces[i]}", reset
      else
        print cyan, bold, "#{spaces[i]}", reset
      end
    else # space i is nil, just print the space #
      print i
    end
  end

  def random_available_space
    found_space = false

    until found_space
      space = rand(9) # Get a random number between 0 and 8
      found_space = valid_space? space # Make sure it's valid
    end
    space
  end

  def spaces_occupied_by(symbol)
    a = []
    (0..8).each do |i|
      a << i if spaces[i] == symbol
    end
    return a
  end
end
