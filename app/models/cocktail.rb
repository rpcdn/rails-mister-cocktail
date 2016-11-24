class Cocktail < ApplicationRecord
  # validates :category, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"], allow_nil: false }
  validates :name, uniqueness: true, presence: true
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
end
