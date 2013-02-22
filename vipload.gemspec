$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "vipload/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "vipload"
  s.version     = Vipload::VERSION
  s.authors     = ["Dallas Read"]
  s.email       = ["dallas@livehours.co"]
  s.homepage    = "http://livehours.co"
  s.summary     = "Mountable FTP upload engine."
  s.description = "Mountable FTP upload engine."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.12"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
