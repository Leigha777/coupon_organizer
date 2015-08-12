require 'bundler'
Bundler.require

class MyApp < Sinatra::Base

  get '/' do
    #these are routes
    erb :index
  end

end