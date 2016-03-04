class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.references :user
    end
  end
end
