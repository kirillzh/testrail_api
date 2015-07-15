# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'testrail/version'

Gem::Specification.new do |spec|
  spec.name     = 'testrail_api'
  spec.version  = TestRail::VERSION
  spec.platform = Gem::Platform::RUBY

  spec.authors = ['Kirill Zhukov']
  spec.email   = ['zhukov.kirill.96@gmail.com']

  spec.summary     = 'Client for TestRail API v2'
  spec.description = 'Wrapper for TestRail API v2'
  spec.homepage    = 'https://github.com/kirillzh/testrail_api'
  spec.license     = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  # Dependencies
  spec.add_development_dependency('bundler', '~> 1.10')
  spec.add_development_dependency('rake', '~> 10.0')

  spec.add_dependency('typhoeus', '~> 0.7.2')

  spec.required_ruby_version     = '>= 1.9.2'
  spec.required_rubygems_version = '>= 1.3.5'
end