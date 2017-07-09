class Dealer

  attr_reader :deck, :players

  def initialize
    @deck = Deck.new
    @players = []
    4.times {@players << Player.new}
  end

  def shuffle_deck
    self.deck.shuffle_cards
  end

  def deal_cards
    fail "Deck is not shuffled!" if self.deck.shuffled != true
    7.times do
      (0..3).each do |num|
        self.players[num].hand << self.deck.cards[0]
        self.deck.cards.shift
      end
    end
  end

end
