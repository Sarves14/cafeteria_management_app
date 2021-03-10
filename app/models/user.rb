class User < ApplicationRecord
  validates :first_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  has_secure_password
  has_many :carts
  has_many :orders

  def to_pleasant_string
    "#{id} #{first_name} #{email}"
  end
end
