class Purchase < ActiveRecord::Base
  validates :transaction_date,
            :payment_date,
            :description,
            :amount,
            presence: true
  has_many :program_vendor_purchases
  has_many :vendors, through: :program_vendor_purchases
  has_many :programs, through: :program_vendor_purchases
end
