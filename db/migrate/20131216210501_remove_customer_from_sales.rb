class RemoveCustomerFromSales < ActiveRecord::Migration
  def change
  	remove_column :sales, :customer_and_account_no
  end
end
