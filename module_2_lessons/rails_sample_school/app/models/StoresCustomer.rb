class StoresCustomer < ActiveRecord::Base
  belongs_to :store
  belongs_to :customer

end
