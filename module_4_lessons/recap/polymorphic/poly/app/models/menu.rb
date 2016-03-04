class Menu < ActiveRecord::Base
  has_many :pizzas, as: :displayable
end
