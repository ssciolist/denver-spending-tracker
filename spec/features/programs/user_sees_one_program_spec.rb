require 'rails_helper'

describe 'User visits /program/:id' do
  scenario 'They see that program\'s information and all its purchases' do
    program = Program.create!(name: 'Denver Fire Department')
    vendor = Vendor.create!(name: 'Benny Blancos', state: 'CO')
    vendor2 = Vendor.create!(name: 'Pizza Hut', state: 'CO')
    vendor3 = Vendor.create!(name: 'Dominos', state: 'CO')
    purchase = Purchase.create!(transaction_date: '4/16/2017',
                            payment_date: '4/18/2018',
                            description: 'Calzones',
                            amount: 50.1)
    purchase2 = Purchase.create!(transaction_date: '6/16/2017',
                             payment_date: '6/18/2018',
                             description: 'Pizza with cheese',
                             amount: 50.1)
    purchase3 = Purchase.create!(transaction_date: '12/16/2017',
                             payment_date: '12/18/2018',
                             description: 'Pepperoni pizza',
                             amount: 50.1)
    ProgramVendorPurchase.create!(program: program, vendor: vendor, purchase: purchase)
    ProgramVendorPurchase.create!(program: program, vendor: vendor2, purchase: purchase2)
    ProgramVendorPurchase.create!(program: program, vendor: vendor3, purchase: purchase3)

    visit program_path(program)

    expect(page).to have_content(program.name)
    expect(page).to have_content(purchase.description)
    expect(page).to have_content(purchase.amount)
    expect(page).to have_content(purchase.transaction_date)
    expect(page).to have_content(purchase.payment_date)
    expect(page).to have_content(purchase.vendors.first.name)
    expect(page).to have_content(purchase2.description)
    expect(page).to have_content(purchase2.amount)
    expect(page).to have_content(purchase2.transaction_date)
    expect(page).to have_content(purchase2.payment_date)
    expect(page).to have_content(purchase2.vendors.first.name)
    expect(page).to have_content(purchase3.description)
    expect(page).to have_content(purchase3.amount)
    expect(page).to have_content(purchase3.transaction_date)
    expect(page).to have_content(purchase3.payment_date)
    expect(page).to have_content(purchase3.vendors.first.name)
  end
end
