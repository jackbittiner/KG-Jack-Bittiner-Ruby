require './lib/player.rb'

describe Player do

  subject(:player) {described_class.new}

  describe '#initialize' do

    it 'is initialized with an empty hand' do
      expect(player.hand).to eq []
    end
  end
end
