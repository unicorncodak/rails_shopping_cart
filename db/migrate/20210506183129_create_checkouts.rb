class CreateCheckouts < ActiveRecord::Migration[6.1]
  def change
    create_table :checkouts do |t|
      t.string :firstname
      t.string :lastname
      t.string :address
      t.string :state
      t.string :country
      t.integer :guest

      t.timestamps
    end
  end
end
