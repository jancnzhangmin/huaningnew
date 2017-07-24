class AddAttachmentContentimediaToContents < ActiveRecord::Migration
  def self.up
    change_table :contents do |t|
      t.attachment :contentimedia
    end
  end

  def self.down
    remove_attachment :contents, :contentimedia
  end
end
