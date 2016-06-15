class CreateClas < ActiveRecord::Migration
  def change
    create_table :clas do |t|
      t.string :title
      t.string :keyword

      t.timestamps null: false
    end
  end
end
