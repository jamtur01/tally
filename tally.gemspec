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

  s.add_dependency "sinatra"
  s.add_dependency "data_mapper"
  s.add_dependency "httpclient"
  s.add_dependency "dm-sqlite-adapter"
  s.add_dependency "dm-adjust"
  s.add_dependency "json"

  s.has_rdoc      = false
  s.bindir        = [ "bin" ]
  s.executables   = [ "tally", "tally-submit" ]
  s.require_paths = [ "lib" ]
  s.files         = Dir.glob("{views,public,db,bin,lib}/**/*") + %w(LICENSE README.md TODO.md Gemfile config.ru Rakefile)
end
