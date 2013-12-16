class AddCustomerIdToSalesTable < ActiveRecord::Migration
  def up
  	add_column :sales, :customer_id, :integer
  	Sale.all.each do |sale|
  		if sale.customer_id.blank?
  			strings = sale.customer_and_account_no.split
  			acct_number = strings[1].gsub("(","")
  			acct_number = acct_number.gsub(")","")
  			customer = Customer.find_by(acct_no: acct_number)
  			sale.customer_id = customer.id
  			sale.save
  		end
  	end
  end
  def down
  	remove_column :sales, :customer_id
  end
end
