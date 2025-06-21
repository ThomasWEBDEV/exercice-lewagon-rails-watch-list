# app/models/bookmark.rb
class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :manga

  validates :comment, length: { minimum: 6 }
  validates :manga, uniqueness: { scope: :list }
end
