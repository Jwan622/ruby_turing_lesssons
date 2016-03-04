class Website < ActiveRecord::Base
  has_many :pizzas, as: :displayable
end
