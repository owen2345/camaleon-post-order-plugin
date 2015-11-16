$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "camaleon_post_order/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "camaleon_post_order"
  s.version     = CamaleonPostOrder::VERSION
  s.authors     = ["Owen"]
  s.email       = ["owenperedo@gmail.com"]
  s.homepage    = ""
  s.summary     = ": Summary of CamaleonPostOrder."
  s.description = ": Description of CamaleonPostOrder."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.4"

  s.add_development_dependency "sqlite3"
end
