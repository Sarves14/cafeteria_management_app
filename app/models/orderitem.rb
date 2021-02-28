class Orderitem < ApplicationRecord
  def self.insert_order(order_id, cart_items)
    cart_items.each do |cart_item|
      create!(order_id: order_id, item_id: cart_item.item_id, quantity: cart_item.item_quantity)
    end
  end
end
