require_relative "../Step"
require_relative "../Piece"

class Pawn < Piece
  include Stepable
  def initialize(color, board, pos)
    super
  end

  def inspect
    " ♟ "
  end

  def valid_moves
    valid = []
    self.moves.each do |pos|
      row, col = pos
      if row.between?(0,7) && col.between?(0,7)
        valid << pos if !self.ally?(pos)
      end
    end
    valid
  end
  protected

  def move_diffs
    [[2,1],[2,-1],[-2,1],[-2,-1],[1,2],[1,-2],[-1,2],[-1,-2]]
  end

end
