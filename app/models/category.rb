class Category < ApplicationRecord
  has_many :bookmarks, through: :bookmarks, dependent: :destroy
  has_many :recipes
  validates :name, uniqueness: true
end
