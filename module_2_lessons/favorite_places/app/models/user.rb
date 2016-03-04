class User < ActiveRecord::Base
  validates :name, presence: true
  has_many :user_places
  has_many :places, through: :user_places
end
