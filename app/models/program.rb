class Program < ActiveRecord::Base
  validates :name, presence: true
end
