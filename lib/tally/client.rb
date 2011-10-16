require 'httpclient'
require 'json'

module Tally
  class Client

    def initialize(options)
      @server = options[:server]
      @first  = options[:first]
      @last   = options[:last]
      @email  = options[:email]
      submit
    end

    def submit
      u = {"email" => @email, "firstname" => @first, "lastname" => @last }

      data =  { "type" => "issue", "user" => u, "issue" => "issue", "comment" => "notes", "changes" => "changes" }

      client = HTTPClient.new
      resp = client.post(@server, data.to_json)
      puts resp
    end
  end
end
