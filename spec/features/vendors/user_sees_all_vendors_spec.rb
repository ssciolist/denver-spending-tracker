require 'rails_helper'

describe 'User visits /vendor/:id' do
  scenario 'They see that vendor\'s information and all gov purchases' do
    vendor = Vendor.new(name: 'Benny Blancos', state: 'CO')
    vendor_2 = Vendor.new(name: 'Utah Brewing Co.', state: 'UT')
    vendor_3 = Vendor.new(name: 'Mitt Romney Inc.', state: 'MA')
    vendor_4 = Vendor.new(name: 'In-and-Out', state: 'CA')

    visit vendors_path

    expect(page).to have_content(vendor.name)
    expect(page).to have_link(vendor.name)
    expect(page).to have_content(vendor_2.name)
    expect(page).to have_link(vendor_2.name)
    expect(page).to have_content(vendor_3.name)
    expect(page).to have_link(vendor_3.name)
    expect(page).to have_content(vendor_4.name)
    expect(page).to have_link(vendor_4.name)
  end
end
