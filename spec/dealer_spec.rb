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

    it 'raises an error if you try to deal without the deck being shuffled' do
      expect {dealer.deal_cards}.to raise_error "Deck is not shuffled!"
    end

    it 'raises an error if you try to deal cards when cards have already been dealt' do
      dealer.shuffle_deck
      dealer.deal_cards
      expect {dealer.deal_cards}.to raise_error "Return cards and shuffle before dealing again!"
    end
  end

  describe '#return_cards_and_shuffle' do
    it 'returns all the cards back to the deck' do
      dealer.shuffle_deck
      dealer.deal_cards
      dealer.return_cards_and_shuffle
      expect(dealer.deck.cards.length).to eq 52
    end

    it 'returns empties the players hands' do
      dealer.shuffle_deck
      dealer.deal_cards
      dealer.return_cards_and_shuffle
      expect(dealer.players[0].hand).to eq []
      expect(dealer.players[1].hand).to eq []
      expect(dealer.players[2].hand).to eq []
      expect(dealer.players[3].hand).to eq []
    end

    it 'shuffles the deck afterwards to maintain no sequences' do
      dealer.shuffle_deck
      dealer.deal_cards
      dealer.return_cards_and_shuffle
      expect(dealer.deck.shuffled).to be true
    end
  end
end
