require './lib/deck.rb'

describe Deck do

  subject(:deck) {described_class.new}

  describe '#initialize' do

    it 'is initialized with 52' do
      expect(deck.cards.length).to eq 52
    end

    it 'has 52 unique cards' do
      expect(deck.cards.uniq.length == deck.cards.length).to be true
    end
  end
end
