require 'hand'
require 'rank'

RSpec.describe Hand do

  describe "rank" do
    it "should return a royal flush for a royal flush hand" do
      @hand = Hand.new("KD JD QD TD AD")
      expect(@hand.rank).to eq(Rank::ROYAL_FLUSH)

      @hand = Hand.new("TS QS JS AS KS")
      expect(@hand.rank).to eq(Rank::ROYAL_FLUSH)
    end

    it "should return a straight flush for a straight flush hand" do
      @hand = Hand.new("AD 2D 5D 3D 4D")
      expect(@hand.rank).to eq(Rank::STRAIGHT_FLUSH)

      @hand = Hand.new("8S 9S TS QS JS")
      expect(@hand.rank).to eq(Rank::STRAIGHT_FLUSH)
    end

    it "should return a four of a kind for a four of a kind" do
      @hand = Hand.new("AH AC 3D AS AD")
      expect(@hand.rank).to eq(Rank::FOUR_OF_A_KIND)

      @hand = Hand.new("7S 9S 7D 7H 7C")
      expect(@hand.rank).to eq(Rank::FOUR_OF_A_KIND)
    end

    it "should return a full house for a three of a kind and one pair" do
      @hand = Hand.new("AH 3C AD 3S 3D")
      expect(@hand.rank).to eq(Rank::FULL_HOUSE)

      @hand = Hand.new("7S 9S 7D 7H 9C")
      expect(@hand.rank).to eq(Rank::FULL_HOUSE)
    end

    it "should return a flush for a flush" do
      @hand = Hand.new("AH 8H 2H JH QH")
      expect(@hand.rank).to eq(Rank::FLUSH)

      @hand = Hand.new("7S 9S 8S 2S JS")
      expect(@hand.rank).to eq(Rank::FLUSH)
    end

    it "should return a straight for a straight" do
      @hand = Hand.new("3H AD 4C 2C 5S")
      expect(@hand.rank).to eq(Rank::STRAIGHT)

      @hand = Hand.new("6C 7C TD 8D 9H")
      expect(@hand.rank).to eq(Rank::STRAIGHT)
    end

    it "should return three of a kind for a three of a kind" do
      @hand = Hand.new("AH AC 3C AD 2D")
      expect(@hand.rank).to eq(Rank::THREE_OF_A_KIND)

      @hand = Hand.new("4H 3C 4C 4D 2D")
      expect(@hand.rank).to eq(Rank::THREE_OF_A_KIND)
    end

    it "should return two pair for two pair" do
      @hand = Hand.new("AH AC 3C 2H 2D")
      expect(@hand.rank).to eq(Rank::TWO_PAIR)

      @hand = Hand.new("8H 3C 4C 3D 4D")
      expect(@hand.rank).to eq(Rank::TWO_PAIR)
    end

    it "should return one pair for just one pair" do
      @hand = Hand.new("AH AC 3D 4S 5D")
      expect(@hand.rank).to eq(Rank::ONE_PAIR)

      @hand = Hand.new("AD 9S 3D 3H 7C")
      expect(@hand.rank).to eq(Rank::ONE_PAIR)
    end
  end
end