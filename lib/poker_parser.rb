require './lib/hand'

class PokerParser
  def initialize
    @rounds = []
    File.readlines("poker.txt").each do |line|
      line = line.gsub("\n", "")
      @rounds << { p1: line[0..13], p2: line[15..line.length-1] }
    end
  end

  def parse
    p1_win_count = 0
    @rounds.each do |round|
      p1_hand = Hand.new(round[:p1])
      p2_hand = Hand.new(round[:p2])
      p1_rank = p1_hand.rank
      p2_rank = p2_hand.rank
      if (p1_rank > p2_rank ||
          (p1_rank == p2_rank &&
            p1_hand.high_card[:high] > p2_hand.high_card[:high] &&
            p1_hand.high_card[:count] >= p2_hand.high_card[:count]))
        p1_win_count += 1
      end
    end

    puts "Player 1 wins #{p1_win_count} times."
  end
end