require './lib/card.rb'

describe Card do

  subject(:card) {described_class.new('A', 'Spades')}

  describe '#initialize' do

    it 'is initialized with a suit' do
      expect(card.suit).to eq 'Spades'
    end

    it 'is initialized with a rank' do
      expect(card.rank).to eq 'A'
    end
  end
end
