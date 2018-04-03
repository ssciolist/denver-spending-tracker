require 'rails_helper'

describe 'User visits the home page' do
  scenario 'they can sign up to be a user' do
    visit '/'

    click_on 'sign up'

    expect(current_path).to eq(new_user_path)

    fill_in 'user[username]', with: 'Marglargbot'
    fill_in 'user[password]', with: 'test'

    click_on 'Create User'

    expect(page).to have_content('Welcome, Marglargbot')
  end
end
