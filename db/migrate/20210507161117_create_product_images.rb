class CreateProductImages < ActiveRecord::Migration[6.1]
  def change
    create_table :product_images do |t|
      t.string :image
      t.integer :product_id

      t.timestamps
    end
  end
end
