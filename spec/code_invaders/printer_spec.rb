require "spec_helper"

RSpec.describe CodeInvaders::Printer do
  describe "#print_results" do
    let(:results) { { 0 => [{ x: 7, y: 6 }], 1 => [{ x: 92, y: 48 }], 2 => [{ x: 45, y: 28 }, { x: 100, y: 30 }] } }
    let(:expected_output) do
      "\"Invader 0 found at locations: [{x: 7, y: 6}]\"\n" \
        "\"Invader 1 found at locations: [{x: 92, y: 48}]\"\n" \
        "\"Invader 2 found at locations: [{x: 45, y: 28}, {x: 100, y: 30}]\"\n"
    end

    it "prints formatted results" do
      expect do
        described_class.print_results(results:)
      end.to output(expected_output).to_stdout
    end
  end
end
