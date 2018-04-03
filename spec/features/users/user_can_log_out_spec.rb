require 'rails_helper'

describe 'User visits their account' do
  scenario 'they can log out of their account' do
    user = User.create(username: 'Marglargbot', password: 'test')

    visit login_path

    fill_in 'username', with: user.username
    fill_in 'password', with: user.password
    click_on 'Log me in'

    expect(current_path).to eq(user_path(user))

    click_on 'Log out'

    expect(current_path).to eq(root_path)
    expect(page).to_not have_content('Marglargbot')
  end
end
