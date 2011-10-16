$:.unshift(File.expand_path(File.dirname(__FILE__) + '/lib/'))
$:.unshift(File.expand_path(File.dirname(__FILE__)))

require 'tally/server'
require 'tally/version'

use Rack::Static, :urls => ["/css", "/images"], :root => "public"

run Tally::Server::Application
