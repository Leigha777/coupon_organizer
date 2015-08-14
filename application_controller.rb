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
   
   post '/submission1' do
    
     puts params
     @cutepun = Coupon.new(params[:coupon_name], params[:store_name], params[:firstname], params[:exp_date], params[:type], params[:description])
     erb :submission1
 end
   
   
   post '/submission2' do 
       puts params
      @cutepun = params[:coupon]
      cute = @cutepun.split("/")
      @cutepun = Coupon.new(cute[0], cute[1], cute[2], cute[3], cute[4], cute[5])
    @cutepun1 = Coupon.new(params[:coupon_name], params[:store_name], params[:firstname], params[:exp_date], params[:type], params[:description])
      erb :submission2
end
   post '/view_coupons' do 
       puts params
    @cutepun = params[:coupon]
      cute = @cutepun.split("/")
      @cutepun = Coupon.new(cute[0], cute[1], cute[2], cute[3], cute[4], cute[5])
    @cutepun1 = params[:coupon1]
      cute1 = @cutepun1.split("/")
      @cutepun1 = Coupon.new(cute1[0], cute1[1], cute1[2], cute1[3], cute1[4], cute1[5])
    @cutepun2 = Coupon.new(params[:coupon_name], params[:store_name], params[:firstname], params[:exp_date], params[:type], params[:description])
      erb :view_coupons
end
   
   post '/view_coupon2' do 
       puts params
    @cutepun = params[:coupon]
      cute = @cutepun.split("/")
      @cutepun = Coupon.new(cute[0], cute[1], cute[2], cute[3], cute[4], cute[5])
       @cutepun1 = Coupon.new(params[:coupon_name], params[:store_name], params[:firstname], params[:exp_date], params[:type], params[:description])
      erb :view_coupons
   end
   
  
      
   get '/submission1' do
      erb :return2
   end
   get '/submission2' do
      erb :return
   end
   
   
   

#   post '/view_coupons' do
#      puts params
#      Cutepun = Coupon.new(params[:coupon_name], params[:store_name], params[:firstname], params[:exp_date], params[:type], params[:description])
     
#     erb :view_coupons

#   end
   
   get '/view_coupons' do
    
      erb :return

   end
  
   
   
   
  get '/puns' do
    erb :puns
  end
end
