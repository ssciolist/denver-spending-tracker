require 'rails_helper'

describe Transaction, type: :model do
  describe 'Validations' do
    it 'is invalid without a transaction date' do
      transaction = Transaction.new(payment_date: '12/18/2018',
                                    description: 'zebra pens, bic pens',
                                    amount: 50.1)
      expect(transaction).to be_invalid
    end

    it 'is invalid without a payment date' do
      transaction = Transaction.new(transaction_date: '12/16/2017',
                                    description: 'zebra pens, bic pens',
                                    amount: 50.1)
      expect(transaction).to be_invalid
    end

    it 'is invalid without a description' do
      transaction = Transaction.new(transaction_date: '12/16/2017',
                                    payment_date: '12/18/2018',
                                    amount: 50.1)
      expect(transaction).to be_invalid
    end

    it 'is invalid without an amount' do
      transaction = Transaction.new(transaction_date: '12/16/2017',
                                    payment_date: '12/18/2018',
                                    description: 'zebra pens, bic pens')
      expect(transaction).to be_invalid
    end

    it 'is valid w/ a transaction date, payment date, description, & amount' do
      transaction = Transaction.new(transaction_date: '12/16/2017',
                                    payment_date: '12/18/2018',
                                    description: 'zebra pens, bic pens',
                                    amount: 50.1)
      expect(transaction).to be_valid
    end
  end

  describe 'Relationships' do
    skip { should belong_to(:vendors) }
    skip { should belong_to(:programs) }
  end
end
