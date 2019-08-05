class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :user_name
      t.integer :class_year
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
