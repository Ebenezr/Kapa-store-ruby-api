class CreateDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts do |t|
      t.string :description
      t.boolean :active
      t.float :discount_percentage

      t.timestamps
    end
  end
end
