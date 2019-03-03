Gem::Specification.new do |s|
  s.name = "humanize"
  s.version = "2.1.1"

  s.required_ruby_version = '>= 2.3'
  s.require_paths = ["lib"]
  s.authors = ["Jack Chen", "Ryan Bigg"]
  s.email = "me@ryanbigg.com"
  s.files         = `git ls-files`.split($/)
  s.test_files    = s.files.grep(%r{^(spec)/})
  s.homepage = "https://github.com/radar/humanize"
  s.rubygems_version = "2.5.1"
  s.summary = "Extension to Numeric to humanize numbers"

  s.add_development_dependency 'mutant'
  s.add_development_dependency 'mutant-rspec'
  s.add_development_dependency 'pry-byebug'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rubocop'
end
