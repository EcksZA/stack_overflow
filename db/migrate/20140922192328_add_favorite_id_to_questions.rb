class AddFavoriteIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :favorite_id, :integer
  end
end
