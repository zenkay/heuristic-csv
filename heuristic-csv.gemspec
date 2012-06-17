# -*- encoding: utf-8 -*-
require File.expand_path('../lib/heuristic-csv/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Andrea Mostosi"]
  gem.email         = ["andrea.mostosi@zenkay.net"]
  gem.description   = %q{}
  gem.summary       = %q{CSV extension}
  gem.homepage      = "https://github.com/zenkay/heuristic-csv"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "heuristic-csv"
  gem.require_paths = ["lib"]
  gem.version       = HeuristicCsv::VERSION
  
  gem.add_development_dependency "rspec", "~> 2.6.0"
end
