class Recipe < ApplicationRecord
  has_many :bookmarks
  validates :description, presence: true
  validates :name, uniqueness: true
  validates :rating, inclusion: { in: 0..10 }
end
