class AddCustomImageUrlToBookmarks < ActiveRecord::Migration[8.0]
  def change
    add_column :bookmarks, :custom_image_url, :string
  end
end
