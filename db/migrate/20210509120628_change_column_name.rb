class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :line_items, :checkout_id, :order_id
  end
end
