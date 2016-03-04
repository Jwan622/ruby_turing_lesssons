class CreateStoresCustomres < ActiveRecord::Migration
  def change
    create_table :stores_customres do |t|
      t.integer :store_id
      t.integer :customer_id
    end
  end
end
