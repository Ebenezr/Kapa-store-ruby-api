class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :county
      t.string :town
      t.string :station
      t.string :line1
      t.string :line2

      t.timestamps
    end
  end
end
