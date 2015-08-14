# require 'date'


class Coupon
    @@coupon_just_names = []
    @@coupon_by_name = {}
    @@coupon_by_store = {}
    @@coupon_by_expiration = {}
    @@coupon_by_discount = {
       :percent => {},
       :dollars_off => {},
       :miscellaneous => {} # for like buy one get one free or stuff like that
         }
   @@coupon_by_type = {
       :food => {},
       :clothing => {},
       :electronics => {},
       :supplies => {},
       :funiture => {},
       :cosmetic => {},
       :other => {}
      }
   
   attr_reader :type, :store, :discount_amount, :expiration_date, :alphabetical, :by_store, :discount, :expiration, :name, :description
   
   
   def Coupon.list
      @@coupon_just_names
   end
   def Coupon.coupon_by_name
      @@coupon_by_name
   end
   def Coupon.coupon_by_store
      @@coupon_by_store
   end
   def Coupon.coupon_by_expiration
      return @@coupon_by_expiration
   end
  def Coupon.coupon_by_type
    return @@coupon_by_type
  end
   
   
   def Coupon.coupon_by_discount
#       return " Percent: #{@@coupon_by_discount[:percent].sort_by { |discount, info| discount }}
#                Dollars off: #{@@coupon_by_discount[:dollars_off].sort_by { |discount, info| discount }}
#                Miscellaneous: #{@@coupon_by_discount[:miscellaneous]}"

#       string = @@coupon_by_discount[:percent].sort_by { |discount, info| discount }
      @@coupon_by_discount[:percent].each do |discount, info| #why doesn't this print everything out? 
          "Percent: " + discount.to_s + "\n" + info
      end    # if you put in return it will end the cycle and would only print one line
   end
   
   def Coupon.sort_percent
      @@coupon_by_discount[:percent].sort_by do |discount, info| 
         discount
      end
   end
   
   
   def Coupon.sort_dollar
      @@coupon_by_discount[:dollars_off].sort_by do |discount, info| 
         discount
      end
   end
#    Hash[h.sort_by{|k, v| v}.reverse]
   def Coupon.expiration
      @@coupon_by_expiration.sort_by { |date, info| date }
   end
   def Coupon.alphabet
      @@coupon_by_name.sort_by { |name, info| name }
   end #AHHHH IT WORKS THIS IS FOR SUREEE
   def Coupon.store
      @@coupon_by_store.sort_by { |store, info| store }
   end
   
   def initialize(name, store, discount_amount, expiration_date, type = "Other", description = "none")
      @name = name
      @store = store 
      @discount_amount = discount_amount
      @expiration_date = expiration_date
      @type = type
      @description = description
         
      @@coupon_just_names << name
      @@coupon_by_name[name] = display_everything
      @@coupon_by_store[store] = display_everything
      @@coupon_by_expiration[expiration_date] = display_everything
      
      
      if type == "Food"
         @@coupon_by_type[:food][type] = display_everything
      elsif type == "Clothing"
         @@coupon_by_type[:clothing][type] = display_everything
      elsif type == "Electronics"
         @@coupon_by_type[:electronics][type] = display_everything
      elsif type == "Office Supplies"
         @@coupon_by_type[:supplies][type] = display_everything
      elsif type == "Furniture"
         @@coupon_by_type[:furniture][type] = display_everything
      elsif type == "Cosmetic"
         @@coupon_by_type[:cosmetic][type] = display_everything
      else
         @@coupon_by_type[:other][type] = display_everything
      end
      
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
      return "  Coupon name: #{@name};
  Store: #{@store};
  Discount Amount: #{@discount_amount};
  Expiration Date: #{@expiration_date};
  Type: #{@type};
  Other Descriptions: #{@description}"
   end
#    def make_a_date
#       @expiration_date = @@date
#       @@date = Date.parse
#    end

   

   
end


# Michaels = Coupon.new("paint", "Michaels", "20%", "1997/02/09", "Food")
# Target = Coupon.new("dogs", "Target", "$3", "2007/02/09", "Other")  
# Best = Coupon.new("best", "bestbuy", "4%", "2019/12/2", "Other")
# Waywward = Coupon.new("nice", "Wa", "$13", "1997/12/02", "Electronics")
# Awall = Coupon.new("aayywa", "Craycray", "12%", "1923/12/03", "Office Supplies")

# puts Coupon.coupon_by_name
# puts Coupon.coupon_by_name
# puts Target.expiration_date

# puts Coupon.coupon_by_discount
# puts Coupon.sort_percent
# puts Coupon.sort_dollar
# puts Coupon.coupon_by_discount
# puts Coupon.alphabet
# puts Coupon.store

#Coupon.organization("discount")
#puts Coupon.coupon_by_discount
#
# puts Coupon.sort1
#puts Coupon.alphabet

# d = Date.parse('3rd Feb 2001')
# puts d.year
# puts Michaels.make_a_date.year

#puts Coupon.alphabet
#puts Coupon.expiration
