class Category < ApplicationRecord
  self.table_name = "categories"
  has_many :items
end
