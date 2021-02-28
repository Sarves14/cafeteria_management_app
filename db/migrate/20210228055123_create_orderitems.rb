class CreateOrderitems < ActiveRecord::Migration[6.1]
  def change
    create_table :orderitems do |t|
      t.bigint :order_id
      t.bigint :item_id
      t.integer :quantity
      t.timestamps
    end
  end
end
