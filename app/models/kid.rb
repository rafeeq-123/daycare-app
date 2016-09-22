class Kid < ActiveRecord::Base
  belongs_to :parent
  validates_presence_of :name
  validates_presence_of :age

end