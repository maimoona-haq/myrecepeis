class RecipeIngreedient < ApplicationRecord
    belongs_to :ingreedient
    belongs_to :recipe
end
