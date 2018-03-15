class Recipe < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true, length: {minimum: 5, maximum: 500}
    belongs_to :chef
    default_scope -> {order(updated_at: :desc)}
    has_many :recipe_ingreedients
    has_many :ingreedients, through: :recipe_ingreedients
    has_many :comments, dependent: :destroy
end