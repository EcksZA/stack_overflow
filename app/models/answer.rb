class Answer < ActiveRecord::Base

  validates :answer, :question_id, :user_id, presence: true
  belongs_to :question
  belongs_to :user
end
