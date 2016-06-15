class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :title
      t.string :link
      t.integer :active

      t.timestamps null: false
    end
  end
end
