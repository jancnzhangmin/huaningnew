class AddKeywordToContents < ActiveRecord::Migration
  def change
    add_column :contents, :keyword, :string
    add_column :contents, :isshiping, :integer
  end
end
