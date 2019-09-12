require_relative "../Piece"
require_relative "../Slide"

class Rook < Piece
  include Slideable
  def initialize(color, board, pos)
    super
  end

  def inspect
    " ♜ "
  end
  def valid_moves

  end
  protected

  def move_dirs
    horizontal_dirs
  end
end