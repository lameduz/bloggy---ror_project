class User < ActiveRecord::Base
  has_secure_password
  acts_as_voter
  has_one :profile
  has_many :posts
  has_many :comments
  accepts_nested_attributes_for :profile
  validates :password, confirmation: true
  validates :email, presence: true
end
