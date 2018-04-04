require 'rails_helper'

describe 'User visits new purchase page' do
  context 'as an admin' do
    it 'allows admin to add a purchase' do
      admin = User.create!(username: 'Admin', password: 'pass', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_purchase_path

      fill_in 'purchase[transaction_date]', with: '12/12/2016'
      fill_in 'purchase[payment_date]', with: '12/15/2016'
      fill_in 'purchase[amount]', with: '50'
      fill_in 'purchase[description]', with: 'A cool toy'
      select 'Denver Police Department', from: 'purchase[program]'
      select 'Nintendo', from: 'purchase[vendor]'

      click_button 'Create new purchase'

      purchase = Purchase.last

      expect(current_path).to eq(admin_purchases_path)
      expect(page).to have_content(purchase.show_vendor.name)
      expect(page).to have_content(purchase.show_program.name)
      expect(page).to have_content(purchase.description.name)
      expect(page).to have_content(purchase.amount.name)
      expect(page).to have_content(purchase.transaction_date.name)
      expect(page).to have_content(purchase.payment_date.name)
    end
  end

  context 'as a default user' do
    it 'does not allow default user to see admin purchase form' do
      user = User.create(username: 'Megan', password: 'OliolioO')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_admin_purchase_path

      expect(page).to_not have_content('Create a transaction')
      expect(page).to have_content('The page you were looking for doesn\'t exist')
    end
  end
end
