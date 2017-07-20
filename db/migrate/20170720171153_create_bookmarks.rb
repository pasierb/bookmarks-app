class CreateBookmarks < ActiveRecord::Migration[5.1]
  def change
    create_table :bookmarks do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.string :short
      t.integer :site_id, null: false

      t.timestamps
    end

    add_foreign_key :bookmarks, :sites
    add_index :bookmarks, :title
    add_index :bookmarks, :url
    add_index :bookmarks, :short
  end
end
