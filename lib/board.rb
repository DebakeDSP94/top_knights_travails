# frozen_string_literal: true

require_relative 'knight'

# creates board for knight to move on
class Board
  attr_accessor

  def initialize

  end

  def knight_moves(start, target)
    path = []
    result = moves_octo_tree(start, target)
    backtrack_path(start, result, path)
    path_output(start, target, path)
  end

  # up to 8 moves possible from each position 
  def moves_octo_tree(start, target)
    queue = []
    knight = Knight.new(start, target)
    queue << knight
    present = queue.shift
    until present.position == target
      present.possible_moves.each do |move|
        knight = Knight.new(move, present)
        queue << knight
      end
      present = queue.shift
    end
    present
  end

  def backtrack_path(start, present, path)
    until present.position == start
      path << present.position
      present = present.previous
    end
    path << start
    path.reverse!
  end

  def path_output(start, target, path)
    puts "The knight made it in #{path.size - 1} moves"
    puts "the shortest path from #{start} to #{target} is:"
    path.each { |step| puts "#{step}" }
  end
end

board = Board.new
board.knight_moves([2, 2], [6, 4])
board2 = Board.new
board2.knight_moves([3, 2], [6, 6])
board3 = Board.new
board3.knight_moves([0, 6], [5, 1])
