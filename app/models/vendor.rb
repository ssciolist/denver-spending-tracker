class Vendor < ActiveRecord::Base
  has_many :program_vendor_purchases
  has_many :purchases, through: :program_vendor_purchases
  has_many :programs, through: :program_vendor_purchases
  validates :name, :state, presence: true

  def most_expensive_purchase
    purchases
    .order('purchases.amount DESC')
    .limit(1)
    .take
  end

  def self.total_earned
    select("SUM(purchases.amount) as total_earned, vendors.id, vendors.name")
    .joins(:purchases)
    .group(:id)
    .order("total_earned DESC")
  end
end
