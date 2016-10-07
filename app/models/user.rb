class User < ActiveRecord::Base
  has_many :providers
  has_many :parents
  has_secure_password
  validates_presence_of :username, :email, :password
  validates_uniqueness_of :email
  def self.authenticate
  end
end