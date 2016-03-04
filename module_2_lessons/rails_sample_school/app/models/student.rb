class Student < ActiveRecord::Base
  has_many :enrollments    #name of the join table in the database
  has_many :courses, through: :enrollments
end
