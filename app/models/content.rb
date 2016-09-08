class Content < ActiveRecord::Base
  has_attached_file :contentimedia, :url => "/:attachment/:id/:basename.:extension",  :path => ":rails_root/public/:attachment/:id/:basename.:extension"
  do_not_validate_attachment_file_type :contentimedia
  has_many :comments
  has_many :articles
end
