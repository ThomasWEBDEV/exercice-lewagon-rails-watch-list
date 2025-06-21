class RenameMovieIdToMangaIdInBookmarks < ActiveRecord::Migration[7.0]
  def change
    rename_column :bookmarks, :movie_id, :manga_id
  end
end
