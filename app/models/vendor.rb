class Vendor < ActiveRecord::Base
  has_many :program_vendor_purchases
  has_many :purchases, through: :program_vendor_purchases
  has_many :programs, through: :program_vendor_purchases
  validates :name, :state, presence: true
end
