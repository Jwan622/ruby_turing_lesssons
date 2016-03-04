class ChangeColumn < ActiveRecord::Migration
  def change
    add_column :students, :is_alumnus, :boolean
  end
end
