class AddAverageRatingToCoktails < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :average_rating, :float
  end
end
