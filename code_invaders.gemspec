# frozen_string_literal: true

require_relative "lib/code_invaders/version"

Gem::Specification.new do |spec|
  spec.name = "code_invaders"
  spec.version = CodeInvaders::VERSION
  spec.authors = ["amer-buljubasic"]
  spec.email = ["buljubasic.amer@gmail.com"]

  spec.summary = "Space invaders are upon us!"
  spec.description = "Code invaders wilt take a radar sample as an argument and reveal possible locations of those
                      pesky invaders."
  spec.homepage = "https://github.com/amer-buljubasic/invaders"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/amer-buljubasic/invaders"
  spec.metadata["changelog_uri"] = "https://github.com/amer-buljubasic/invaders/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
      f.end_with?(".gem")
    end
  end
  spec.files << "exe/code_invaders" unless spec.files.include?("exe/code_invaders")
  spec.files << "lib/code_invaders/cli.rb" unless spec.files.include?("lib/code_invaders/cli.rb")

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
