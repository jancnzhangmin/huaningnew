class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.datetime :pvdate
      t.integer :pv

      t.timestamps null: false
    end
  end
end
