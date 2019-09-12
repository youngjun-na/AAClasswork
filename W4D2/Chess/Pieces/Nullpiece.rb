require "singleton"
class Nullpiece 
  include Singleton
  def initialize
    super 

  end

  def color
    :X
  end

  def moves
    []
  end

  def inspect
    "   "
  end
end

