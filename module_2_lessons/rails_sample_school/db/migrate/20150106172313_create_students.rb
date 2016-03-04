class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.date :dob

      t.timestamps
    end
  end
end
