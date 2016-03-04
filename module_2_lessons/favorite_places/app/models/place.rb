class Place < ActiveRecord::Base
  has_many :user_places #has no other purpose except for line 3 says Bryce
  has_many :users, through: :user_places
  validates :name, presence: true
end
