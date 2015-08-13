# shotgun -o 0.0.0.0 -p 3000
require 'bundler'
Bundler.require

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 1329712e0775cbf3cfdd3321e4305a6f6a101460
  get '/submission' do
    erb :submission
  end
   end
<<<<<<< HEAD
=======
   end
>>>>>>> 3fb9b4ac03b2f6baa318fe6fc45f95ab41d21cb0
=======

>>>>>>> 1329712e0775cbf3cfdd3321e4305a6f6a101460
