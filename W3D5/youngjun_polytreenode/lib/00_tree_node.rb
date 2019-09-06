class PolyTreeNode
  attr_accessor :children, :value
  attr_reader :parent
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def inspect
    { "value"=>@value, "parent"=>@parent, "children"=>@children }.inspect
  end

  def parent=(node)
    @parent.children.delete(self) if @parent != nil
    @parent = node
    if node != nil
       node.children << self unless node.children.include?(self)
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    if !self.children.include?(child_node)
        raise "it's not your child!"
    else
        child_node.parent = nil
    end
  end

  def dfs(target)
    #check self.value
    #returning node matching target
    return self if self.value == target
    self.children.each do |child| 
        correct_node = child.dfs(target)
        return correct_node unless correct_node == nil
    end
    return nil
  end

  def bfs(target)
    queue = [self]
    until queue.empty?
      node = queue.shift
      if node.value == target
        return node
      else
        queue += node.children
      end
    end
    return nil
  end

end