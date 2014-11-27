# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/walletone/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-walletone"
  spec.version       = OmniAuth::WalletOne::VERSION
  spec.authors       = ["Andrey Sidorov"]
  spec.email         = ["vozdelaluz@gmail.com"]
  spec.summary       = %q{OmniAuth strategy for WalletOne}
  spec.homepage      = "https://github.com/heretge/omniauth-walletone"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'multi_json', '~> 1.3'
  spec.add_runtime_dependency "omniauth-oauth2", '~> 1.2'
  spec.add_development_dependency 'rspec', '~> 2.7'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'webmock'
end
