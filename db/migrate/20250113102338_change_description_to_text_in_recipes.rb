class ChangeDescriptionToTextInRecipes < ActiveRecord::Migration[7.1]
  def change
    change_column :recipes, :description, :text
  end
end
