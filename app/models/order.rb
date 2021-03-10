class Order < ApplicationRecord
  belongs_to :users
  def self.get_orders(first_name, from, to)
    if first_name != "all"
      user = User.find_by(first_name: first_name)
      where("user_id = ? and ordered_time >= ? and ordered_time <= ?", user.id, from, to)
    else
      where("ordered_time >= ? and ordered_time <= ?", from, to)
    end
  end
end
