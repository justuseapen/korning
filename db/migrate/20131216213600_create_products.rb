class CreateProducts < ActiveRecord::Migration
  def up
    create_table :products do |t|
    	t.string :product_name
      t.timestamps
    end
  end
  def down
  	drop_table :products
  end
end
