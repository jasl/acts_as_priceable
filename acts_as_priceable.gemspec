$:.push File.expand_path("../lib", __FILE__)

require "acts_as_priceable/version"

Gem::Specification.new do |s|
  s.name        = "acts_as_priceable"
  s.version     = ActsAsPriceable::VERSION
  s.authors     = ["Jasl"]
  s.email       = ["jasl9187@hotmail.com"]
  s.homepage    = "https://github.com/jasl/acts_as_priceable"
  s.summary     = "a easy way to store price as cents in database, but keep usability."
  s.license     = "MIT"
  s.description = <<-DESC
      Saving price as cents in database is a trick that would avoid lot of trouble.
      Acts_as_priceable using BigDecimal(default, you can change) for computing in your app,
      and save the value as cents automatically.
  DESC

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "activemodel", ">= 3.0.0"
  s.add_dependency "activesupport", ">= 3.0.0"

  s.add_development_dependency "bundler"
  s.add_development_dependency "rake"
end
