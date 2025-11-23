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
      if @argv.empty?
        puts "Error: No input file provided."
        puts "Usage: code_invaders path/to/file.txt"
        exit 1
      end

      file_path = @argv.first

      unless File.exist?(file_path)
        puts "File not found: #{file_path}"
        exit 1
      end

      radar_sample = File.read(file_path)

      CodeInvaders.track(radar_sample:)
    end
  end
end
