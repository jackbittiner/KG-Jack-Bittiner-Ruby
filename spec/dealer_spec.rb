require './lib/dealer.rb'

describe Dealer do

  subject(:dealer) {described_class.new}

  describe '#initialize' do

    it 'is initialized with a fresh deck of cards' do
      expect(dealer.deck.cards.length).to eq 52
      expect(dealer.deck.shuffled).to be false
    end

    it 'is initialized with 4 players' do
      expect(dealer.players.length).to eq 4
    end
  end
end
