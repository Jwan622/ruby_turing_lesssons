class CreateUserPlaces < ActiveRecord::Migration
  def change
    create_table :user_places do |t|
      t.references :user, index: true    #these columns are what is actually creating a user_id column in the UserPlaces database.
      t.references :place, index: true

      t.timestamps null: false
    end
    add_foreign_key :user_places, :users   #so if you have a userplace, ir cannot refer to a user that does not exist
    add_foreign_key :user_places, :places    #creates a constraint that the user_id column actually needs to refernce a real user.id
  end
end
