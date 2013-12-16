class PopulateCustomers < ActiveRecord::Migration
  def up
  	Sale.all.each do |sale|
  		strings = sale.customer_and_account_no.split
  		company_name = strings[0]
  		acct_number = strings[1].gsub("(","")
  		acct_number = acct_number.gsub(")","")  			
  		Customer.find_or_create_by(acct_no: acct_number) do |c|
  			c.acct_no = acct_number
  			c.company = company_name
  			c.save
  		end
  	end
  end
  def down
  	Customer.delete_all
  end
end
