class AddImageToBookmark < ActiveRecord::Migration[5.1]
  def change
    add_column :bookmarks, :image, :string
  end
end
