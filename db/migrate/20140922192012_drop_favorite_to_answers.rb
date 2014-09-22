class DropFavoriteToAnswers < ActiveRecord::Migration
  def change
    remove_column :answers, :favorite, :boolean, default: false
  end
end
