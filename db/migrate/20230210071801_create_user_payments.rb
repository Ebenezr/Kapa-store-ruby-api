class CreateUserPayments < ActiveRecord::Migration[7.0]
  def change
    create_table :user_payments do |t|
      t.integer :user_id
      t.string :payment_type
      t.string :privider
      t.string :account_no

      t.timestamps
    end
  end
end
