# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'asteroids/version'

Gem::Specification.new do |spec|
  spec.name          = "asteroids"
  spec.version       = Asteroids::VERSION
  spec.authors       = ["Svetoslav Kuzmanov"]
  spec.email         = ["svetoslav.kuzmanov@gmail.com"]
  spec.summary       = <<-EOS
    This is my take on the classic arcade space shooter Asteroids by Atari
  EOS
  spec.description   = <<-EOS
    This game is build with Gosu library as a final project for the
    "Programming with Ruby" course.
  EOS
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = 'asteroids'
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency 'gosu'
end
