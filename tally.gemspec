$:.unshift(File.dirname(__FILE__) + '/lib')
require 'tally/version'

Gem::Specification.new do |s|
  s.name = 'tally'
  s.version = Tally::Version::VERSION
  s.platform = Gem::Platform::RUBY
  s.summary = "A Tally panel."
  s.description = s.summary
  s.author = "James Turnbull"
  s.email = "james@lovedthanlost.net"
  s.homepage = "http://github.com/jamtur01/tally"

  s.add_dependency "sinatra",
  s.add_dependency "data_mapper",
  s.add_dependency "rest_client",
  s.add_dependency "dm-sqlite-adapter",
  s.add_dependency "dm-adjust",
  s.add_dependency "json",

  s.bindir       = "bin"
  s.executables  = %w( tally )
  s.require_path = 'lib'
end
