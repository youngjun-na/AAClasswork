require "singleton"
require_relative "../Piece"

class Nullpiece < Piece
  include Singleton
  def initialize
    super
  end

  def moves

  end

  def symbols

  end
end

b = Nullpiece.instance

p b.color