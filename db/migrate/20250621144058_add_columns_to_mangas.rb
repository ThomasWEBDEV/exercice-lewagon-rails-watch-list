class AddColumnsToMangas < ActiveRecord::Migration[8.0]
  def change
    add_column :mangas, :overview, :text
    add_column :mangas, :poster_url, :string
    add_column :mangas, :rating, :float
  end
end
