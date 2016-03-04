class Teacher < ActiveRecord::Base
  has_many :photos, as: :photoable

 def to_param
   self.last_name
 end
end
