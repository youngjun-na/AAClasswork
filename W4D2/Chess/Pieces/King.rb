require_relative "../Piece"
require_relative "../Step"

class King < Piece
  include Stepable
  def initialize(color, board, pos)
    super
  end

  def inspect
    " ♚ "
  end

  def valid_moves

  end
  protected

  def move_diffs
    [[1,0],[-1,0],[0,1],[0,-1],[1,1],[-1,-1],[1,-1],[-1,1]]
  end

end
