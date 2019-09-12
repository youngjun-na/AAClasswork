
class Piece
  attr_reader :color, :board, :pos
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def empty?
    self.class != Nullpiece
  end

  def ally?(diff_pos)
    @color == @board[diff_pos].color
  end

  def valid_moves
    #empty for now
    "you called the Piece version of valid_moves!!!!!"
  end

  def pos=(val)
    if self.valid_moves.include?(val)
      @pos = val
    else
      raise "You can't move there!"
    end
  end

  private

  def move_into_check?(end_pos)
    real_pos = @pos
    @pos = end_pos
    #find the enemy king
    board.each do |row|
      row.each do |piece|
        if piece.class == King && piece.color != self.color
          return self.valid_moves.include?(piece.pos)
        end
      end
    end
    @pos = real_pos
  end
end