class Program < ActiveRecord::Base
  validates :name, presence: true
  has_many :program_vendor_purchases
  has_many :purchases, through: :program_vendor_purchases
  has_many :vendors, through: :program_vendor_purchases
end
