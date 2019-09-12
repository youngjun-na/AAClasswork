
module Stepable
  def moves
    new_moves = []
    move_diffs.each do |direction|
      row, col = @pos
      new_moves << [direction[0]+row, direction[1]+col]
    end
    new_moves
  end

  # private

  # def move_diffs
  #   raise "not implemented"

  # end

end