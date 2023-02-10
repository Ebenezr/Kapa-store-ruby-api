class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :status
      t.integer :address_id
      t.integer :user_payment_id

      t.timestamps
    end
  end
end
