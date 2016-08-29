class User < ActiveRecord::Base
  has_many :comments
 has_secure_password
  validates_uniqueness_of :tel, :case_sensitive =>false

  end

