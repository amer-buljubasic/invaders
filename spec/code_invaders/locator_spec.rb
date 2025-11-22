require "spec_helper"

RSpec.describe CodeInvaders::Locator do
  let(:invaders) do
    [
      ["--o--",
       "-o-o-"],
      ["oo",
       "oo"]
    ]
  end

  let(:radar_sample) do
    [
      "o---o--o-",
      "-o-o-o-o-",
      "-------oo",
      "-------oo"
    ]
  end

  let(:missing_invader) { ["abc"] }

  describe ".run" do
    it "returns found invaders with their locations" do
      results = described_class.run(invaders:, radar_sample:)

      expect(results[0]).to eq([{ x: 2, y: 0 }])
      expect(results[1]).to eq([{ x: 7, y: 2 }])
    end

    it "returns empty array if invaders not found" do
      results = described_class.run(invaders: [missing_invader], radar_sample:)

      expect(results[0]).to eq([])
    end
  end

  describe "#call" do
    subject(:locator) { described_class.new(invaders, radar_sample) }

    it "finds invaders using instance method" do
      results = locator.call

      expect(results).to eq(0 => [{ x: 2, y: 0 }], 1 => [{ x: 7, y: 2 }])
    end
  end
end
