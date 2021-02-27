class User < ApplicationRecord
  has_secure_password
  has_many :carts

  def to_pleasant_string
    "#{id} #{first_name} #{email}"
  end
end
