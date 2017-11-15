# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ships-log/version'

Gem::Specification.new do |spec|
  spec.name          = "ships-log"
  spec.version       = ShipsLogGem::Rails::VERSION
  spec.authors       = ["Brandon Beeks"]
  spec.email         = ["brandon@beeks.me"]

  spec.summary       = %q{IXN Shared Constants}
  spec.description   = %q{Shared information for IXN rails apps}
  spec.homepage      = "https:/ixn.tech"
  spec.license       = "MIT"
  spec.files         = `git ls-files -- {app,bin,lib,test,spec}/* {LICENSE*,Rakefile,README*}`.split("\n")
  spec.require_paths = ["lib"]

  spec.add_dependency "railties"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
end
