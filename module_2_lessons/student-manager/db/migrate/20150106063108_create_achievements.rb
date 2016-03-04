class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string :description
      t.date :awarded_on
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
