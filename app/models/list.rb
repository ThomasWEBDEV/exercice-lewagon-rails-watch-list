# app/models/list.rb
class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_many :reviews, dependent: :destroy # C'est bien de l'avoir déjà !
  validates :name, uniqueness: true, presence: true

  # Cette ligne est cruciale pour Active Storage
  has_one_attached :photo
end
