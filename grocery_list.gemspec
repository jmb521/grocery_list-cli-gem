# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grocery_list/version'

Gem::Specification.new do |spec|
  spec.name          = "grocery_list1"
  spec.version       = GroceryList::VERSION
  spec.authors       = ["Jennifer Pazos"]
  spec.email         = ["jmp521@gmail.com"]

  spec.summary       = %q{Scrapes www.jillcataldo.com for coupon deals}
  spec.description   = %q{Shows items, their price, the coupon and the size of items listed on jillcataldo.com}
  spec.homepage      = "https://github.com/jmb521/grocery_list-cli-gem"
  spec.license = "MIT"
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  # spec.bindir        = "exe"

  spec.executables  = ["grocery_list"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
end
