class AddIsnewToContents < ActiveRecord::Migration
  def change
    add_column :contents, :isnew, :integer
  end
end
