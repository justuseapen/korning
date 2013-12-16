class AddEmployeeIdToSalesTable < ActiveRecord::Migration
  def up
  	add_column :sales, :employee_id, :integer
  	Sale.all.each do |sale|
  		if sale.employee_id.blank?
  			strings = sale.employee.split
  			#^Should return ["FirstName","LastName","(Email@InParentheses.com)"]
  			email = strings[2]
  			employee = Employee.find_by(email: email)
  			sale.employee_id = employee.id
  			sale.save
  		end
  	end
  end
  def down
  	remove_column :sales, :employee_id
  end
end
