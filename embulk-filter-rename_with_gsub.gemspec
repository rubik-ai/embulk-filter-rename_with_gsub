
Gem::Specification.new do |spec|
  spec.name          = "embulk-filter-rename_with_gsub"
  spec.version       = "0.1.1"
  spec.authors       = ["sesame"]
  spec.summary       = "Rename With Gsub filter plugin for Embulk"
  spec.description   = "Rename With Gsub"
  spec.email         = ["sesame@purplemoon.org"]
  spec.licenses      = ["MIT"]
  spec.homepage      = "https://github.com/sesame/embulk-filter-rename_with_gsub"

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = spec.files.grep(%r{^(test|spec)/})
  spec.require_paths = ["lib"]

  #spec.add_dependency 'YOUR_GEM_DEPENDENCY', ['~> YOUR_GEM_DEPENDENCY_VERSION']
  spec.add_development_dependency 'embulk', ['>= 0.8.9']
  spec.add_development_dependency 'bundler', ['>= 1.10.6']
  spec.add_development_dependency 'rake', ['>= 10.0']
  spec.add_development_dependency 'embulk-parser-regexp', ['> 1.2.1']
end
