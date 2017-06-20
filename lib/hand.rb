class Hand
  def initialize(hand)
    @cards = hand.split
    @numbers = @cards.map { |c| c[0] }.sort
    @suit = @cards.map { |c| c[1] }
  end

  def rank
    return Rank::ROYAL_FLUSH if (@numbers.join == "AJKQT" && @suit.uniq.length == 1)
  end


end