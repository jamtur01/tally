#--
# Author:: James Turnbull (<james@lovedthanlost.net>)
# Copyright:: Copyright (c) 2011 James Turnbull
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
require 'json'
require 'pp'
require 'data_mapper'
require 'dm-adjust'

module Tally
  module Server
    class Application < Sinatra::Base

      configure do
        set :static, true
        set :root, File.dirname(__FILE__)
        set :public, 'public'
        set :show_exceptions, false
      end

      helpers do
        def cycle
          %w{even odd}[@_cycle = ((@_cycle || -1) + 1) % 2]
        end

        CYCLE = %w{even odd}
        def cycle_fully_sick
          CYCLE[@_cycle = ((@_cycle || -1) + 1) % 2]
        end
      end

      CustomError = Class.new(StandardError) 

      error CustomError do
          @error = 'Error: ' + request.env['sinatra.error'].message
          erb :error
      end

      class User
        include DataMapper::Resource

        property :id, Serial
        property :user, String, :key => true
        property :count, Integer
      end

      DataMapper::Logger.new($stdout, :debug)
      DataMapper.setup(:default, "sqlite3://#{File.expand_path(File.dirname(__FILE__))}/db/tally.db")
      DataMapper.finalize
      DataMapper.auto_upgrade!

      def get_title(path)
        path.gsub(/^\//, '').capitalize
      end

      def update_count(user)
        @users = User.first_or_create(:user => @user).adjust!(:count => +1)
      end

      get '/' do
        @title = nil
        @users = User.all(:order => [ :count.desc ])
        erb :index
      end

      get '/user/:user' do |user|
        @user = User.first(:user => params[:user])
        erb :user
      end

      post '/tally/new/?' do
        update = JSON.parse(params[:data])
        pp update
      end

      get '/tally' do
        erb :tally
      end

      post '/tally/submit' do
        #raise CustomError, 'Invalid ticket number - ticket must be a number.' unless params["ticket"].is_a?(Integer)
        @user = params["user"]
        @ticket = params["ticket"]
        update_count(@user)
        erb :result
      end

    end
  end
end
