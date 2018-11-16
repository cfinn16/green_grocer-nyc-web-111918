require "pry"
def consolidate_cart(cart)
  new_cart = {}
  cart.each do |item|
    item.each do |item_name, item_data|
      if new_cart[item_name].nil?
        new_cart[item_name] = item_data
        new_cart[item_name][:count] = 1
      else 
        new_cart[item_name][:count] += 1
      end
    end
  end
  new_cart
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon_hash|
    item = coupon_hash[:item]
    if cart.keys.include?(item) && cart[item][:count] >= coupon_hash[:num]
      cart[item][:count] -= coupon_hash[:num]
      discounted_item = "#{coupon_hash[:item]} W/COUPON"
      if cart[discounted_item].nil?
        cart[discounted_item] = {}
        cart[discounted_item][:price] = coupon_hash[:cost]
        cart[discounted_item][:clearance] = cart[item][:clearance] 
        cart[discounted_item][:count] = 1
       else
         cart[discounted_item][:count] += 1
      end
    end
  end
  cart
end

def apply_clearance(cart)
  cart.map do |item, data|
    if data[:clearance] == true 
      cart[item][:price] *= 0.8
    end
    cart[item][:price] = cart[item][:price].round(1)
  end
  cart
end

def checkout(cart, coupons)
  total = 0 
  
  
  clearanced_cart.flatten
end
