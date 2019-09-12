require_relative "../Piece"
require_relative "../Slide"

class Queen < Piece
  include Slideable
  def initialize(color, board, pos)
    super
  end

  def inspect
    " ♛ "
  end
  def valid_moves

  end
  protected

  def move_dirs
    diagonal_dirs + horizontal_dirs
  end
end