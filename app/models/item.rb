class Item < ActiveRecord::Base
  validates_presence_of :name, :brand
  belongs_to :user
end