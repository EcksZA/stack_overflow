class QuestionsController < ApplicationsController
  before_action :authorize, except: [:index, :show]

  def index
    @questions = Questions.all
  end
end
