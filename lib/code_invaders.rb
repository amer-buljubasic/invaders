# frozen_string_literal: true

require_relative "code_invaders/version"
require "code_invaders/locator"
require "code_invaders/invader"
require "code_invaders/radar_sample"
require "code_invaders/printer"
require "code_invaders/cli"

module CodeInvaders
  class Error < StandardError; end

  def self.track(radar_sample:)
    invaders = Invader.all
    results = Locator.run(invaders:, radar_sample:)
    Printer.print_results(results:)
  end
end
