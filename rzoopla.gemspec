# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rzoopla/version'

Gem::Specification.new do |spec|
  spec.name          = 'rzoopla'
  spec.version       = RZoopla::VERSION
  spec.authors       = ['Omer Jakobinsky']
  spec.email         = ['omer@jakobinsky.com']

  spec.summary       = 'A Ruby wrapper for the Zoopla API.'
  spec.description   = 'A work in progress Ruby wrapper for the Zoopla API.'
  spec.homepage      = 'https://github.com/Omer/rzoopla'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f|
    f.match(%r{^(test|spec|features)/})
  }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop', '~> 0.30'
end
