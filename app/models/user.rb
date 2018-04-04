class User < ApplicationRecord
  has_secure_password

  validates_presence_of :username
  validates_uniqueness_of :username

  has_many :flags
  has_many :purchases, through: :flags

  enum role: %w(user admin)
end
