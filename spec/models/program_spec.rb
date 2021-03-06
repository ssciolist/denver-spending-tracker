require 'rails_helper'

describe Program, type: :model do
  describe 'Validations' do
    it 'is invalid without any attributes' do
      program = Program.new
      expect(program).to be_invalid
    end

    it 'is valid with a name' do
      program = Program.new(name: 'Fire Department')
      expect(program).to be_valid
    end
  end

  describe 'Relationships' do
    it { should have_many(:vendors) }
    it { should have_many(:purchases) }
  end
end
