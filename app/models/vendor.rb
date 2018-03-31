class Vendor < ActiveRecord::Base
  validates :name, :state, presence: true
end
