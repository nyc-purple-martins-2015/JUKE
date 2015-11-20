class CreateGuestSetlists < ActiveRecord::Migration
  def change
    create_table :guest_setlists do |t|
      t.references :user, null: false
      t.references :setlist, null: false

      t.timestamps null: false
    end
  end
end
