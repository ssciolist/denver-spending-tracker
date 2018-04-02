class ProgramVendorPurchase < ActiveRecord::Base
  belongs_to :program
  belongs_to :vendor
  belongs_to :purchase
end
