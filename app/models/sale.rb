class Sale < ActiveRecord::Base
	belongs_to :customers
  belongs_to :employees
  belongs_to :products
end
