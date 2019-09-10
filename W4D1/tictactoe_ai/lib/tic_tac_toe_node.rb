require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    childs = []
    board.rows.each_with_index do |row, i|
      print row
      p i
      row.each_with_index do |square, j|
        if board.empty?([i, j])
          new_board = @board.dup
          new_board[i, j] = @next_mover_mark
          new_mark = ((next_mover_mark == :x) ? :o : :x)
          childs << TicTacToeNode(new_board, new_mark, [i, j])
        end
      end
    end
    childs
  end





end
