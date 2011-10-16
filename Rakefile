require 'rake/gempackagetask'
require 'rspec/core/rake_task'

task :default => :spec

desc "Run all specs"
RSpec::Core::RakeTask.new(:spec) do |t|
    t.rspec_opts = %w|-cbfs|
      t.pattern = 'spec/**/*_spec.rb'
      end

gem_spec = eval(File.read("tally.gemspec"))

Rake::GemPackageTask.new(gem_spec) do |pkg|
    pkg.gem_spec = gem_spec
end
