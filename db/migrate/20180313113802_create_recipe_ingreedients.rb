class CreateRecipeIngreedients < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_ingreedients do |t|
      t.integer :recipe_id
      t.integer :ingreedient_id
    end
  end
end
