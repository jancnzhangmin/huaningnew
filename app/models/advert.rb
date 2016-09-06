class Advert < ActiveRecord::Base
  has_attached_file :advert, :url => "/:attachment/:id/:basename.:extension",  :path => ":rails_root/public/:attachment/:id/:basename.:extension"
  do_not_validate_attachment_file_type :advert
end
