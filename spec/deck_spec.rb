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

    it 'remembers what the card following a certain card is' do
      expect(deck.card_sequences[0][0].suit).to eq 'H'
      expect(deck.card_sequences[0][1].suit).to eq 'H'
      expect(deck.card_sequences[0][0].rank).to eq 'A'
      expect(deck.card_sequences[0][1].rank).to eq 2
    end
  end
end
