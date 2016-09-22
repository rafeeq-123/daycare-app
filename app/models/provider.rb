class Provider < ActiveRecord::Base
  has_many :parents
  has_many :kids, through: :parents
  validates_presence_of :company_name, :amount_of_kids_allowed


end