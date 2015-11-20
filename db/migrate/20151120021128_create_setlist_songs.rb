class CreateSetlistSongs < ActiveRecord::Migration
  def change
    create_table :setlist_songs do |t|
      t.references :setlist, null: false
      t.references :song, null: false
      t.integer :list_status, default: 0, null: false

      t.timestamps null: false
    end
  end
end
