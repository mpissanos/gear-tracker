class User < ActiveRecord::Base
  validates_presence_of :username
  has_secure_password
  has_many :items
  
end