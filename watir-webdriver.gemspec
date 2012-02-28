# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "watir-webdriver/version"

Gem::Specification.new do |s|
  s.name        = "watir-webdriver"
  s.version     = Watir::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jari Bakken"]
  s.email       = ["jari.bakken@gmail.com"]
  s.homepage    = "http://github.com/watir/watir-webdriver"
  s.summary     = %q{Watir on WebDriver}
  s.description = %q{WebDriver-backed Watir}

  s.rubyforge_project = "watir-webdriver"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "selenium-webdriver", '>= 2.20.0.rc1'

  s.add_development_dependency "rspec", "~> 2.6"
  s.add_development_dependency "yard", "~> 0.7.4"
  s.add_development_dependency "webidl", ">= 0.1.3"
  s.add_development_dependency "sinatra", "~> 1.0"
  s.add_development_dependency "rake", "~> 0.9.2"
  s.add_development_dependency "fuubar", "~> 0.0.6"
  s.add_development_dependency "nokogiri"
  s.add_development_dependency "activesupport", "~> 2.3.5" # for pluralization during code generation

  s.post_install_message = <<-MSG
Please note that watir-webdriver 0.5.0 brings some backwards incompatible changes:

  * Watir::Select#selected_options no longer returns Array<String>, but Array<Watir::Option>
      [ https://github.com/watir/watir-webdriver/issues/21 ]
  * Finding elements by :class now matches partial class attributes.
      [ https://github.com/watir/watir-webdriver/issues/36 ]

Additionally, watir-webdriver 0.5.1 removes the following deprecated methods:

  * element_by_xpath  : replaced by .element(:xpath, '...')
  * elements_by_xpath : replaced by .elements(:xpath, '...')

And deprecates the following methods:

 * Browser#clear_cookies - replaced by Browser#cookies API
   [ https://github.com/watir/watir-webdriver/issues/24 ]

  MSG
end
