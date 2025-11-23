module CodeInvaders
  class Printer
    def self.print_results(results:)
      results.each do |k, v|
        p "Invader #{k} found at locations: #{v}"
      end
    end
  end
end
