class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :summary
      t.integer :content_id
      t.integer :user_id
      t.integer :isshow

      t.timestamps null: false
    end
  end
end
