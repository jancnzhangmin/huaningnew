class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :content
  has_many :remark
end
