class RemoveCocktailFromIngredient < ActiveRecord::Migration[5.2]
  def change
    remove_reference :ingredients, :cocktail, foreign_key: true
  end
end
