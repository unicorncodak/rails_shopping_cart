class AddBrandsToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :brands, :string
  end
end
