module CodeInvaders
  class Printer
    def self.print_results(results:)
      p "No ivaders found. We are safe!" if results == {}

      results.each do |k, v|
        p "Invader #{k} found at locations: #{v}"
      end
    end
  end
end
