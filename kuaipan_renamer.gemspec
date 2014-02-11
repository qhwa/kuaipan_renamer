# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kuaipan_renamer/version'

Gem::Specification.new do |spec|
  spec.name          = "kuaipan_renamer"
  spec.version       = KuaipanRenamer::VERSION
  spec.authors       = ["qhwa"]
  spec.email         = ["qhwa@163.com"]
  spec.summary       = %q{rename file names for Kuaipan web uploading}
  spec.description   = %q{Kuaipan uploading web page bugs: file with some characters in name will not be uploaded successfully. This gem helps to rename file / folders to get them uploaded.}
  spec.homepage      = "https://github.com/qhwa/kuaipan_renamer"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "colored", ">= 0"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
