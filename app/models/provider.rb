class Provider < ActiveRecord::Base
  belongs_to :user
  has_many :parents
  validates_presence_of :company_name, :amount_of_kids_allowed
end

def self.search(search)
  'SELECT * FROM @parents'
end