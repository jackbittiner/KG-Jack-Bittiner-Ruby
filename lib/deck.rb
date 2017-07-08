class Deck

  RANKS = ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K']
  SUITS = ['H', 'C', 'S', 'D']

  attr_reader :cards, :card_sequences

  def initialize
    @cards = []
    @card_sequences = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
    @cards.each_cons(2) { |a, b| @card_sequences << [a, b] }
  end
end
