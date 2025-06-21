class CreateMangas < ActiveRecord::Migration[8.0]
  def change
    create_table :mangas do |t|
      t.string :title
      t.string :author
      t.text :description

      t.timestamps
    end
  end
end
