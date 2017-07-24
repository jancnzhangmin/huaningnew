class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title
      t.string :summary
      t.text :content
      t.integer :cla_id
      t.integer :visit

      t.timestamps null: false
    end
  end
end
