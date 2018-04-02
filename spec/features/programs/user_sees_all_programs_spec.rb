require 'rails_helper'

describe 'User visits /program/:id' do
  scenario 'They see that program\'s information and all gov purchases' do
    program = Program.create!(name: 'Denver Police Department')
    program2 = Program.create!(name: 'City Treasury')
    program3 = Program.create!(name: 'Parks and Rec')
    program4 = Program.create!(name: 'Public Works')

    visit program_path(program)

    expect(page).to have_content(program.name)
    expect(page).to have_link(program.name)
    expect(page).to have_content(program2.name)
    expect(page).to have_link(program2.name)
    expect(page).to have_content(program3.name)
    expect(page).to have_link(program3.name)
    expect(page).to have_content(program4.name)
    expect(page).to have_link(program4.name)
  end
end
