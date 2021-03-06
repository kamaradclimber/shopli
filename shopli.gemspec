# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shopli/version'

Gem::Specification.new do |spec|
  spec.name          = "shopli"
  spec.version       = Shopli::VERSION
  spec.authors       = ["Gregoire Seux"]
  spec.email         = ["shopli@familleseux.net"]
  spec.summary       = %q{Generate a shop list from a list of barcodes scanned before trash}
  spec.description   = %q{If you get the barcode of all things you put to the trash, shopli will generate your next shop list}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File. basename(f) }
  spec.test_files    = `git ls-files -- spec/*`.split("\n")
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'rest-client'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "coveralls"
end
