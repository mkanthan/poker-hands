class Hand
  ROYAL_SUM = 60
  HIGH_ACE_NUMBER = 14

  def initialize(hand)
    @cards = hand.split
    @numbers = @cards.map { |c| to_integer(c[0]) }.sort
    @counts = @numbers.group_by{ |x| x }.map{|k, v| [k, v.length]}.to_h
    @suit = @cards.map { |c| c[1] }
  end

  def rank
    royal = is_royal
    flush = is_flush
    straight = is_straight
    four_of_a_kind = is_x_of_a_kind(4)
    three_of_a_kind = is_x_of_a_kind(3)
    one_pair = is_x_of_a_kind(2)
    return Rank::ROYAL_FLUSH      if (royal && flush)
    return Rank::STRAIGHT_FLUSH   if (straight && flush)
    return Rank::FOUR_OF_A_KIND   if (four_of_a_kind)
    return Rank::FULL_HOUSE       if (three_of_a_kind && one_pair)
    return Rank::FLUSH            if (flush)
    return Rank::STRAIGHT         if (straight)
    return Rank::THREE_OF_A_KIND  if (three_of_a_kind)
    return Rank::TWO_PAIR         if (has_three_counts && one_pair)
    return Rank::ONE_PAIR         if (one_pair)
  end

  private
  def to_integer(card)
    face_map = { "T" => 10, "J" => 11, "Q" => 12, "K" => 13, "A" => 14 }
    face_map[card] || card.to_i
  end

  def is_royal
    @numbers.inject(0){|sum,x| sum + x } == ROYAL_SUM
  end

  def is_flush
    @suit.uniq.length == 1
  end

  def is_straight
    straight = (@numbers.first..@numbers.last).to_a == @numbers
    low_ace_straight = false
    if (@numbers.include?(HIGH_ACE_NUMBER))
      low_ace_numbers = @numbers.dup.shift(4).unshift(1)
      low_ace_straight = (low_ace_numbers.first..low_ace_numbers.last).to_a == low_ace_numbers
    end
    straight || low_ace_straight
  end

  def is_x_of_a_kind(x)
    @counts.values.each do |value|
      return true if value == x
    end
    return false
  end

  def has_three_counts
    @counts.values.length == 3
  end
end