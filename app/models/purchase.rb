class Purchase < ActiveRecord::Base
  validates :transaction_date,
            :payment_date,
            :description,
            :amount,
            presence: true
  validates_associated :program_vendor_purchases
  
  has_many :program_vendor_purchases
  has_many :vendors, through: :program_vendor_purchases
  has_many :programs, through: :program_vendor_purchases

  accepts_nested_attributes_for :program_vendor_purchases

  def show_vendor
    vendors.limit(1).take
  end

  def show_program
    programs.limit(1).take
  end
end
