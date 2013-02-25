# encoding: utf-8

require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "money-hungarian-mnb"
  gem.homepage = "http://github.com/hron84/money-hungarian-mnb"
  gem.license = "MIT"
  gem.summary = %Q{Hungarian MNB Bank for Money gem}
  gem.description = %Q{The gem provides integration for Money gem with webservice provided by Hungarian National Bank}
  gem.email = "hron@hron.me"
  gem.authors = ["Gabor Garami"]
  # dependencies defined in Gemfile
end

Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new


task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "money-hungarian-mnb #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
