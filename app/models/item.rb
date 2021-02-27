class Item < ApplicationRecord
  belongs_to :categories, optional: true
  belongs_to :carts, optional: true
end
