# frozen_string_literal: true

# creates knight class
class Knight
  attr_accessor :position, :child_nodes, :previous

  def initialize(position, previous = nil)
    @position = position
    @previous = previous
    @moves = [[2, 1], [1, 2], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
  end

  #determine all possible moves and eliminate any that would go off the board
  def possible_moves
    possibles = []
    @moves.each do |move|
      possible = [] 
      x = (move[0] + @position[0]) unless (move[0] + position[0] < 0) || (move[0] + position[0] > 7)
      possible << x
      y = (move[1] + @position[1]) unless (move[1] + position[1] < 0) || (move[1] + position[1] > 7)
      possible << y
      possibles << possible unless possible.include?(nil)
    end
    possibles
  end
end
