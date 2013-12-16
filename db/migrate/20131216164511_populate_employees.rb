class PopulateEmployees < ActiveRecord::Migration
  def up
  	Sale.all.each do |sale|
  		strings = sale.employee.split
  		name = strings[0]+" "+strings[1]
  		email = strings[2]
			Employee.find_or_create_by(email: email) do |e|
				e.name = name
				e.email = email
			end
		end
  end
  def down
  	Employee.delete_all
  end
end
