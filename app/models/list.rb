class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_many :reviews, dependent: :destroy # <-- AJOUTEZ CETTE LIGNE
  validates :name, uniqueness: true, presence: true
end
