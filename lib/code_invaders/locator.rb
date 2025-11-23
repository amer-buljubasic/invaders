module CodeInvaders
  class Locator
    def self.run(invaders:, radar_sample:)
      new(invaders, radar_sample).call
    end

    def initialize(invaders, radar_sample)
      @invaders = invaders
      @radar_sample = radar_sample
    end

    def call
      find_invaders
    end

    private

    attr_reader :invaders, :radar_sample

    def find_invaders
      invaders.each_with_index do |invader, index|
        locations[index] = locate_invader(invader:)
      end

      locations
    end

    def locate_invader(invader:)
      positions = []

      (0..max_row(invader)).each do |row|
        (0..max_col(invader)).each do |col|
          full_match = true
          invader.each_with_index do |i_row, index|
            if transformed_sample[row + index][col, i_row.length] != i_row
              full_match = false
              break
            end
          end

          positions << { x: col, y: row } if full_match
        end
      end

      positions
    end

    def max_row(invader)
      total_rows - invader.length
    end

    def max_col(invader)
      total_cols - invader.map(&:length).min
    end

    def total_rows
      @total_rows ||= transformed_sample.length
    end

    def total_cols
      @total_cols ||= transformed_sample.map(&:length).max
    end

    def locations
      @locations ||= {}
    end

    def transformed_sample
      @transformed_sample ||= radar_sample.split("\n")
    end
  end
end
