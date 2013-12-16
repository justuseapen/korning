class RemoveProductFromSalesTable < ActiveRecord::Migration
  def change
  	remove_column :sales, :product_name
  end
end
