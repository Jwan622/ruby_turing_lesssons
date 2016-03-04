class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|    #create_table is a method from ActiveRecord::Migration. It's a method.
      t.string :name
      t.string :city
    end
  end
end
