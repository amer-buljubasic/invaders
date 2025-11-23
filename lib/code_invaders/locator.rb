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
      (0..total_rows - 1).each do |row|
        (0..row_length(row)).each do |col|
          invaders.each_with_index do |invader, index|
            next if row + invader.length > total_rows

            full_match = invader_found?(invader, row, col)

            locations[index] << { x: col, y: row } if full_match
          end
        end
      end

      locations
    end

    def invader_found?(invader, row, col)
      invader.each_with_index.all? do |i_row, index|
        current_row = transformed_sample[row + index]
        next false if col + i_row.size > current_row.size

        current_row[col, i_row.size] == i_row
      end
    end

    def row_length(row)
      transformed_sample[row].length
    end

    def total_rows
      @total_rows ||= transformed_sample.length
    end

    def locations
      @locations ||= Hash.new { |h, k| h[k] = [] }
    end

    def transformed_sample
      @transformed_sample ||= radar_sample.split("\n")
    end
  end
end
