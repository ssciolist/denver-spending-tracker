require 'rails_helper'

describe Purchase, type: :model do
  describe 'Validations' do
    it 'is invalid without a purchase date' do
      purchase = Purchase.new(transaction_date: '12/18/2018',
                                    description: 'zebra pens, bic pens',
                                    amount: 50.1)
      expect(purchase).to be_invalid
    end

    it 'is invalid without a payment date' do
      purchase = Purchase.new(transaction_date: '12/16/2017',
                                    description: 'zebra pens, bic pens',
                                    amount: 50.1)
      expect(purchase).to be_invalid
    end

    it 'is invalid without a description' do
      purchase = Purchase.new(transaction_date: '12/16/2017',
                                    payment_date: '12/18/2018',
                                    amount: 50.1)
      expect(purchase).to be_invalid
    end

    it 'is invalid without an amount' do
      purchase = Purchase.new(transaction_date: '12/16/2017',
                                    payment_date: '12/18/2018',
                                    description: 'zebra pens, bic pens')
      expect(purchase).to be_invalid
    end

    it 'is valid w/ a purchase date, payment date, description, & amount' do
      purchase = Purchase.new(transaction_date: '12/16/2017',
                                    payment_date: '12/18/2018',
                                    description: 'zebra pens, bic pens',
                                    amount: 50.1)
      expect(purchase).to be_valid
    end
  end

  describe 'Relationships' do
    it { should have_many(:vendors) }
    it { should have_many(:programs) }
  end

  describe 'Methods' do
    it '.show_vendor' do
      vendor = Vendor.new(name: 'Benny Blancos', state: 'CO')
      program = Program.new(name: 'Denver Fire Department')
      purchase = Purchase.new(transaction_date: '4/16/2017',
                              payment_date: '4/18/2018',
                              description: 'Calzones',
                              amount: 50.1)
      ProgramVendorPurchase.create!(program: program, vendor: vendor, purchase: purchase)

      expect(purchase.show_vendor).to eq(vendor)
    end

    it '.show_program' do
      vendor = Vendor.new(name: 'Benny Blancos', state: 'CO')
      program = Program.new(name: 'Denver Fire Department')
      purchase = Purchase.new(transaction_date: '4/16/2017',
                              payment_date: '4/18/2018',
                              description: 'Calzones',
                              amount: 50.1)
      ProgramVendorPurchase.create!(program: program, vendor: vendor, purchase: purchase)

      expect(purchase.show_program).to eq(program)
    end
  end
end
