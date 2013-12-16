class PopulateProducts < ActiveRecord::Migration
  def up
  	Sale.all.each do |sale|
  		product_name = sale.product_name
  		Product.find_or_create_by(product_name: product_name) do |p|
  			p.product_name = product_name
  			p.save
  		end
  	end
  end
  def down
  	Product.delete_all
  end
end
