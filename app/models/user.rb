class User < ActiveRecord::Base
  validates_uniqueness_of :handle
  validates_uniqueness_of :email
  validates_presence_of :handle
  validates_presence_of :email
  validates_presence_of :password

  has_many :tweets
end
