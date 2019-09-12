require_relative "../Piece"
require_relative "../Slide"

class Bishop < Piece
  include Slideable
  def initialize(color, board, pos)
    super
  end

  def inspect
    " ♝ "
  end
  def valid_moves

  end
  protected

  def move_dirs
    diagonal_dirs
  end
end