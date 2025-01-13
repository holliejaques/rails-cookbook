class ChangeRatingToFloatInRecipes < ActiveRecord::Migration[7.1]
  def change
    change_column :recipes, :rating, :float
  end
end
