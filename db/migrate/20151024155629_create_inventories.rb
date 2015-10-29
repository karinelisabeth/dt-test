class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :sku
      t.string :name
      t.string :manufacturer
      t.float :cost
      t.float :weight
      t.integer :stock

      t.timestamps null: false
    end
  end
end
