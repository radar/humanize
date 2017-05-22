# -*- encoding: utf-8 -*-
# stub: humanize 1.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "humanize"
  s.version = "1.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jack Chen", "Ryan Bigg"]
  s.date = "2016-03-30"
  s.email = "radarlistener@gmail.com"
  s.files         = `git ls-files`.split($/)
  s.test_files    = s.files.grep(%r{^(spec)/})
  s.homepage = "https://github.com/radar/humanize"
  s.rubygems_version = "2.5.1"
  s.summary = "Extension to Numeric to humanize numbers"

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'mutant'
  s.add_development_dependency 'mutant-rspec'
  s.add_development_dependency 'pry-byebug'
end
