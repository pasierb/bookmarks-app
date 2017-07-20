class BookmarksAddTags < ActiveRecord::Migration[5.1]
  def change
    add_column :bookmarks, :tags, :text, array: true, default: []
  end
end
