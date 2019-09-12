module Slideable
  HORIZONTAL_DIRS = [[1,0],[-1,0],[0,1],[0,-1]]
  DIAGONAL_DIRS = [[1,1],[-1,-1],[1,-1],[-1,1]]

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    move_arr = []
    move_dirs.each do |arr| 
      move_arr.concat(grow_unblocked_moves_in_dir(arr))
    end
    move_arr
    #calls move_dirs from types of pieces 
  #grow_unblocked_moves
  #return an array of valid move
  end


  def move_dirs #for rook
    raise "not implemented!"
    # DIAGONAL_DIRS.each {|arr| self.grow_unblocked_moves_in_dir(arr) }
  end
  require "byebug"
  def grow_unblocked_moves_in_dir(arr)
    store_moves = []
    
    dx, dy = arr
    # pos = [dx*n, dy*n]
    i = 1
    while (@pos[0] + dx*i).between?(0,7) && (@pos[1] + dy*i).between?(0,7)
    
      break if @pos[0] + dx*i == 8 || @pos[1] + dy*i == 8 || @pos[0] + dx*i == -1 || @pos[1] + dy*i == -1
      space = @board[[(@pos[0] + dx*i), (@pos[1] + dy*i)]]
      if space.class != Nullpiece 
        store_moves << [@pos[0] + dx*i, @pos[1] + dy*i] if space.color != @color
        break
      end
      store_moves << [@pos[0] + dx*i, @pos[1] + dy*i]
      
      i += 1  
       # hits another piece of opposite color
    end
    return store_moves
    #returning an array of valid moves until it hits some obstacle
  end

end