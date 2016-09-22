class Parent < ActiveRecord::Base
  has_many :kids
  validates_presence_of :name

end