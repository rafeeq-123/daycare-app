class Parent < ActiveRecord::Base
  belongs_to :user
  belongs_to :provider
  validates_presence_of :name, :child_name, :schedule
end
