class User < ActiveRecord::Base
  has_secure_password
  has_one :profile
  has_many :posts
  accepts_nested_attributes_for :profile
  validates :password, confirmation: true
  validates :email, presence: true
end
