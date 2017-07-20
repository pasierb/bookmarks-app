class CreateSites < ActiveRecord::Migration[5.1]
  def change
    create_table :sites do |t|
      t.string :url, null: false

      t.timestamps
    end

    add_index :sites, :url, unique: true
  end
end
