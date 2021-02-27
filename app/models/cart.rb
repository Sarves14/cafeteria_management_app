class Cart < ApplicationRecord
  belongs_to :users, optional: true
  has_many :items
end
