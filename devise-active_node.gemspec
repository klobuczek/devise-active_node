# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'devise/active_node/version'

Gem::Specification.new do |spec|
  spec.name          = "devise-active_node"
  spec.version       = Devise::ActiveNode::VERSION
  spec.authors       = ["Heinrich Klobuczek"]
  spec.email         = ["heinrich@mail.com"]
  spec.summary       = 'ActiveNode ORM for devise'
  spec.description   = 'Adapter to enable usage of devise with ActiveNode'
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "active_node", ">= 2.2.4"
  spec.add_dependency "devise"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 2.4.0"
end
