# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ooxml_builder/version'

Gem::Specification.new do |spec|
  spec.name          = "ooxml_builder"
  spec.version       = Powerpoint::VERSION
  spec.authors       = ["jensmollerhoj"]
  spec.email         = ["jensmollerhoj@gmail.com"]
  spec.description   = %q{A Ruby gem that can create PowerPoint and Excel presentations.}
  spec.summary       = %q{ooxml_builder is a Ruby gem that can create a PowerPoint presentation with Excel charts.}
  spec.homepage      = "https://github.com/deepdivr/ooxml_builder"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 1.9.2'

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'

  spec.add_dependency 'rubyzip'
  spec.add_dependency 'fastimage'
end
