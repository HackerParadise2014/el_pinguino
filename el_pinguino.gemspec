# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'el_pinguino/version'

Gem::Specification.new do |spec|
  spec.name          = "el_pinguino"
  spec.version       = ElPinguino::VERSION
  spec.authors       = ["Max Wofford"]
  spec.email         = ["max.speed.wofford@gmail.com"]
  spec.summary       = %q{Scrape TravelMob locations and convert to json.}
  spec.description   = %q{Scrape TravelMob locations and convert to json.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
