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

end
