require 'rails_helper'

describe 'Visitor visits create account page' do
  context 'they complete and submit new item form correctly' do
    skip 'they can become a credentialed user' do
      visit new_user_path

      fill_in 'Username', :with => 'Jake'
      fill_in 'Email', :with => 'Jake@mail.com'
      fill_in 'Password', :with => 'mypassword'
      fill_in 'Password confirmation', :with => 'mypassword'

      expect(current_path).to eq(user_path(User.last))
    end
  end
end
