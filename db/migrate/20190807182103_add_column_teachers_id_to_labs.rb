class AddColumnTeachersIdToLabs < ActiveRecord::Migration
  def change
    add_column :labs, :teacher_id, :integer
  end
end
