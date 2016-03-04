class CreatePizzas < ActiveRecord::Migration
  def change
    create_table :pizzas do |t|
      t.string :crust
      t.integer :displayable_id
      t.string :displayable_type

      t.timestamps null: false
    end
  end
end
