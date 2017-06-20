require 'hand_score'

RSpec.describe HandScore do
  it "is not nil" do
    expect(HandScore.new).to_not be_nil()
  end
end