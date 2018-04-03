class User < ApplicationRecord
  has_secure_password

  validates_presence_of :username
  validates_uniqueness_of :username

  has_many :flags
end
