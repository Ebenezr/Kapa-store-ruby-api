class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :status
      t.references :address, null: false, foreign_key: true
      t.references :user_payment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
