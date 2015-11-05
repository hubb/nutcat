# encoding: UTF-8

lib = File.expand_path('lib')
$:.unshift(lib) unless $:.include?(lib)

require 'nutcat/version'

Gem::Specification.new do |s|
  s.name        = "nutcat"
  s.version     = Nutcat::VERSION
  s.authors     = ["Thibault Gautriaud"]
  s.email       = ["thibault.gautriaud@gmail.com"]
  s.summary     = "A Cat Line Interface"
  s.description = "A Cat Line Interface for Nutmeg"
  s.homepage    = "http://nutmeg.com"

  s.add_runtime_dependency "catpix"
  s.add_development_dependency "bundler", "~> 1.10"
  s.add_development_dependency "pry", "~> 0.10"
  s.add_development_dependency "pry-nav", "~> 0.2.4"
  s.add_development_dependency 'rspec', '~> 3.3', '>= 3.3.0'
  s.add_development_dependency 'guard', '~> 2.13', '>= 2.13.0'
  s.add_development_dependency 'guard-rspec', '~> 4.6', '>= 4.6.4'
  s.add_development_dependency 'terminal-notifier', '~> 1.6', '>= 1.6.3'
  s.add_development_dependency 'terminal-notifier-guard', '~> 1.6', '>= 1.6.4'

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- spec/*/*_spec*`.split("\n")
  s.executables  = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.license      = 'MIT'
end