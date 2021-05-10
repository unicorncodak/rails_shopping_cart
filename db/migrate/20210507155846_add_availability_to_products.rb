class AddAvailabilityToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :availability, :integer, :default => 1
  end
end
