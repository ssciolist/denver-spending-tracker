require 'rails_helper'

describe 'User visits the homepage' do
  scenario 'they can log into their account' do
    user = User.create(username: 'Marglargbot', password: 'test')

    visit '/'

    click_on 'Log in'

    expect(current_path).to eq(login_path)
    fill_in 'username', with: user.username
    fill_in 'password', with: user.password

    click_on 'Log me in'

    expect(current_path).to eq(user_path(user))

    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to have_content('Log out')
  end
end
