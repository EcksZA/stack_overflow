class Question < ActiveRecord::Base
  validates :title, presence: true
  validates :question, presence: true
  validates :user_id, presence: true
  belongs_to :user
  has_many :answers #, foreign_key: 'question_id', class_name: 'Answer'
  belongs_to :favorite, class_name: 'Answer'
end
