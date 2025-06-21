class FixBookmarksForeignKey < ActiveRecord::Migration[8.0]
  def change
    # Supprimer l'ancienne contrainte qui référence 'movies'
    remove_foreign_key :bookmarks, :movies if foreign_key_exists?(:bookmarks, :movies)

    # Ajouter la nouvelle contrainte qui référence 'mangas'
    add_foreign_key :bookmarks, :mangas unless foreign_key_exists?(:bookmarks, :mangas)
  end
end
