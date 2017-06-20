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
  end
end