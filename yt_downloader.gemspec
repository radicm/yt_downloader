
# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "yt_downloader/version"

Gem::Specification.new do |spec|
  spec.name          = "yt_downloader"
  spec.version       = YtDownloader::VERSION
  spec.authors       = ["RadicM"]
  spec.email         = ["milosrt2011@gmail.com"]

  spec.summary       = "You tube audio downloader"
  spec.description   = "Gem that helps you easly download audios from you tube"
  # spec.homepage      = "https://lucaguidi.com"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "hanami-cli"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
