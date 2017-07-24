class AddAttachmentBannerToBanners < ActiveRecord::Migration
  def self.up
    change_table :banners do |t|
      t.attachment :banner
    end
  end

  def self.down
    remove_attachment :banners, :banner
  end
end
