class Pizza < ActiveRecord::Base
  belongs_to :displayable, polymorphic: true
end
