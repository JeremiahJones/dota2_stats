# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dota2_stats/version'

Gem::Specification.new do |spec|
  spec.name          = 'dota2_stats'
  spec.version       = Dota2Stats::VERSION
  spec.authors       = ['Jeremiah Jones']
  spec.email         = ['jeremiah-jones@outlook.com']

  spec.summary       = 'App to utilize the DOTA 2 OPEN API and get data for player profile creation'
  spec.description   = 'App to utilize the DOTA 2 OPEN API and get data for player profile creation'
  spec.homepage      = 'https://github.com/JeremiahJones/dota2_stats'
  spec.license       = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/JeremiahJones/dota2_stats'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport'
  spec.add_dependency 'httpclient'
  spec.add_dependency 'json'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
end
