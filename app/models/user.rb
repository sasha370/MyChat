class User < ApplicationRecord
  require 'bcrypt'
  validates :username, presence: true, length: {minimum: 3, maximum: 20}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 3, maximum: 20}
  has_many :messages
  has_secure_password
end
