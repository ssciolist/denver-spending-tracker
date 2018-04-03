require 'rails_helper'

describe 'User visits purchase index page' do
  context 'as an admin' do
    it 'allows admin to see all purchases' do
      admin = User.create!(username: 'Admin', password: 'pass', role: 1)
      program = Program.new(name: 'Denver Fire Department')
      vendor = Vendor.new(name: 'Benny Blancos', state: 'CO')
      vendor2 = Vendor.new(name: 'Pizza Hut', state: 'CO')
      vendor3 = Vendor.new(name: 'Dominos', state: 'CO')
      purchase = Purchase.new(transaction_date: '4/16/2017',
                              payment_date: '4/18/2018',
                              description: 'Calzones',
                              amount: 50.1)
      purchase2 = Purchase.new(transaction_date: '6/16/2017',
                               payment_date: '6/18/2018',
                               description: 'Pizza with cheese',
                               amount: 50.1)
      purchase3 = Purchase.new(transaction_date: '12/16/2017',
                               payment_date: '12/18/2018',
                               description: 'Pepperoni pizza',
                               amount: 50.1)
      ProgramVendorPurchase.create!(program: program, vendor: vendor, purchase: purchase)
      ProgramVendorPurchase.create!(program: program, vendor: vendor2, purchase: purchase2)
      ProgramVendorPurchase.create!(program: program, vendor: vendor3, purchase: purchase3)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path
      expect(page).to have_content(purchase.vendors.first.name)
      expect(page).to have_content(purchase2.vendors.first.name)
      expect(page).to have_content(purchase3.vendors.first.name)
    end
  end
end