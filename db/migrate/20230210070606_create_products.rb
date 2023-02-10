class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.decimal :rating
      t.float :price
      t.integer :inventory_id
      t.integer :discount_id
      t.integer :category_id

      t.timestamps
    end
  end
end
0
