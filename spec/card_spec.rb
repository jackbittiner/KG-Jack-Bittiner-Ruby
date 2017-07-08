require './lib/card.rb'

describe Card do

  subject(:card) {described_class.new('Spades')}

  describe '#initialize' do

    it 'is initialized with a suit' do
      expect(card.suit).to eq 'Spades'
    end
  end
end
