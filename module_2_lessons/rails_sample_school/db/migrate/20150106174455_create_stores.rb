class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.integer :address
      t.string :size
    end
  end
end
