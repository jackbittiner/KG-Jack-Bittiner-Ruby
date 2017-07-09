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

  describe '#shuffle_deck' do
    it 'shuffles the deck so that there are no two cards in sequence' do
      dealer.shuffle_deck
      expect(dealer.deck.shuffled).to be true
    end
  end

  describe '#deal_cards' do
    it 'gives each player 7 cards' do
      dealer.shuffle_deck
      dealer.deal_cards
      expect(dealer.players[0].hand.length).to eq 7
    end

    it 'deals one card to each player in order' do
      dealer.shuffle_deck
      card1 = dealer.deck.cards[0]
      card2 = dealer.deck.cards[1]
      card3 = dealer.deck.cards[2]
      card4 = dealer.deck.cards[3]
      dealer.deal_cards
      expect(dealer.players[0].hand[0]).to eq card1
      expect(dealer.players[1].hand[0]).to eq card2
      expect(dealer.players[2].hand[0]).to eq card3
      expect(dealer.players[3].hand[0]).to eq card4
    end
  end
end
