require 'date'
class Coupon
    @@coupon_just_names = []
    @@coupon_by_name = {}
    @@coupon_by_store = {}
    @@coupon_by_expiraton = {}
    @@coupon_by_discount = {
       :percent => {},
       :dollars_off => {},
       :miscellaneous => {} # for like buy one get one free or stuff like that
         }
   @@coupon_by_discount_only = {} #i think it would be better to organize it by the type of discount but i don't know how to order that by amount
   
   attr_reader :type, :store, :discount_amount, :expiration_date, :alphabetical, :by_store, :discount, :expiration,
   def Coupon.list
      @@coupon_just_names
   end
   def Coupon.coupon_by_name
      @@coupon_by_name
   end
   def Coupon.coupon_by_store
      @@coupon_by_store
   end
   def Coupon.coupon_by_expiraton
      return @@coupon_by_expiraton
   end
   def Coupon.coupon_by_discount_only
      @@coupon_by_discount_only
   end
   
   
   def Coupon.coupon_by_discount
#       return " Percent: #{@@coupon_by_discount[:percent].sort_by { |discount, info| discount }}
#                Dollars off: #{@@coupon_by_discount[:dollars_off].sort_by { |discount, info| discount }}
#                Miscellaneous: #{@@coupon_by_discount[:miscellaneous]}"

#       string = @@coupon_by_discount[:percent].sort_by { |discount, info| discount }
      @@coupon_by_discount[:percent].each do |discount, info| #why doesn't this print everything out? 
         return "Percent: " + discount.to_s + "=" + info
      end
      
   end
   
   def Coupon.sort
      @@coupon_by_discount_only.sort_by { |discount, info| discount } #deletes things that share the same value and only keeps one of them
   end
   def Coupon.sort1
      @@coupon_by_discount[:percent].sort_by { |discount, info| discount }
   end
   def Coupon.alphabet
      @@coupon_by_name.sort_by { |name, info| name }
   end #AHHHH IT WORKS THIS IS FOR SUREEE
   
   def initialize(name, store, discount_amount, expiration_date, description = "none")
      @name = name
      @store = store 
      @discount_amount = discount_amount
      @expiration_date = expiration_date
      @description = description
#       @@coupon_by_name << @name
#       @@coupon_by_store << @store
#       @@coupon_by_expiraton << @expiration_date
#       if discount_amount.include? "%"
#          @@coupon_by_discount[:percent] << @discount_amount
#       elsif discount_amount.include? "$"
#          @@coupon_by_discount[:dollars_off] << @discount_amount
#       else
#          @@coupon_by_discount[:miscellaneous] << @discount_amount
#       end
      @@coupon_just_names << name
      @@coupon_by_name[name] = display_everything
      @@coupon_by_store[store] = display_everything
      @@coupon_by_expiraton[expiration_date] = display_everything
      @@coupon_by_discount_only[discount_amount.to_f] = display_everything
      if discount_amount.include? "%"
         @@coupon_by_discount[:percent][discount_amount.to_f] = display_everything
      elsif discount_amount.include? "$"
         discount_amount = discount_amount.delete "$"
         @@coupon_by_discount[:dollars_off][discount_amount.to_f] = display_everything
      else
         @@coupon_by_discount[:miscellaneous][discount_amount.to_f] = display_everything
      end
      
   end
   def organization(type)
   if type == "discount"
      @@coupon_by_discount.sort_by { |k, v| v[:percent] }
   end
end
   @@date = nil
   def display_everything
      return "  Coupon name: #{@name}
  Store: #{@store}
  Discount Amount: #{@discount_amount}
  Expiration Date: #{@expiration_date}
  Other Discriptions: #{@description}"
   end
   def make_a_date
      @expiration_date = @@date
      @@date = Date.parse
   end

   

   
end


Michaels = Coupon.new("paint", "Michaels", "20%", "3 Feb 2014")
#puts Michaels.display_everything
Target = Coupon.new("dogs", "Target", "$3", "April") #why is this displayed as a ZERO?????? 
Best = Coupon.new("best", "bestbuy", "4%", "May")
Waywward = Coupon.new("nice", "Wa", "$13", "Tomorrow")
Awall = Coupon.new("aayywa", "Craycray", "12%", "Monday")
#Target.compiling("Discount (dollars)")
#Michaels.compiling("Discount (percent)")
#puts Coupon.coupon_by_name
#puts Coupon.coupon_by_name
# puts Target.expiration_date

#Coupon.organization("discount")
#puts Coupon.coupon_by_discount
# puts Coupon.sort1
######puts Coupon.alphabet

d = Date.parse('3rd Feb 2001')
puts d.year
puts Michaels.make_a_date.year

