class CreateLabs < ActiveRecord::Migration
  def change
    create_table :labs do |t|
      t.string :name
      t.string :description
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
