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

  describe '#check_for_sequence?' do
    it 'sets the attribute shuffled to true if no two cards are in sequence' do
      expect(deck.check_for_sequence?).to be false
    end
    it 'sets the attribute shuffled to false if two cards or more are in sequence' do
      deck.cards = []
      expect(deck.check_for_sequence?).to be true
    end
  end

  describe '#shuffle_cards' do
    it 'returns a randomised deck of cards with no sequences' do
      deck.shuffle_cards
      expect(deck.shuffled).to eq true
    end
  end
end
