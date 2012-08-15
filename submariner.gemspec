$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "submariner/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "submariner"
  s.version     = Submariner::VERSION
  s.authors     = ["Adam Gamble"]
  s.email       = ["adamgamble@gmail.com"]
  s.homepage    = "http://www.github.com/adamgamble/submariner"
  s.summary     = "Easy wildcard domains in rails"
  s.description = "Easy wildcard domains in rails"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 3.0"

  s.add_development_dependency "sqlite3"
end
