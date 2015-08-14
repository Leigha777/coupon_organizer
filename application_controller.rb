# shotgun -o 0.0.0.0 -p 3000
require 'bundler'
require_relative 'models/coupon.rb'
Bundler.require

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end
   get '/submission' do
      erb :submission
   end
   
  post '/submission' do
    
     puts params
     Cutepun = Coupon.new(params[:coupon_name], params[:store_name], params[:firstname], params[:exp_date], params[:type], params[:description])
     Cutepun2 = Coupon.new(params[:coupon_name1], params[:store_name1], params[:firstname1], params[:exp_date1], params[:type], params[:description1])
     Cutepun3 = Coupon.new(params[:coupon_name2], params[:store_name2], params[:firstname2], params[:exp_date2], params[:type], params[:description2])
#      Coupon.alphabet
#      Coupon.expiration
#      Coupon.store
#      Coupon.sort_dollar
#      Coupon.sort_percent
     erb :view_coupons
 end
   
#    post '/submission' do  
#    Coupon.alphabet
#       erb :organize
# end

   
#    get '/organize' do  
#    Coupon.alphabet
#       erb :organize
#    end
   
   
   

#   post '/view_coupons' do
#      puts params
#      Cutepun = Coupon.new(params[:coupon_name], params[:store_name], params[:firstname], params[:exp_date], params[:type], params[:description])
     
#     erb :view_coupons

#   end
   
#    get '/view_coupons' do
    
#     erb :view_coupons

#    end
  
   
   
   
  get '/puns' do
    erb :puns
  end
end
