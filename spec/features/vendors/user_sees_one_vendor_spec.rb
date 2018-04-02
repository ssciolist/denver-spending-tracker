require 'rails_helper'

describe 'User visits /vendor/:id' do
  scenario 'They see that vendor\'s information and all gov purchases' do
    vendor = Vendor.new(name: 'Benny Blancos', state: 'CO')
    program = Program.new(name: 'Denver Fire Department')
    purchase = Purchase.new(transaction_date: '4/16/2017',
                                  payment_date: '4/18/2018',
                                  description: 'Calzones',
                                  amount: 50.1)
    purchase_2 = Purchase.new(transaction_date: '6/16/2017',
                                  payment_date: '6/18/2018',
                                  description: 'Pizza with cheese',
                                  amount: 50.1)
    purchase_3 = Purchase.new(transaction_date: '12/16/2017',
                                  payment_date: '12/18/2018',
                                  description: 'Pepperoni pizza',
                                  amount: 50.1)
    program_vendor_purchases = ProgramVendorPurchase.create!(program: program, vendor: vendor, purchase: purchase)
    program_vendor_purchases = ProgramVendorPurchase.create!(program: program, vendor: vendor, purchase: purchase_2)
    program_vendor_purchases = ProgramVendorPurchase.create!(program: program, vendor: vendor, purchase: purchase_3)

    visit vendor_path(vendor)

    expect(page).to have_content(vendor.name)
    expect(page).to have_content(vendor.state)
    expect(page).to have_content(purchase.description)
    expect(page).to have_content(purchase.amount)
    expect(page).to have_content(purchase.transaction_date)
    expect(page).to have_content(purchase.payment_date)
    expect(page).to have_content(purchase.programs.first.name)
    expect(page).to have_content(purchase_2.description)
    expect(page).to have_content(purchase_2.amount)
    expect(page).to have_content(purchase_2.transaction_date)
    expect(page).to have_content(purchase_2.payment_date)
    expect(page).to have_content(purchase_2.programs.first.name)
    expect(page).to have_content(purchase_3.description)
    expect(page).to have_content(purchase_3.amount)
    expect(page).to have_content(purchase_3.transaction_date)
    expect(page).to have_content(purchase_3.payment_date)
    expect(page).to have_content(purchase_3.programs.first.name)
  end
end
