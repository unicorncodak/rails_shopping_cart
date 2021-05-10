class ChangeDataTypeForCategoryId < ActiveRecord::Migration[6.1]
  def up
    change_column :products, :category_id, :string
  end

  def down
      change_column :products, :category_id, :integer
  end
end
