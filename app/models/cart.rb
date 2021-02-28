class Cart < ApplicationRecord
  belongs_to :users, optional: true
  has_many :items

  def self.find_items(user_id)
    where("user_id = ?", user_id)
  end
  def self.total_cost(cart_items)
    total_cost = 0
    cart_items.each do |cart_item|
      total_cost = total_cost + (cart_item.item_quantity * Item.find(cart_item.item_id).price)
    end
    total_cost
  end
end
