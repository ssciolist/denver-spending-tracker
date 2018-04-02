require 'rails_helper'

describe 'User visits /vendor/:id' do
  scenario 'They see that vendor\'s information and all gov purchases' do
    vendor = Vendor.new(name: 'Benny Blancos', state: 'CO')
    program = Program.new(name: 'Denver Fire Department')
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
    ProgramVendorPurchase.create!(program: program, vendor: vendor, purchase: purchase_2)
    ProgramVendorPurchase.create!(program: program, vendor: vendor, purchase: purchase_3)

    visit vendor_path(vendor)

    expect(page).to have_content(vendor.name)
    expect(page).to have_content(vendor.state)
    expect(page).to have_content(purchase.description)
    expect(page).to have_content(purchase.amount)
    expect(page).to have_content(purchase.transaction_date)
    expect(page).to have_content(purchase.payment_date)
    expect(page).to have_content(purchase.programs.first.name)
    expect(page).to have_content(purchase2.description)
    expect(page).to have_content(purchase2.amount)
    expect(page).to have_content(purchase2.transaction_date)
    expect(page).to have_content(purchase2.payment_date)
    expect(page).to have_content(purchase2.programs.first.name)
    expect(page).to have_content(purchase3.description)
    expect(page).to have_content(purchase3.amount)
    expect(page).to have_content(purchase3.transaction_date)
    expect(page).to have_content(purchase3.payment_date)
    expect(page).to have_content(purchase3.programs.first.name)
  end
end
