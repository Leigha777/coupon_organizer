# shotgun -o 0.0.0.0 -p 3000
require 'bundler'
Bundler.require

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end

   end
