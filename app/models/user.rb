class User < ActiveRecord::Base
  has_secure_password
  validates :name, :email, presence: true, uniqueness: true
  has_many :questions
  has_many :answers, through: :questions
end
