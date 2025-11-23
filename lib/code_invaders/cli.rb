require "code_invaders"

module CodeInvaders
  class CLI
    def self.start(argv)
      new(argv).call
    end

    def initialize(argv)
      @argv = argv
    end

    def call
      return file_missing if @argv.empty?

      file_path = @argv.first
      return file_not_exist(file_path) unless File.exist?(file_path)

      radar_sample = File.read(file_path)

      CodeInvaders.track(radar_sample:)
    end

    private

    def file_missing
      puts "Error: No input file provided."
      puts "Usage: code_invaders path/to/file.txt"
      exit 1
    end

    def file_not_exist(file_path)
      puts "File not found: #{file_path}"
      exit 1
    end
  end
end
