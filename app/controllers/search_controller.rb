class SearchController < ApplicationController

  def index
    @search = Question.search params[:search]
      redirect_to root_path
  end
end
