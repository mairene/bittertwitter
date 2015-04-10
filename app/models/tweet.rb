class Tweet < ActiveRecord::Base
  validates_length_of :message, :maximum => 140
  validates_presence_of :message

  belongs_to :user
end
