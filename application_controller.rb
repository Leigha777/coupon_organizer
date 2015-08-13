# shotgun -o 0.0.0.0 -p 3000
require 'bundler'
Bundler.require

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end

<<<<<<< HEAD
  get '/submission' do
    erb :submission
  end
   end
=======
   end
>>>>>>> 3fb9b4ac03b2f6baa318fe6fc45f95ab41d21cb0
