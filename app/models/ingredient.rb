class Ingredient < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :doses, dependent: :restrict_with_exception
  has_many :cocktails, through: :doses
end
