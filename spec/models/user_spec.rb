require 'rails_helper'

describe User, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
  end

  describe 'Roles' do
    it 'can have an admin role' do
      admin = User.create!(username: 'Admin', password: 'pass', role: 1)

      expect(admin.role).to eq('admin')
      expect(admin.admin?).to be_truthy
    end

    it 'can be a regular user' do
      user = User.create!(username: 'User', password: 'word', role: 0)

      expect(user.role).to eq('user')
      expect(user.user?).to be_truthy
    end

    it 'will default to regular user' do
      user = User.create!(username: 'Megan', password: 'mypass')

      expect(user.role).to eq('user')
      expect(user.user?).to be_truthy
    end
  end
end
