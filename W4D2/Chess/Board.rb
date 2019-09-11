require_relative "Piece"

class Board
  attr_accessor :board
  def initialize
    @board = Array.new(8) {Array.new(8)}
    self.populate
  end

  def populate
    @board.each_with_index do |row, idx|
      if idx < 2 || idx > 5
        row.each_with_index do |ele, id|
          row[id] = Piece.new
        end
      # else 
      #   8.times {row << nil}
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


  def move_piece(start_pos, end_pos)
    if self[start_pos] == nil
      raise "there is no piece at #{start_pos}"
    elsif self[end_pos] != nil
      raise "the piece cannot move to #{end_pos}"
    else
      piece = self[start_pos]
      self[start_pos] = nil
      self[end_pos] = piece
    end
  end

  def print_board
    @board.each do |row|
      row.each_with_index do |el, i|
        if el.class == Piece
          row[i] = "."
        end
      end
      p row
     end
  end
 

end

b = Board.new
b.move_piece([1,1], [3,3])
b.print_board
puts "------------------"
b.move_piece([3,3],[4,4])
b.print_board