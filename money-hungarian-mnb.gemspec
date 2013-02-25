# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "money-hungarian-mnb"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Gabor Garami"]
  s.date = "2013-02-25"
  s.description = "The gem provides integration for Money gem with webservice provided by Hungarian National Bank"
  s.email = "hron@hron.me"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".rvmrc",
    ".travis.yml",
    "Gemfile",
    "Gemfile.lock",
    "History.txt",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "lib/money-hungarian-mnb.rb",
    "lib/money/bank/mnb.rb",
    "lib/money_hungarian_mnb.rb",
    "lib/money_mnb.rb",
    "spec/fixtures/currencies.xml",
    "spec/fixtures/rates.xml",
    "spec/integration/with_money_api_spec.rb",
    "spec/integration/with_wsdl_spec.rb",
    "spec/spec_helper.rb",
    "spec/unit/money_bank_mnb_spec.rb"
  ]
  s.homepage = "http://github.com/hron84/money-hungarian-mnb"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.25"
  s.summary = "Hungarian National Bank integration for Money gem"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<savon>, [">= 0"])
      s.add_runtime_dependency(%q<money>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, ["> 3.12"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<savon>, [">= 0"])
      s.add_dependency(%q<money>, [">= 0"])
      s.add_dependency(%q<rdoc>, ["> 3.12"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<savon>, [">= 0"])
    s.add_dependency(%q<money>, [">= 0"])
    s.add_dependency(%q<rdoc>, ["> 3.12"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
