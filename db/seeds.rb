require 'csv'
require 'chronic'

datafile = Rails.root + 'db/data/sales.csv'

CSV.foreach(datafile, headers: true) do |row|
  Sale.find_or_create_by(invoice_no: row['invoice_no']) do |sale|
    sale.employee = row['employee']
    sale.customer_and_account_no = row['customer_and_account_no']
    sale.product_name = row['product_name']
    sale.sale_date = Chronic.parse(row['sale_date'])
    sale.sale_amount = row['sale_amount'].to_f
    sale.units_sold = row['units_sold'].to_i
    sale.invoice_no = row['invoice_no'].to_i
    sale.invoice_frequency = row['invoice_frequency']

    puts "Sale with invoice no. #{sale.invoice_no} processed"
  end
end
