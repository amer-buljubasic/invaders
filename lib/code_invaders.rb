# frozen_string_literal: true

require_relative "code_invaders/version"
require "code_invaders/locator"
require "code_invaders/invader"
require "code_invaders/radar_sample"
require "code_invaders/printer"

module CodeInvaders
  class Error < StandardError; end

  def self.track
    invaders = Invader.all
    radar_sample = RadarSample::SAMPLE
    results = Locator.run(invaders:, radar_sample:)
    Printer.print_results(results:)
  end
end
