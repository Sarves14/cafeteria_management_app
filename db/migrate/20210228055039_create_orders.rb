class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.bigint :user_id
      t.decimal :price
      t.datetime :ordered_time
      t.datetime :delivered_time
      t.timestamps
    end
  end
end
