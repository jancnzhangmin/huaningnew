class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :name
      t.string :login
      t.string :password_digest
      t.string :auth
      t.integer :status

      t.timestamps null: false
    end
  end
end
