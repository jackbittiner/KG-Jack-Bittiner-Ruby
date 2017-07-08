class Deck

  RANKS = ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K']
  SUITS = ['H', 'C', 'S', 'D']

  attr_reader :cards, :card_sequences, :shuffled
  attr_writer :cards, :shuffled

  def initialize
    @cards = []
    @card_sequences = []
    @shuffled = false
    SUITS.each do |suit|
      RANKS.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
    @cards.each_cons(2) { |a, b| @card_sequences << [a, b] }
  end

  def check_for_sequence?
    @shuffled = true
    @card_sequences.each do |sequent|
      self.shuffled = false if @cards.each_cons(2).include? sequent
    end
    return @shuffled
  end

  def shuffle_cards
    @cards.shuffle
    check_for_sequence?
    until self.shuffled = true
      @cards.shuffle
      check_for_sequence?
    end
  end

end
