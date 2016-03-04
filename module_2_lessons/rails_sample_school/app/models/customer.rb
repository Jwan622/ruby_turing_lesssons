class Customer < ActiveRecord::Base
  has_many :stores_customers
  has_many :stores, through: stores_customer

end
