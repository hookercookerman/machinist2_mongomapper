# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "machinist_mongomapper/version"

Gem::Specification.new do |s|
  s.name        = "machinist2_mongomapper"
  s.version     = MachinistMongomapper::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Richard Hooker"]
  s.email       = ["hookercookerman@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{machinist2 compatible mongo_mapper adapter}
  s.description = %q{does what the summary says}

  s.rubyforge_project = "machinist2_mongomapper"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]
  
  s.add_dependency 'mongo_mapper', '~> 0.8.6'
  s.add_dependency 'machinist', '~> 2.0.0.beta2'
  s.add_dependency "i18n"
  
  # == Testing
  s.add_development_dependency "rspec", "~> 2.1.0"
  s.add_development_dependency "bson_ext", "1.1.2"
end
