require 'rails_helper'

describe 'Logged in user can go to their own page' do
  scenario 'they see all purchases that they flagged' do
    user = User.create!(username: 'Megan', password: 'pass')
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
    user.flags.create!(purchase: purchase2, user: user)
    user.flags.create!(purchase: purchase3, user: user)

    assert_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    expect(page).to have_content(purchase2.programs.first.name)
    expect(page).to have_content(purchase2.vendors.first.name)
    expect(page).to have_content(purchase2.description)
    expect(page).to have_content(purchase2.amount)
    expect(page).to have_content(purchase2.transaction_date)
    expect(page).to have_content(purchase2.payment_date)
  end
end
