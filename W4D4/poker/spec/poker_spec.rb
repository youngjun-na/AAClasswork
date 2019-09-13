require "poker"

RSpec.describe Card do

  describe "#initialize" do
    subject(:card) {Card.new("Jack", "Heart")}
    it "initializes with a suit and a value" do
      expect(card.suit).to eq("Heart")
      expect(card.value).to eq("Jack")
    end
  end   
end

RSpec.describe Deck do

  subject(:deck) {Deck.new}

  describe "#initialize" do
      it "contains 52 cards" do
        expect(deck.cards.length).to eq(52)
      end
      it "includes 13 different values and 4 different suits" do
        expect(deck.cards.select {|card| card.suit == "heart"}.length).to eq(13)
        expect(deck.cards.select {|card| card.value == "Jack"}.length).to eq(4)
      end
  end

  describe "#deal" do
    let(:player) { double("player1") }
    let(:card) { Card.new("Ace","spade")}
    it "should remove the top card of the deck" do
      allow(player).to receive(:add)
      deck.deal(player)
       expect(deck.cards.length).to eq(51)
    end

    it "should call add on the player instance" do
      expect(player).to receive(:add)
      deck.deal(player)
    end

  end


end