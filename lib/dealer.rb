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
    able_to_deal_cards?
    7.times do
      (0..3).each do |num|
        self.players[num].hand << self.deck.cards[0]
        self.deck.cards.shift
      end
    end
  end

  def return_cards_and_shuffle
    self.players.each do |player|
      self.deck.cards.concat player.hand
      player.hand.clear
    end
    shuffle_deck
  end

  private

  def able_to_deal_cards?
    fail "Deck is not shuffled!" if self.deck.shuffled != true
    fail "Return cards and shuffle before dealing again!" if self.deck.cards.length < 52
  end

end
