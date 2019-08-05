class AddIndexToStudent < ActiveRecord::Migration
  def change
    add_index :students, :user_name, unique: true
  end
end
