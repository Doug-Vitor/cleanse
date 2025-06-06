# frozen_string_literal: true

require_relative "lib/cleanse/version"

Gem::Specification.new do |spec|
  spec.name = "cleanse"
  spec.version = Cleanse::VERSION
  spec.authors = ["Douglas Vitor"]
  spec.email = ["douglasvitor.dev@gmail.com"]

  spec.summary = "Clean your fat ruby classes."
  spec.description = "Cleanse influences you to create modules and include them dynamically in your classes in order to keep them clean."
  spec.homepage = "https://github.com/Doug-Vitor/cleanse"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
