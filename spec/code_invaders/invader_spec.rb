require "spec_helper"

RSpec.describe CodeInvaders::Invader do
  describe "#invaders" do
    it "returns 2 known invaders" do
      expect(described_class.all.count).to eq(2)
    end
  end
end
