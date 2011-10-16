require 'rubygems'
require 'httpclient'
require 'json'

u = {"email" => "james@lovedthanlost.net", "firstname" => "James", "lastname" => "Turnbull" }

data = {
        "type" => "issue",
        "user" => u.to_json,
        "issue" => "issue",
        "comment" => "notes",
        "changes" => "changes",
    }
 
client = HTTPClient.new
resp = client.post("http://absenta.lovedthanlost.net:3456/new", data)
return resp
