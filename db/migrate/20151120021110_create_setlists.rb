class CreateSetlists < ActiveRecord::Migration
  def change
    create_table :setlists do |t|
      t.references :user, null: false
      t.string :name, null: false
      t.string :invite_code, null: false
      t.string :list_spotify_url, null: false

      t.timestamps null: false
    end
  end
end
