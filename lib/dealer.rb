class Dealer

  attr_reader :deck, :players

  def initialize
    @deck = Deck.new
    @players = []
    4.times {@players << Player.new}
  end

end
