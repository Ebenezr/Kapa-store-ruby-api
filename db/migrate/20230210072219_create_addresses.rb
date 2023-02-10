class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :county
      t.string :town
      t.string :station
      t.string :line1
      t.string :line2

      t.timestamps
    end
  end
end
