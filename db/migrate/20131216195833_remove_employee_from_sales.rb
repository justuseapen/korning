class RemoveEmployeeFromSales < ActiveRecord::Migration
  def up
  	remove_column :sales, :employee
  end
  def down
  	#irreversible migration so...?
  	add_column :sales, :employee
  end
end
