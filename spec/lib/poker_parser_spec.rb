require 'poker_parser'

RSpec.describe PokerParser do
  def setup_poker_file(fake_hands)
    @sample_poker_file = fake_hands
    allow(File).to receive(:readlines).with("poker.txt").and_return(@sample_poker_file)
  end

  describe "parse" do
    it "should display the correct answer" do
    end

    it "should test if player 1 has a better rank than player 2" do
      setup_poker_file(["5C AD 5D AC 9C 7C 5H 8D TD KS\n"])

      expect(STDOUT).to receive(:puts).with("Player 1 wins 1 times.")
      PokerParser.new.parse
    end

    it "should compare the high card values for a player 1 win if the ranks are the same" do
      setup_poker_file(["5C AD 5D JC 9C 4C 4H 8D TD KS\n"])

      expect(STDOUT).to receive(:puts).with("Player 1 wins 1 times.")
      PokerParser.new.parse
    end

    it "should not count as a win if player 2 won" do
      setup_poker_file(["5C AD 6D JC 9C 4C 4H 8D TD KS\n"])

      expect(STDOUT).to receive(:puts).with("Player 1 wins 0 times.")
      PokerParser.new.parse
    end
  end
end