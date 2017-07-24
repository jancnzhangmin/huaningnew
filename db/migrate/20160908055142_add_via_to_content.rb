class AddViaToContent < ActiveRecord::Migration
  def change
    add_column :contents, :via, :integer
  end
end
