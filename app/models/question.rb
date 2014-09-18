class Question < ActiveRecord::Base
  validates :title, presence: true
  validates :question, presence: true
  validates :user_id, presence: true
  belongs_to :user
end
