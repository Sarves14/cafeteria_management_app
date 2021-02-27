class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :item_name
      t.bigint :category_id
      t.integer :price
      t.timestamps
    end
  end
end
