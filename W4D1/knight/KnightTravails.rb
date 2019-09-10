require_relative "polytreenode"

class KnightPathFinder

  attr_accessor :children, :start_pos
  attr_reader :parent, :root_node

  def self.valid_moves(pos)
    permutations = [-2, -1, 1, 2].permutation(2).to_a
    possible_moves = permutations.select { |perm| perm[0].abs != perm[1].abs}
    valid_moves = possible_moves.map do |el|
      el.map.with_index do |p, i|
        el[i] + pos[i]
      end
    end
    valid_moves
  end

  def initialize(start_pos)
    @start_pos = start_pos
    @considered_positions = [start_pos]
    @root_node = PolyTreeNode.new(start_pos)
    build_move_tree
  end

  def on_board?(pos)
    row, column = pos
    row >= 0 && row <= 7 && column >=0 && column <= 7
  end

  def new_move_positions(pos) #instance.new_move_position(pos)
    valid_m = KnightPathFinder.valid_moves(pos)
    valid_m.select! { |pos| !@considered_positions.include?(pos) && on_board?(pos)}
    @considered_positions += valid_m
    valid_m
  end
  
  def add_children(node)
    self.new_move_positions(node.value).each do |child_pos|
      node.add_child(PolyTreeNode.new(child_pos))
    end
    node.children
  end
    
  def build_move_tree
    queue = [root_node]
    until queue.empty?
      node = queue.shift
      queue += self.add_children(node)
    end 
  end

  def find_path(end_pos)

    end_node = @root_node.bfs(end_pos)
    
    arr = [end_node]
    until arr.first.value == @start_pos
      arr.unshift(arr.first.parent)
    end

    arr.map { |node| node.value }

  end

end

if __FILE__ == $PROGRAM_NAME
  k = KnightPathFinder.new([0,0])
  p k.find_path([6,2])
end
