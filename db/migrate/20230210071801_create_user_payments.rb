class CreateUserPayments < ActiveRecord::Migration[7.0]
  def change
    create_table :user_payments do |t|
      t.references :user, null: false, foreign_key: true
      t.string :payment_type
      t.string :privider
      t.string :account_no

      t.timestamps
    end
  end
end
