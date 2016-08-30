class User < ActiveRecord::Base
  has_many :comments
 has_secure_password
  validates :tel, :presence => true, :uniqueness =>{:message => "号码已经被注册"}
  validates :name, :presence => true, :uniqueness =>{:message => "用户名已经被注册"}
  end

