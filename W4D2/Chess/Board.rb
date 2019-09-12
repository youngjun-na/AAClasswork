require_relative "Piece"
require_relative "Pieces/Knight"
require_relative "Pieces/Nullpiece"
require_relative "Pieces/Rook"
require_relative "Pieces/Bishop"
require_relative "Pieces/King"
require_relative "Pieces/Queen"
require_relative "Pieces/Pawn"
class Board
  attr_accessor :board
  def initialize
    @board = Array.new(8) {Array.new(8)}
    self.populate
  end

  def populate
    row0 = [Rook.new(:B, self, [0,0]), Knight.new(:B, self, [0,1]), Bishop.new(:B, self, [0,2]), King.new(:B, self, [0,3]),
    Queen.new(:B, self, [0,4]), Bishop.new(:B, self, [0,5]), Knight.new(:B, self, [0,6]), Rook.new(:B, self, [0,7])]

    row1 = [Pawn.new(:B, self, [1,0]), Pawn.new(:B, self, [1,1]), Pawn.new(:B, self, [1,2]), Pawn.new(:B, self, [1,3]), 
    Pawn.new(:B, self, [1,4]), Pawn.new(:B, self, [1,5]), Pawn.new(:B, self, [1,6]), Pawn.new(:B, self, [1,7])]

    row7 = [Rook.new(:W, self, [7,0]), Knight.new(:W, self, [7,1]), Bishop.new(:W, self, [7,2]), King.new(:W, self, [7,3]),
    Queen.new(:W, self, [7,4]), Bishop.new(:W, self, [7,5]), Knight.new(:W, self, [7,6]), Rook.new(:W, self, [7,7])]

    row6 = [Pawn.new(:W, self, [6,0]), Pawn.new(:W, self, [6,1]), Pawn.new(:W, self, [6,2]), Pawn.new(:W, self, [6,3]), 
    Pawn.new(:W, self, [6,4]), Pawn.new(:W, self, [6,5]), Pawn.new(:W, self, [6,6]), Pawn.new(:W, self, [6,7])]

    @board.each_with_index do |row, i|
      if i == 0
        @board[0] = row0  
      elsif i == 1
        @board[1] = row1
      elsif i == 6
        @board[6] = row6
      elsif i == 7
        @board[7] = row7
      else
        row.each_with_index do |ele, j|
          row[j] = Nullpiece.instance
        end
      end
    end
  end
  
  def [](pos)
    row, column = pos
    @board[row][column]
  end

  def []=(pos, value)
    row, column = pos
    @board[row][column] = value
  end


  def move_piece(color, start_pos, end_pos)
    if self[start_pos].class == Nullpiece            ####### REWRITE TO do
      raise "there is no piece at #{start_pos}"
    elsif self[end_pos].color != color && self[end_pos].class != Nullpiece
      raise "the piece cannot move to #{end_pos}"
    else
      piece = self[start_pos]
      self[start_pos] = Nullpiece.instance
      self[end_pos] = piece
    end
  end

  def print_board
    @board.each do |row|
      row.each_with_index do |el, i|
        if el.class == Piece
          row[i] = el.to_s
        end
      end
      p row
     end
  end
  
  def valid_pos?(x, y)
    return false if !x.between?(0,7) || !y.between?(0,7)
    true
  end

end
board = Board.new
board.print_board
