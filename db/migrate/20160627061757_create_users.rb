class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :tel
      t.string :vcode

      t.timestamps null: false
    end
  end
end
