class ChangeColumnFromItems < ActiveRecord::Migration[6.1]
  def change
    change_column :items, :price, :decimal
  end
end
