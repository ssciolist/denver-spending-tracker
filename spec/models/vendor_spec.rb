require 'rails_helper'

describe Vendor, type: :model do
  describe 'Validations' do
    it 'is invalid without any attributes' do
      vendor = Vendor.new
      expect(vendor).to be_invalid
    end

    it 'is invalid without a state' do
      vendor = Vendor.new(name: 'Benny Blancos')
      expect(vendor).to be_invalid
    end

    it 'is invalid without a name' do
      vendor = Vendor.new(state: 'CO')
      expect(vendor).to be_invalid
    end

    it 'is valid with a name and state' do
      vendor = Vendor.new(name: 'Benny Blancos', state: 'CO')
      expect(vendor).to be_valid
    end
  end

  describe 'Relationships' do
    skip { should have_many(:programs) }
    skip { should have_many(:transactions) }
  end
end
