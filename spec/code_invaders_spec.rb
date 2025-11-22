# frozen_string_literal: true

RSpec.describe CodeInvaders do
  it "has a version number" do
    expect(CodeInvaders::VERSION).not_to be nil
  end

  it "loads core classes" do
    expect(defined?(CodeInvaders::Invader)).to eq("constant")
    expect(defined?(CodeInvaders::Locator)).to eq("constant")
    expect(defined?(CodeInvaders::Printer)).to eq("constant")
    expect(defined?(CodeInvaders::RadarSample)).to eq("constant")
  end
end
