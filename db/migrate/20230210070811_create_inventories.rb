class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.integer :product_id
      t.integer :quantity

      t.timestamps
    end
  end
end
