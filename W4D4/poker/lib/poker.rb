class Card
  attr_reader :value, :suit
  def initialize(value, suit)
    @value = value
    @suit = suit
  end
end

class Deck
  SUITS = %w( heart club spade diamond)
  VALUES = %w( 2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
  attr_reader :cards
  def initialize
    @cards= []
    populate
  end

  def populate
    SUITS.each do |suit|
      VALUES.each do |value|
        @cards << Card.new(value, suit)
      end
    end
  end

  def deal(player)
    top = @cards.pop
    player.add(top)
  end

end