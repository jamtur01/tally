require 'rest_client'

module Tally
  class Client

    def initialize(options)
      @server = options[:server]
      @user   = options[:user]
      @ticket = options[:ticket]
      submit
    end

    def submit

    end
  end
end
