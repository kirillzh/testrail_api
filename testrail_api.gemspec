# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'testrail_api/version'

Gem::Specification.new do |spec|
  spec.name     = 'testrail_api'
  spec.version  = TestRail::VERSION
  spec.platform = Gem::Platform::RUBY

  spec.authors = ['Kirill Zhukov']

  spec.summary     = 'Ruby client for TestRail API v2'
  spec.description = spec.summary
  spec.homepage    = 'https://github.com/kirillzh/testrail_api'
  spec.license     = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  # Dependencies
  spec.add_development_dependency('bundler', '~> 1.10')
  spec.add_development_dependency('rake', '~> 10.0')

  spec.add_dependency('typhoeus', '~> 0.7', '>= 0.7')

  spec.required_ruby_version     = '>= 1.9.2'
  spec.required_rubygems_version = '>= 1.3.5'
end
