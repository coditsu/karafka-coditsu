# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name        = 'karafka_coditsu'
  spec.version     = '1.0.0'
  spec.platform    = Gem::Platform::RUBY
  spec.authors     = ['Maciej Mensfeld']
  spec.email       = %w[contact@coditsu.io]
  spec.homepage    = 'https://coditsu.io'
  spec.summary     = 'Coditsu overwrites for default Karafka classes'
  spec.description = 'Coditsu overwrites for default Karafka classes'
  spec.license     = 'LGPL-3.0'

  spec.add_dependency 'airbrake'
  spec.add_dependency 'karafka', '>= 2'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = %w[lib]
end
