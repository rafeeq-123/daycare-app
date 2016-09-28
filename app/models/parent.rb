class Parent < ActiveRecord::Base
  belongs_to :provider
  validates_presence_of :name, :child_name, :schedule

 #  def self.vaild?
 #   if  @parent.include?(name,child_name,schedule)
 #  else
 #    "bla bla wrong, puto!"
 #  end
 # end
end
