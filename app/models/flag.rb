class Flag < ApplicationRecord
  validates_presence_of :user, :purchase, presence: true
  belongs_to :user
  belongs_to :purchase
end
