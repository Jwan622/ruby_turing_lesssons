class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :course_number
      t.string :difficulty
    end
  end
end
