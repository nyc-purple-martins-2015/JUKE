class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :email
      t.string :uid
      t.string :provider

      t.timestamps null: false
    end
  end
end
