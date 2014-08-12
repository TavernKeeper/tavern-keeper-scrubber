# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tavern-keeper/scrubber/version'

Gem::Specification.new do |spec|
  spec.name          = "tavern-keeper-scrubber"
  spec.version       = Tavern::Keeper::Scrubber::VERSION
  spec.authors       = ["Bill Centinaro"]
  spec.email         = ["bill@theresnobox.net"]
  spec.summary       = %q{Content Scrubber for Tavern Keeper}
  spec.description   = %q{}
  spec.homepage      = "https://www.tavern-keeper.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"

  spec.add_dependency 'loofah'
end
