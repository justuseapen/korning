class CreateCustomers < ActiveRecord::Migration
  def up
    create_table :customers do |t|
      t.string :company
      t.string :acct_no
      t.string :website
      t.timestamps
    end
  end
  def down
  	drop_table :customers
  end
end
