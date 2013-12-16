class AddProductIdToSales < ActiveRecord::Migration
  def up
  	add_column :sales, :product_id, :integer
  	Sale.all.each do |sale|
  		if sale.product_id.blank?
  			product_name = sale.product_name
  			product = Product.find_by(product_name: product_name)
  			sale.product_id = product.id
  			sale.save
  		end
  	end
  end
  def down
  	remove_column :sales, :product_id
  end
end
