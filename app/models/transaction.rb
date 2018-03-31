class Transaction < ActiveRecord::Base
  validates :transaction_date,
            :payment_date,
            :description,
            :amount,
            presence: true
end
