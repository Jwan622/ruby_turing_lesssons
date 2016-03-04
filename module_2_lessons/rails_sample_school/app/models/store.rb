class Store < ActiveRecord::Base
  has_many :items
  has_many :stores_customers
  has_many :customers, through: :stores_customers

end
