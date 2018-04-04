class Program < ActiveRecord::Base
  validates :name, presence: true
  has_many :program_vendor_purchases
  has_many :purchases, through: :program_vendor_purchases
  has_many :vendors, through: :program_vendor_purchases

  def most_expensive_purchase
    purchases
    .order('purchases.amount DESC')
    .limit(1)
    .take
  end

  def most_common_vendor
    vendors
    .select('COUNT(vendors.id) as vendor_count, vendors.name')
    .group('vendors.id')
    .order('vendor_count DESC')
    .limit(1)
    .take
  end


  def self.total_spent
    select("SUM(purchases.amount) as total_spent, programs.id, programs.name")
    .joins(:purchases)
    .group(:id)
    .order("total_spent DESC")
  end
end
