class User < ApplicationRecord
  has_many :articles
  before_save { self.email=email.downcase }
  validates :username, presence: true, uniqueness: { case_sensitive: false } ,length: {minimum:3, maximum:25}
  VALID_EMAIL_REGEXP=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false } ,length: {minimum:3, maximum:50}, format: {with:VALID_EMAIL_REGEXP}
  has_secure_password
end
