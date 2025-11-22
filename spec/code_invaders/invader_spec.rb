require "spec_helper"

RSpec.describe CodeInvaders::Invader do
  describe "#invaders" do
    it "returns 3 known invaders" do
      expect(described_class.all.count).to eq(3)
    end
  end
end
