require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
CSV.foreach('data/ProcurementCard_2017_dupe.csv', headers: true, header_converters: :symbol) do |row|
  vendor = (Vendor.create(name: row[:merchant_name], state: row[:merchant_state]) unless Vendor.find_by_name(row[:merchant_name])) || Vendor.find_by_name(row[:merchant_name])
  program = (Program.create(name: row[:program_area]) unless Program.find_by_name(row[:program_area])) || Program.find_by_name(row[:program_area])
  purchase = Purchase.create!(transaction_date: row[:transaction_date], payment_date: row[:payment_date], description: row[:item_description], amount: row[:transaction_amount])
  ProgramVendorPurchase.create(purchase_id: purchase.id, program_id: program.id, vendor_id: vendor.id)
end
