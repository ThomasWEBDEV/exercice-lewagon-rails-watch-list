# app/models/manga.rb
class Manga < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :lists, through: :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
  validates :rating, presence: true, inclusion: { in: 0.0..10.0 }
  validates :poster_url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]) }
end
