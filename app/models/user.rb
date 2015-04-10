class User < ActiveRecord::Base
  validates_uniqueness_of :handle
  validates_uniqueness_of :email
  validates_presence_of :handle
  validates_presence_of :email
  validates_presence_of :password

  has_many :tweets

  has_many :followers, through: :followers_relation, source: :follower
  has_many :followers_relation, foreign_key: :followee_id, class_name: "FollowerRelationship"

  has_many :followees, through: :followees_relation, source: :followee
  has_many :followees_relation, foreign_key: :follower_id, class_name: "FollowerRelationship"
end
