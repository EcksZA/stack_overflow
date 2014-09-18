class User < ActiveRecord::Base
  validates :name, :email, presence: true, uniqueness: true
  has_many :questions
  has_secure_password
end
