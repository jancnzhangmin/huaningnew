class CreateAdverts < ActiveRecord::Migration
  def change
    create_table :adverts do |t|
      t.string :title
      t.string :link
      t.integer :active
      t.attachment :advert

      t.timestamps null: false
    end
  end
end
