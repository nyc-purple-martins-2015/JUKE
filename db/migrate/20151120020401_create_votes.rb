class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, null: false
      t.references :setlist_song, null: false
      t.integer :value, null: false

      t.timestamps null: false
    end
  end
end
